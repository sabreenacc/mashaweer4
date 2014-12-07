using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mashaweer;

public partial class Admin_News_addEdit : System.Web.UI.Page
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

                Newid = ret;
                filldata();
            }
            else
            {
                Newid = 0;
            }
        }
    }

    public int Newid
    {
        get { return int.Parse(ViewState["NewId"].ToString()); }
        set { ViewState["NewId"] = value; }
    }
    private DateTime oldCreatedDate
    {
        get { return DateTime.Parse(ViewState["oldCreatedDate"].ToString()); }
        set { ViewState["oldCreatedDate"] = value; }
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
        if (Newid == 0)
        {
            var createdDate = new DateTime();

            try
            {
                TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Arabian Standard Time");
                createdDate = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, easternZone);
            }
            catch
            {
                createdDate = DateTime.UtcNow;
            }

            Newid =
                int.Parse(
                    new New
                    {
                        Title = txtTitle.Text,
                        Description = txtDesc.Text,
                        Language = int.Parse(ddlLang.SelectedValue),
                        CreatedDate = createdDate
                    }.Insert().ToString());
            success = true;
        }
        else
        {

            bool isUpdated =
                new New
                {
                    NewID = Newid,
                    Title = txtTitle.Text,
                    Description = txtDesc.Text,
                    CreatedDate = oldCreatedDate,
                    Language = int.Parse(ddlLang.SelectedValue)
                }.Update();
            success = isUpdated;
        }
        return success;
    }

    private void filldata()
    {
        New objNew = MashaweerDatabaseHandler.Single<New>(Newid);

        if (objNew != null)
        {
            txtTitle.Text = objNew.Title;
            ddlLang.SelectedValue = objNew.Language.ToString();
            txtDesc.Text = objNew.Description;
            oldCreatedDate = objNew.CreatedDate;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?ID=" + Newid);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}