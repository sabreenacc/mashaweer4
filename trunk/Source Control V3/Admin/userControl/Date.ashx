<%@ WebHandler Language="C#" Class="Date" %>

using System;
using System.Web;


public class Date : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string date = context.Request.QueryString["date"];
        if (Helper.Date.IsHijri(date))
        {

            string result = "{" + Helper.Date.HijriToGreg(date) + " ميلادى}";
            context.Response.Write(result);
            context.Response.End();
        }
        else
            if (Helper.Date.IsGreg(date))
            {
                string result;
                if (context.Request.QueryString["type"] == "1")
                    result = "{" + Helper.Date.GregToHijri(Convert.ToDateTime(date)) + "}";
                else
                    result = "{" + Helper.Date.GregToHijri(Convert.ToDateTime(date)) + " هجرى}";
                context.Response.Write(result);
                context.Response.End();
            }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}