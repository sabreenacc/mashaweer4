using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SoftCube;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string userName = HttpContext.Current.Request.Cookies["MashaweersoftCubeAdminU"] == null ? "" : (HttpContext.Current.Request.Cookies["MashaweersoftCubeAdminU"]["User"] == null ? "" : HttpContext.Current.Request.Cookies["softCubeAdminU"]["User"]);
            string password = (HttpContext.Current.Request.Cookies["MashaweersoftCubeAdminU"] == null ? "" : HttpContext.Current.Request.Cookies["MashaweersoftCubeAdminU"]["Pass"]);


            if (userName != String.Empty && password != String.Empty)
                if (SoftCube.Profile.LoginUser(userName, password, false))
                {
                    Response.Redirect("~/Admin/Default.aspx");
                }



        }
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {


        if (SoftCube.Profile.LoginUser(txtUserName.Text, txtPassword.Text, chkRember.Checked))
            {


                if (Request.QueryString["return"] != null && Request.QueryString["return"]!=string.Empty)
                    Response.Redirect("" + Request.QueryString["return"]);
                else
                     Response.Redirect("~/Admin/Default.aspx");
            
            }
            else
            {
                lblError.Text = Helper.GetGeneralMessage("InvalidUserNameOrPassword");
            }
        
    }
}
