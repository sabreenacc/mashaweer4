using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _FAQ : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        ltrlFAQTitle.Text = Resources.LanguageFile.FAQ;
        //ltrlMashaweerWall.Text = Resources.LanguageFile.WRITE_ON_MASHAWEER_WALL;
    }
}
