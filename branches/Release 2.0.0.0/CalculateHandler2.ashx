<%@ WebHandler Language="C#" Class="CalculateHandler2" %>

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.SessionState;

public class CalculateHandler2 : IHttpHandler, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        var vechileType = context.Request.QueryString["Type"];
        var fromplace = int.Parse(context.Request.QueryString["from"]);
        var toplace = int.Parse(context.Request.QueryString["to"]);
        var db = int.Parse(context.Request.QueryString["db"]);
        var prc = new EmiratePrice();
        if (db == 1)
        {
            prc = Mashaweer.MashaweerDatabaseHandler.Search<EmiratePrice>(x => (x.FromEmirate == fromplace && x.ToEmirate == toplace) || (x.FromEmirate == toplace && x.ToEmirate == fromplace)).SingleOrDefault();
        }
        else
            prc = ((List<EmiratePrice>)context.Session["PriceList"]).Where(
                x =>
                (x.FromEmirate == fromplace && x.ToEmirate == toplace) || (x.FromEmirate == toplace && x.ToEmirate == fromplace)).
                SingleOrDefault();
        if (prc != null)
        {
            var fromplc = Mashaweer.MashaweerDatabaseHandler.Single<EEmirate>(fromplace);
            var toplc = Mashaweer.MashaweerDatabaseHandler.Single<EEmirate>(toplace);

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
                            context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYCAR + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
                    }
                    catch
                    {
                        context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYCAR + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}