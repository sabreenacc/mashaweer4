using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Options : System.Web.UI.Page
{
    protected string lng = "en";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            ltrlServiceTitle.Text = Resources.LanguageFile.OPTIONS_TITLE;
            Button1.Text = Resources.LanguageFile.DUBAI;
            Button2.Text = Resources.LanguageFile.ABUDHABI;
            Button5.Text = Resources.LanguageFile.ACROSS_EMIRATES;
            Button3.Text = Resources.LanguageFile.SHARJAH;
            Button4.Text = Resources.LanguageFile.AJMAN;
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calculator.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calculator4.aspx");
    }
    
    protected void  Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calculator2.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calculator3.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Emirates.aspx");
    }
}