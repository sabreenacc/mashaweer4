using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Service : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        ltrlServiceTitle.Text = Resources.LanguageFile.Services_Title;
        ltrlServiceParagraph.Text = Resources.LanguageFile.SERVICES_PARAGRAPH;
        //ltrlMashaweerWall.Text = Resources.LanguageFile.WRITE_ON_MASHAWEER_WALL;
    }
}
