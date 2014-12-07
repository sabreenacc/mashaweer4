using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mashaweer;

public partial class Admin_Services_addEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString.AllKeys.Contains("ID"))
            {
                int ret = 0;
                bool result = int.TryParse(Request.QueryString["ID"], out ret);
                if (!result)
                    Response.Redirect("Default.aspx");

                Serviceid = ret;
                filldata();
            }
            else
            {
                Serviceid = 0;
            }
        }
    }

    public int Serviceid
    {
        get { return int.Parse(ViewState["ServiceId"].ToString()); }
        set { ViewState["ServiceId"] = value; }
    }

    protected void btnSaveExit_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("Default.aspx");
        }
    }

    public bool InsertOrUpdate()
    {
        bool success = false;
        if (Serviceid == 0)
        {
             
                Serviceid =
                    int.Parse(
                        new Service
                        {
                            Name = txtName.Text,
                            Description = txtDesc.Text,
                            Image="",
                            Language = int.Parse(ddlLang.SelectedValue) 
                        }.Insert().ToString());
                success = true;
        }
        else
        {
           
                bool isUpdated =
                    new Service
                    { 
                        ServiceId = Serviceid,
                        Name = txtName.Text,
                        Description = txtDesc.Text,
                        Image = "",
                        Language = int.Parse(ddlLang.SelectedValue) 
                    }.Update();
                success = isUpdated;
        }
        return success;
    }

    private void filldata()
    {
        Service objService = MashaweerDatabaseHandler.Single<Service>(Serviceid);

        if (objService != null)
        {
            txtName.Text = objService.Name;
            ddlLang.SelectedValue = objService.Language.ToString();
            txtDesc.Text = objService.Description; 
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?ID=" + Serviceid);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}