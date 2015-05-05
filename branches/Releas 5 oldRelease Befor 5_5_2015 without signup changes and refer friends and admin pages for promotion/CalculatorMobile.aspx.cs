using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class CalculatorMobile : System.Web.UI.Page
{
    protected string lng = "en";

    public bool OrderFlag = false;
    protected void Page_Load(object sender, System.EventArgs e)
    {

        if (Request.QueryString["order"] != null)
        {
            OrderFlag = true;
        }

        vehicleSelect.Items.Add(new ListItem(Resources.LanguageFile.MOTORCYCLE, "1"));
        vehicleSelect.Items.Add(new ListItem(Resources.LanguageFile.VAN, "2"));

        if (!Page.IsPostBack)
        {
            ddlFromEmirate.Items.Insert(0, new ListItem(Resources.LanguageFile.STORDERSELECTCITY, "-1", true));
            ddlToEmirate.Items.Insert(0, new ListItem(Resources.LanguageFile.STORDERSELECTCITY, "-1", true));

            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);




            if (lng == "en")
            {
                lnqZones.OrderBy = "EnglishName";
                ddlFromZone.DataTextField = "EnglishName";
                ddlToZone.DataTextField = "EnglishName";
                InqEEmirates.OrderBy = "EnglishName";
                ddlFromEmirate.DataTextField = "EnglishName";
                ddlToEmirate.DataTextField = "EnglishName";
            }
            else
            {
                lnqZones.OrderBy = "ArabicName";
                ddlFromZone.DataTextField = "ArabicName";
                ddlToZone.DataTextField = "ArabicName";
                InqEEmirates.OrderBy = "ArabicName";
                ddlFromEmirate.DataTextField = "ArabicName";
                ddlToEmirate.DataTextField = "ArabicName";
            }

            btnSave.Text = OrderFlag ? Resources.LanguageFile.btnNext : Resources.LanguageFile.MENU_Order;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string url = "OrderMobileCustomer.aspx?fromEmirate=" + HttpUtility.UrlEncode((ddlFromEmirate.SelectedItem != null) ? ddlFromEmirate.SelectedItem.Text : "")
                                                + "&toEmirate=" + HttpUtility.UrlEncode((ddlToEmirate.SelectedItem != null) ? ddlToEmirate.SelectedItem.Text : "")
                                                + "&fromZone={ClctZone}&toZone={DlvryZone}"
                                                + "&vehicle=" + HttpUtility.UrlEncode(vehicleSelect.Value == "1" ? Resources.LanguageFile.MOTORCYCLE : Resources.LanguageFile.VAN)
                                                + "&totalCost=" + HttpUtility.UrlEncode(hdnCost.Value);
        //mailBody = mailBody.Replace("{ClctZone}", (ddlFromZone.SelectedItem != null) ? ddlFromZone.SelectedItem.Text : "");
        try
        {
            Zone fromZone = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(int.Parse(hdnFromZone.Value));
            url = url.Replace("{ClctZone}", HttpUtility.UrlEncode((lng == "en") ? fromZone.EnglishName : fromZone.ArabicName));
        }
        catch
        {
            url = url.Replace("{ClctZone}", "");
        }

        //mailBody = mailBody.Replace("{DlvryZone}", (ddlToZone.SelectedItem != null) ? ddlToZone.SelectedItem.Text : "");
        try
        {
            Zone toZone = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(int.Parse(hdnToZone.Value));
            url = url.Replace("{DlvryZone}", HttpUtility.UrlEncode((lng == "en") ? toZone.EnglishName : toZone.ArabicName));
        }
        catch
        {
            url = url.Replace("{DlvryZone}", "");
        }

        Response.Redirect(url);
    }
}