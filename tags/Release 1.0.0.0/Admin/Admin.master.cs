using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SoftCube;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!SoftCube.Profile.IsAuthenticated)
        {
            if (!SoftCube.Profile.Login())
                Response.Redirect("~/Admin/Login.aspx?return=" + Request.Url.PathAndQuery);
        }
    }
}
