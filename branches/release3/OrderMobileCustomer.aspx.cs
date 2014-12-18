using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class OrderMobileCustomer : System.Web.UI.Page
{
    protected string lng = "en";

    public string fromEmirate = "";
    public string toEmirate = "";
    public string fromZone = "";
    public string toZone = "";
    public string vehicle = "";
    public string totalCost = "";
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

        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            txtCustCmpnyName.Attributes["placeholder"] = Resources.LanguageFile.CustCmpnyName;
            txtCustEmail.Attributes["placeholder"] = Resources.LanguageFile.CustEmail;
            txtCustPerson.Attributes["placeholder"] = Resources.LanguageFile.CustPerson;
            txtCustMobile.Attributes["placeholder"] = Resources.LanguageFile.CustMobile;

            btnSave.Text = Resources.LanguageFile.btnNext;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        Response.Redirect("OrderMobileCollection.aspx?fromEmirate=" + HttpUtility.UrlEncode(fromEmirate)
                                                + "&toEmirate=" + HttpUtility.UrlEncode(toEmirate)
                                                + "&fromZone=" + HttpUtility.UrlEncode(fromZone)
                                                + "&toZone=" + HttpUtility.UrlEncode(toZone)
                                                + "&vehicle=" + HttpUtility.UrlEncode(vehicle)
                                                + "&totalCost=" + HttpUtility.UrlEncode(totalCost)
                                                + "&custCmpnyName=" + HttpUtility.UrlEncode(txtCustCmpnyName.Text)
                                                + "&custEmail=" + HttpUtility.UrlEncode(txtCustEmail.Text)
                                                + "&custPerson=" + HttpUtility.UrlEncode(txtCustPerson.Text)
                                                + "&custMobile=" + HttpUtility.UrlEncode(txtCustMobile.Text));
    }


}