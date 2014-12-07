using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using Mashaweer;

public partial class Admin_Price_addEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!Request.QueryString.AllKeys.Contains("ID"))
                Response.Redirect("Default.aspx");
            int ret = 0;
            bool result = int.TryParse(Request.QueryString["ID"], out ret);
            if (!result)
                Response.Redirect("Default.aspx");
            PriceID = ret;
            if (ret != 0)
                fillPrice();
        }
    }

    public int PriceID
    {
        get { return int.Parse(ViewState["PriceId"].ToString()); }
        set { ViewState["PriceId"] = value; }
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
        if (PriceID == 0)
        {
            if (MashaweerDatabaseHandler.Search<ZonePrice>(zp => (zp.FromZone == int.Parse(ddlFromZone.SelectedValue) && zp.ToZone == int.Parse(ddlToZone.SelectedValue)) || (zp.ToZone == int.Parse(ddlFromZone.SelectedValue) && zp.FromZone == int.Parse(ddlToZone.SelectedValue))).Count == 0)
            {
                PriceID =
                    int.Parse(
                        new ZonePrice
                            {
                                FromZone = int.Parse(ddlFromZone.SelectedValue),
                                ToZone = int.Parse(ddlToZone.SelectedValue),
                                CarPrice = decimal.Parse(txtCarPrice.Text),
                                MotorcyclePrice = decimal.Parse(txtMotorCyclePrice.Text)
                            }.Insert().ToString());
                success = true;
            }
            else
            {
                lblError.Text = "هذه المنطقتين مسجل السعر بينهم من قبل";
            }
        }
        else
        {
            if (MashaweerDatabaseHandler.Search<ZonePrice>(zp => ((zp.FromZone == int.Parse(ddlFromZone.SelectedValue) && zp.ToZone == int.Parse(ddlToZone.SelectedValue)) || (zp.ToZone == int.Parse(ddlFromZone.SelectedValue) && zp.FromZone == int.Parse(ddlToZone.SelectedValue))) && zp.PriceId != PriceID).Count == 0)
            {
                bool isUpdated =
                    new ZonePrice
                        {
                            PriceId = PriceID,
                            FromZone = int.Parse(ddlFromZone.SelectedValue),
                            ToZone = int.Parse(ddlToZone.SelectedValue),
                            CarPrice = decimal.Parse(txtCarPrice.Text),
                            MotorcyclePrice = decimal.Parse(txtMotorCyclePrice.Text)
                        }.Update();
                success = true;
            }
            else
            {
                lblError.Text = "هذه المنطقتين مسجل السعر بينهم من قبل";
            }
        }
        return success;
    }

    private void fillPrice()
    {
        ZonePrice objPrice = MashaweerDatabaseHandler.Single<ZonePrice>(PriceID);

        if (objPrice != null)
        {
            ddlFromZone.SelectedValue = objPrice.FromZone.ToString();
            ddlToZone.SelectedValue = objPrice.ToZone.ToString();
            txtCarPrice.Text = objPrice.CarPrice.ToString();
            txtMotorCyclePrice.Text = objPrice.MotorcyclePrice.ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?ID=" + PriceID);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
