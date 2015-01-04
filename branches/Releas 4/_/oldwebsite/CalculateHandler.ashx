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
        var vechileType = context.Request.QueryString["Type"];
        var fromplace = int.Parse(context.Request.QueryString["from"]);
        var toplace = int.Parse(context.Request.QueryString["to"]);
        var db = int.Parse(context.Request.QueryString["db"]);
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
                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.MotorcyclePrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
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
                    context.Response.Write(Resources.LanguageFile.CALCULATOR_COST + Resources.LanguageFile.FROM + "<span class='grayspan'> " + frmName + "</span> " + Resources.LanguageFile.TO + "<span class='grayspan'> " + toName + "</span> :<span class='grayspan'> " + prc.CarPrice.ToString("0.#####") + " " + Resources.LanguageFile.AED + "</span> " + Resources.LanguageFile.BYMOTORCYCLE + " <input type='button' id='clearmapcalculations' class='snd-btn' value='" + Resources.LanguageFile.RESET + "' />");
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