using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class OrderMobileCollection : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            txtClctCompanyName.Attributes["placeholder"] = Resources.LanguageFile.ClctCompanyName;
            txtClctPerson.Attributes["placeholder"] = Resources.LanguageFile.ClctPerson;
            txtClctEmail.Attributes["placeholder"] = Resources.LanguageFile.ClctEmail;
            txtClctMobile.Attributes["placeholder"] = Resources.LanguageFile.ClctMobile;
            txtClctAddress.Attributes["placeholder"] = Resources.LanguageFile.ClctAddress;
            txtClctLandMark.Attributes["placeholder"] = Resources.LanguageFile.ClctLandMark;
            txtClctInstructions.Attributes["placeholder"] = Resources.LanguageFile.ClctInstructions;

            btnSave.Text = Resources.LanguageFile.btnNext;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderMobileDelivery.aspx?fromEmirate=" + HttpUtility.UrlEncode(fromEmirate)
                                                + "&toEmirate=" + HttpUtility.UrlEncode(toEmirate)
                                                + "&fromZone=" + HttpUtility.UrlEncode(fromZone)
                                                + "&toZone=" + HttpUtility.UrlEncode(toZone)
                                                + "&vehicle=" + HttpUtility.UrlEncode(vehicle)
                                                + "&totalCost=" + HttpUtility.UrlEncode(totalCost)
                                                + "&custCmpnyName=" + HttpUtility.UrlEncode(custCmpnyName)
                                                + "&custEmail=" + HttpUtility.UrlEncode(custEmail)
                                                + "&custPerson=" + HttpUtility.UrlEncode(custPerson)
                                                + "&custMobile=" + HttpUtility.UrlEncode(custMobile)
                                                + "&clctCompanyName=" + HttpUtility.UrlEncode(txtClctCompanyName.Text)
                                                + "&clctPerson=" + HttpUtility.UrlEncode(txtClctPerson.Text)
                                                + "&clctEmail=" + HttpUtility.UrlEncode(txtClctEmail.Text)
                                                + "&clctMobile=" + HttpUtility.UrlEncode(txtClctMobile.Text)
                                                + "&clctAddress=" + HttpUtility.UrlEncode(txtClctAddress.Text)
                                                + "&clctLandMark=" + HttpUtility.UrlEncode(txtClctLandMark.Text)
                                                + "&clctInstructions=" + HttpUtility.UrlEncode(txtClctInstructions.Text));
    }


}