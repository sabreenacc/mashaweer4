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
using Mashaweer;

public partial class Admin_User_addEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                UserID = int.Parse(Request.QueryString["id"]);
                var user = MashaweerDatabaseHandler.Single<SysUser>(UserID);
                if (user != null)
                {
                    txtUserName.Text = user.UserName;
                    chkIsActive.Checked = user.IsActive;
                    txtName.Text = user.Name;
                    TypedPassword = user.Password;
                }
            }
        }

    }

    public int UserID
    {
        get { return ViewState["UserID"] == null ? 0 : int.Parse(ViewState["UserID"].ToString()); }
        set { ViewState["UserID"] = value; }
    }

    protected void btnSaveExit_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected string TypedPassword
    {
        get
        {
            if (ViewState["TypedPassword"] != null)
            {
                return Convert.ToString(ViewState["TypedPassword"]);
            }
            return null;
        }
        set
        {
            ViewState["TypedPassword"] = value;
        }
    }
    public bool InsertOrUpdate()
    {
        bool success = false;
        if (UserID == 0)
        {
            UserID = int.Parse(new SysUser
                    {
                        Name = txtName.Text,
                        UserName = txtUserName.Text,
                        Password = Helper.Encrypt(txtPassword.Text.Trim()),
                        IsActive = chkIsActive.Checked,
                        CreatedDate = DateTime.UtcNow
                    }.Insert().ToString());


            success = true;
        }
        else
        {
            if (txtPassword.Text.Trim() == "")

                success = new SysUser
                {
                    UserID = UserID,
                    Name = txtName.Text,
                    UserName = txtUserName.Text,
                    IsActive = chkIsActive.Checked,
                    Password = TypedPassword,
                    CreatedDate = DateTime.UtcNow
                }.Update();
            else
                success = new SysUser
                              {
                                  UserID = UserID,
                                  Name = txtName.Text,
                                  UserName = txtUserName.Text,
                                  Password = Helper.Encrypt(txtPassword.Text.Trim()),
                                  IsActive = chkIsActive.Checked,
                                  CreatedDate = DateTime.UtcNow
                              }.Update();
        }
        return success;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?id=" + UserID);
        }
    }
}
