using Mashaweer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ResetCred : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            lblError.Text ="تم التغيير";
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string ss = Helper.Encrypt(txtPassword.Text.Trim());
        int chk = MashaweerDatabaseHandler.Search<SysUser>(p => p.Name ==SoftCube.Profile.UserName && p.Password == Helper.Encrypt(txtPassword.Text.Trim())).Count;
        if (chk != 0)
        {
            var x = MashaweerDatabaseHandler.Search<SysUser>(p => p.Name == SoftCube.Profile.UserName && p.Password == Helper.Encrypt(txtPassword.Text)).FirstOrDefault();
            x.Password = Helper.Encrypt(txtPassword2.Text.Trim());
            x.UserName = txtUserName.Text;
            x.Update();
        }
        else
        {
            lblError.Text = Helper.GetGeneralMessage("InvalidUserNameOrPassword");
        }
    }
}