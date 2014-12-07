<%@ WebHandler Language="C#" Class="CalculateHandler" %>

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.SessionState;

public class CalculateHandler : IHttpHandler, IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {    
        
        context.Response.ContentType = "text/plain";
        var FilterZones = context.Request.QueryString["FilterZones"];
        var FilterZones2 = context.Request.QueryString["FilterZones2"];
        var vechileType = context.Request.QueryString["Type"];
        var fromEmirate = context.Request.QueryString["fromEmirate"] != null ? int.Parse(context.Request.QueryString["fromEmirate"]) : 0;
        var toEmirate = context.Request.QueryString["toEmirate"] != null ? int.Parse(context.Request.QueryString["toEmirate"]) : 0;
        var db = context.Request.QueryString["db"] !=null ?  int.Parse(context.Request.QueryString["db"]) : 0;
        if (FilterZones != null)
        {

            var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));
            System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
            System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
            
            
            var Zone = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(a => a.EmirateId == fromEmirate)
                .Select(z => new { val = z.ZoneId, name = Globals.MashaweerLanguage == "en" ? z.EnglishName : z.ArabicName}).ToList();
            var Result = Zone.Aggregate("", (current, a) => current + ("<option value='" + a.val + "'>" + a.name + "</option>"));
            context.Response.Write(Result);  
        }

        else if (FilterZones2 != null)
        {
            var Zone = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(a => a.EmirateId == toEmirate)
                .Select(z => new { val = z.ZoneId, name = Globals.MashaweerLanguage == "en" ? z.EnglishName : z.ArabicName }).ToList();
            var Result = Zone.Aggregate("", (current, a) => current + ("<option value='" + a.val + "'>" + a.name + "</option>"));
            context.Response.Write(Result);
        }  

        else if (FilterZones == null && FilterZones2 == null)
        {
            var fromplace = context.Request.QueryString["from"] != "null" ? int.Parse(context.Request.QueryString["from"]) : 0;
            var toplace = context.Request.QueryString["to"] != "null" ? int.Parse(context.Request.QueryString["to"]) : 0;

            if (fromplace == 0 || toplace == 0) // call emiratePrice
            {
                var prcE = new EmiratePrice();

                if (db == 1)
                {                        
                    prcE = Mashaweer.MashaweerDatabaseHandler.Search<EmiratePrice>(
                    x => (x.FromEmirate == fromEmirate && x.ToEmirate == toEmirate) || (x.FromEmirate == toEmirate && x.ToEmirate == fromEmirate)).SingleOrDefault();
                }
                else
                    prcE = ((List<EmiratePrice>)context.Session["PriceList"]).Where(
                        x =>
                        (x.FromEmirate == fromEmirate && x.ToEmirate == toEmirate) || (x.ToEmirate == toEmirate && x.FromEmirate == fromEmirate)).
                        SingleOrDefault();
                if (prcE != null)
                {
                    var fromplc = Mashaweer.MashaweerDatabaseHandler.Single<EEmirate>(fromEmirate);
                    var toplc = Mashaweer.MashaweerDatabaseHandler.Single<EEmirate>(toEmirate);

                    var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));

                    System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
                    System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
                    var frmName = Globals.MashaweerLanguage == "en"
                                      ? fromplc.EnglishName
                                      : fromplc.ArabicName;
                    var toName = Globals.MashaweerLanguage == "en"
                                      ? toplc.EnglishName
                                      : toplc.ArabicName;

                    if (vechileType == "1")
                    {
                        if (prcE.MotorcyclePrice >= 0)
                        {
                            try
                            {
                                if (context.Request.QueryString["order"] == "1")
                                    context.Response.Write(prcE.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED);
                                else
                                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prcE.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                            catch
                            {
                                context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prcE.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                        }
                        else if (prcE.MotorcyclePrice == 0)
                        {
                            context.Response.Write(prcE.MotorcyclePrice.ToString("0.#####"));
                        }
                    }
                    else
                    {
                        if (prcE.CarPrice > 0)
                        {
                            try
                            {
                                if (context.Request.QueryString["order"] == "1")

                                    context.Response.Write(prcE.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED);
                                else

                                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prcE.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                            catch
                            {
                                context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prcE.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                        }
                        else if (prcE.CarPrice == 0)
                        {
                            context.Response.Write(prcE.CarPrice.ToString("0.#####"));
                        }
                    }
                }
                else
                    context.Response.Write("0");
            }
            
            
            
            else
            {
                var prc = new ZonePrice();
                if (db == 1)
                    prc = Mashaweer.MashaweerDatabaseHandler.Search<ZonePrice>(
                    x => (x.FromZone == fromplace && x.ToZone == toplace) || (x.FromZone == toplace && x.ToZone == fromplace)).
                    SingleOrDefault();
                else
                    prc = ((List<ZonePrice>)context.Session["PriceList"]).Where(
                        x =>
                        (x.FromZone == fromplace && x.ToZone == toplace) || (x.FromZone == toplace && x.ToZone == fromplace)).
                        SingleOrDefault();
                if (prc != null)
                {
                    var fromplc = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(fromplace);
                    var toplc = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(toplace);

                    var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));

                    System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
                    System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
                    var frmName = Globals.MashaweerLanguage == "en"
                                      ? fromplc.EnglishName
                                      : fromplc.ArabicName;
                    var toName = Globals.MashaweerLanguage == "en"
                                      ? toplc.EnglishName
                                      : toplc.ArabicName;

                    if (vechileType == "1")
                    {
                        if (prc.MotorcyclePrice >= 0)
                        {
                            try
                            {
                                if (context.Request.QueryString["order"] == "1")
                                    context.Response.Write(prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED);
                                else
                                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                            catch
                            {
                                context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                        }
                        else if (prc.MotorcyclePrice == 0)
                        {
                            context.Response.Write(prc.MotorcyclePrice.ToString("0.#####"));
                        }
                    }
                    else
                    {
                        if (prc.CarPrice > 0)
                        {
                            try
                            {
                                if (context.Request.QueryString["order"] == "1")

                                    context.Response.Write(prc.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED);
                                else

                                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                            catch
                            {
                                context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                            }
                        }
                        else if (prc.CarPrice == 0)
                        {
                            context.Response.Write(prc.CarPrice.ToString("0.#####"));
                        }
                    }
                }
                else
                    context.Response.Write("0");
            }
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}