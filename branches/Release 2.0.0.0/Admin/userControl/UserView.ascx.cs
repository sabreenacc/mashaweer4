using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
 


public partial class Controls_UserView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    { 
       
    }
    

    protected void btnSignout_Click(object sender, EventArgs e)
    {

        SoftCube.Profile.LogOut();
        Response.Redirect("~/Admin/Login.aspx", true);
    }


}
