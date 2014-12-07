using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mashaweer;

public partial class Admin_Zones_addEdit : System.Web.UI.Page
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

                Zoneid = ret;
                filldata();
            }
            else
            {
                Zoneid = 0;
            }
        }
    }

    public int Zoneid
    {
        get { return int.Parse(ViewState["ZoneId"].ToString()); }
        set { ViewState["ZoneId"] = value; }
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
        lblError.Text = "";
        if (MashaweerDatabaseHandler.Search<Zone>(zn => zn.ArabicName == txtArabicName.Text.Trim() && zn.ZoneId != Zoneid).Count > 0)
            lblError.Text = "يوجد منطقة لها نفس الأسم العربى";
        if (MashaweerDatabaseHandler.Search<Zone>(zn => zn.EnglishName == txtEnglishName.Text.Trim() && zn.ZoneId != Zoneid).Count > 0)
            lblError.Text += "<br/>يوجد منطقة لها نفس الأسم الإنجليزى";
        if (lblError.Text != "")
            return false;
        if (Zoneid == 0)
        {    
                Zoneid =
                    int.Parse(
                        new Zone
                        {
                            ArabicName = txtArabicName.Text.Trim(),
                            EnglishName = txtEnglishName.Text.Trim(),
                            X = 0,
                            Y = 0
                        }.Insert().ToString());
                success = true;
        }
        else
        {
            var zn = MashaweerDatabaseHandler.Single<Zone>(Zoneid);
                bool isUpdated =
                    new Zone
                    {
                        ZoneId = Zoneid,
                        ArabicName = txtArabicName.Text.Trim(),
                        EnglishName = txtEnglishName.Text.Trim(),
                        X = zn.X,
                        Y = zn.Y
                    }.Update();
                success = isUpdated;
        }
        return success;
    }

    private void filldata()
    {
        Zone objZone = MashaweerDatabaseHandler.Single<Zone>(Zoneid);

        if (objZone != null)
        {
            txtArabicName.Text = objZone.ArabicName;
            txtEnglishName.Text = objZone.EnglishName;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?ID=" + Zoneid);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}