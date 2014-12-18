using System;
using System.Collections.Specialized;
using System.Globalization;
using System.Web;
public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        string lang ="";
        try
        {
             lang = Request.QueryString["lang"].ToString();
            if (Request.QueryString["lang"].ToString() != null)
            {
                var cookie = new HttpCookie("MashaweerLanguage");
                cookie["Language"] = lang;
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
        }
        catch
        { }
        if (lang != "" &&(lang=="en" || lang=="ar"))
        {
            Globals.MashaweerLanguage = lang; //HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null ? "en" : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null ? "en" : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);
        }
        else
        {
            Globals.MashaweerLanguage = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null ? "en" : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null ? "en" : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);
        }
        //Create culture info object 
        var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));
        Page.Culture = ci.Name;
        Page.UICulture = ci.Name;

        System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
        System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);

       // string rr = Request.QueryString["lang"].ToString();
        //Request.QueryString["lang"].ToString();
        //Response.Redirect(Request.Url + "?lang=en");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
        btnArabicLanguage.Visible = (Globals.MashaweerLanguage == "en");
        btnEnglishLanguage.Visible = (Globals.MashaweerLanguage == "ar");
    
    }
    protected void BtnEnglishLanguageClick(object sender, EventArgs e)
    {
        var cookie = new HttpCookie("MashaweerLanguage");
        cookie["Language"] = "en";
        HttpContext.Current.Response.Cookies.Add(cookie);

     

        Globals.MashaweerLanguage = "en";

        //Create culture info object 
        var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));

        System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
        System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
        string url=Request.Url.ToString();
       if(url.Contains("lang"))
       {
           if(url.Contains("ar"))
           {
              url= url.Replace("ar", "en");
           }
       }
       else
       {
           url = url + "?lang=en";
       }
        Response.Redirect(url);
    }
    protected void BtnArabicLanguageClick(object sender, EventArgs e)
    {
        var cookie = new HttpCookie("MashaweerLanguage");
        cookie["Language"] = "ar";
        HttpContext.Current.Response.Cookies.Add(cookie);

        Globals.MashaweerLanguage = "ar";

        //Create culture info object 
        var ci = new CultureInfo(Globals.MashaweerLanguage + (Globals.MashaweerLanguage == "ar" ? "-AE" : "-US"));

        System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
        System.Threading.Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
        string url = Request.Url.ToString();
        if (url.Contains("lang"))
        {
            if (url.Contains("en"))
            {
              url=  url.Replace("en", "ar");
            }
        }
        else
        {
            url = url + "?lang=ar";
        }
        Response.Redirect(url);
    }
}
