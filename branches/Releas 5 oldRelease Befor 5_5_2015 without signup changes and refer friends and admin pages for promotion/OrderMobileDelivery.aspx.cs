using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class OrderMobileDelivery : System.Web.UI.Page
{
    protected string lng = "en";

    public string fromEmirate = "";
    public string toEmirate = "";
    public string fromZone = "";
    public string toZone = "";
    public string vehicle = "";
    public string totalCost = "";
    public string custCmpnyName = "";
    public string custEmail = "";
    public string custPerson = "";
    public string custMobile = "";
    public string clctCompanyName = "";
    public string clctPerson = "";
    public string clctEmail = "";
    public string clctMobile = "";
    public string clctAddress = "";
    public string clctLandMark = "";
    public string clctInstructions = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["fromEmirate"] != null)
            fromEmirate = Request.QueryString["fromEmirate"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["toEmirate"] != null)
            toEmirate = Request.QueryString["toEmirate"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["fromZone"] != null)
            fromZone = Request.QueryString["fromZone"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["toZone"] != null)
            toZone = Request.QueryString["toZone"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["vehicle"] != null)
            vehicle = Request.QueryString["vehicle"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["totalCost"] != null)
            totalCost = Request.QueryString["totalCost"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["custCmpnyName"] != null)
            custCmpnyName = Request.QueryString["custCmpnyName"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["custEmail"] != null)
            custEmail = Request.QueryString["custEmail"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["custPerson"] != null)
            custPerson = Request.QueryString["custPerson"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["custMobile"] != null)
            custMobile = Request.QueryString["custMobile"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctCompanyName"] != null)
            clctCompanyName = Request.QueryString["clctCompanyName"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctPerson"] != null)
            clctPerson = Request.QueryString["clctPerson"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctEmail"] != null)
            clctEmail = Request.QueryString["clctEmail"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctMobile"] != null)
            clctMobile = Request.QueryString["clctMobile"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctAddress"] != null)
            clctAddress = Request.QueryString["clctAddress"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctLandMark"] != null)
            clctLandMark = Request.QueryString["clctLandMark"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["clctInstructions"] != null)
            clctInstructions = Request.QueryString["clctInstructions"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            txtDlvryCompanyName.Attributes["placeholder"] = Resources.LanguageFile.DlvryCompanyName;
            txtDlvryPerson.Attributes["placeholder"] = Resources.LanguageFile.DlvryPerson;
            txtDlvryEmail.Attributes["placeholder"] = Resources.LanguageFile.DlvryEmail;
            txtDlvryMobile.Attributes["placeholder"] = Resources.LanguageFile.DlvryMobile;
            txtDlvryAddress.Attributes["placeholder"] = Resources.LanguageFile.DlvryAddress;
            txtDlvryLandMark.Attributes["placeholder"] = Resources.LanguageFile.DlvryLandMark;
            txtDlvryInstructions.Attributes["placeholder"] = Resources.LanguageFile.DlvryInstructions;

            btnSave.Text = Resources.LanguageFile.btnNext;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderMobileCheckout.aspx?fromEmirate=" + HttpUtility.UrlEncode(fromEmirate)
                                                + "&toEmirate=" + HttpUtility.UrlEncode(toEmirate)
                                                + "&fromZone=" + HttpUtility.UrlEncode(fromZone)
                                                + "&toZone=" + HttpUtility.UrlEncode(toZone)
                                                + "&vehicle=" + HttpUtility.UrlEncode(vehicle)
                                                + "&totalCost=" + HttpUtility.UrlEncode(totalCost)
                                                + "&custCmpnyName=" + HttpUtility.UrlEncode(custCmpnyName)
                                                + "&custEmail=" + HttpUtility.UrlEncode(custEmail)
                                                + "&custPerson=" + HttpUtility.UrlEncode(custPerson)
                                                + "&custMobile=" + HttpUtility.UrlEncode(custMobile)
                                                + "&clctCompanyName=" + HttpUtility.UrlEncode(clctCompanyName)
                                                + "&clctPerson=" + HttpUtility.UrlEncode(clctPerson)
                                                + "&clctEmail=" + HttpUtility.UrlEncode(clctEmail)
                                                + "&clctMobile=" + HttpUtility.UrlEncode(clctMobile)
                                                + "&clctAddress=" + HttpUtility.UrlEncode(clctAddress)
                                                + "&clctLandMark=" + HttpUtility.UrlEncode(clctLandMark)
                                                + "&clctInstructions=" + HttpUtility.UrlEncode(clctInstructions)
                                                + "&dlvryCompanyName=" + HttpUtility.UrlEncode(txtDlvryCompanyName.Text)
                                                + "&dlvryPerson=" + HttpUtility.UrlEncode(txtDlvryPerson.Text)
                                                + "&dlvryEmail=" + HttpUtility.UrlEncode(txtDlvryEmail.Text)
                                                + "&dlvryMobile=" + HttpUtility.UrlEncode(txtDlvryMobile.Text)
                                                + "&dlvryAddress=" + HttpUtility.UrlEncode(txtDlvryAddress.Text)
                                                + "&dlvryLandMark=" + HttpUtility.UrlEncode(txtDlvryLandMark.Text)
                                                + "&dlvryInstructions=" + HttpUtility.UrlEncode(txtDlvryInstructions.Text));
    }
}