using Resources;
using System;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Controls_Service : UserControl
{
    protected Literal ltrlServicesHome;
    protected Literal ltrlServiceTitle;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ltrlServiceTitle.Text = LanguageFile.KNOW_MORE_ABOUT_SERVICES;
        this.ltrlServicesHome.Text = LanguageFile.SERVICES_HOMEPAGE;
    }

    protected HttpApplication ApplicationInstance
    {
        get
        {
            return this.Context.ApplicationInstance;
        }
    }

    protected DefaultProfile Profile
    {
        get
        {
            return (DefaultProfile) this.Context.Profile;
        }
    }
}

