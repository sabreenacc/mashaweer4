using Resources;
using System;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Controls_LatestNews : UserControl
{
    protected Literal ltrlNewsComingSoon;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ltrlNewsComingSoon.Text = LanguageFile.NEWS_COMING_SOON;
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

