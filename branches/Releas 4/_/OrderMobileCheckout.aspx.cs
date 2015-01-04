using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class OrderMobileCheckout : System.Web.UI.Page
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
    public string dlvryCompanyName = "";
    public string dlvryPerson = "";
    public string dlvryEmail = "";
    public string dlvryMobile = "";
    public string dlvryAddress = "";
    public string dlvryLandMark = "";
    public string dlvryInstructions = "";

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

        if (Request.QueryString["dlvryCompanyName"] != null)
            dlvryCompanyName = Request.QueryString["dlvryCompanyName"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryPerson"] != null)
            dlvryPerson = Request.QueryString["dlvryPerson"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryEmail"] != null)
            dlvryEmail = Request.QueryString["dlvryEmail"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryMobile"] != null)
            dlvryMobile = Request.QueryString["dlvryMobile"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryAddress"] != null)
            dlvryAddress = Request.QueryString["dlvryAddress"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryLandMark"] != null)
            dlvryLandMark = Request.QueryString["dlvryLandMark"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (Request.QueryString["dlvryInstructions"] != null)
            dlvryInstructions = Request.QueryString["dlvryInstructions"].ToString();
        else
            Response.Redirect("Default.aspx");

        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            txtPrclDtl.Attributes["placeholder"] = Resources.LanguageFile.PrclDtls;

            btnSave.Text = Resources.LanguageFile.btnSave;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Page.Validate();
        //if (Page.IsValid)
        //{
        var mailBody = Helper.Mail.LoadMailTemplate("OrderMailTemplate.html");

        mailBody = mailBody.Replace("{CustomerName}", custCmpnyName);
        mailBody = mailBody.Replace("{CustomerContactPerson}", custPerson);
        mailBody = mailBody.Replace("{CustomerMobileNumber}", custMobile);
        mailBody = mailBody.Replace("{CustomerEmail}", custEmail);
        mailBody = mailBody.Replace("{PaymentLocation}", rdCollection.Checked ? "Collection" : "Delivery");
        mailBody = mailBody.Replace("{TotalCost}", totalCost);
        mailBody = mailBody.Replace("{Vehicle}", vehicle);
        mailBody = mailBody.Replace("{ParcelDetails}", txtPrclDtl.Text);
        mailBody = mailBody.Replace("{ClctName}", clctCompanyName);
        mailBody = mailBody.Replace("{DlvryName}", dlvryCompanyName);
        mailBody = mailBody.Replace("{ClctPerson}", clctPerson);
        mailBody = mailBody.Replace("{DlvryPerson}", dlvryPerson);
        mailBody = mailBody.Replace("{ClctEmail}", clctEmail);
        mailBody = mailBody.Replace("{DlvryEmail}", dlvryEmail);
        mailBody = mailBody.Replace("{ClctMobile}", clctMobile);
        mailBody = mailBody.Replace("{DlvryMobile}", dlvryMobile);
        mailBody = mailBody.Replace("{ClctAddress}", clctAddress);
        mailBody = mailBody.Replace("{DlvryAddress}", dlvryAddress);
        mailBody = mailBody.Replace("{ClctLandMark}", clctLandMark);
        mailBody = mailBody.Replace("{DlvryLandMark}", dlvryLandMark);
        mailBody = mailBody.Replace("{ClctZone}", fromZone);
        mailBody = mailBody.Replace("{DlvryZone}", toZone);
        mailBody = mailBody.Replace("{ClctInstructions}", clctInstructions);
        mailBody = mailBody.Replace("{ClctEmirate}", fromEmirate);
        mailBody = mailBody.Replace("{DlvryEmirate}", toEmirate);
        mailBody = mailBody.Replace("{DlvryInstructions}", dlvryInstructions);
        mailBody = mailBody.Replace("{DevelopmentInstructions}", "<span style='color:green;'>" + Request.ServerVariables["HTTP_ACCEPT"] + "</span><br /><span style='color:blue;'>" + Request.ServerVariables["HTTP_USER_AGENT"] + "</span>");

        if (Helper.Mail.SendMail("New Order for Mashaweer", Setting.SelectValue("OrderEmail"), mailBody, Setting.SelectValue("EmailUserName")))
        {
            Response.Redirect("thankyou.aspx?order=true");
        }
        //}
        //else
        //{
        //lblResult.Text = "Incorrect";
        //lblResult.ForeColor = System.Drawing.Color.Red;
        //}
    }

    [System.Web.Services.WebMethod]
    public static string ValidateCaptcha(string challenge, string response)
    {
        Recaptcha.RecaptchaValidator tempRC = new Recaptcha.RecaptchaValidator();
        tempRC.Challenge = challenge;
        tempRC.Response = response;
        tempRC.RemoteIP = HttpContext.Current.Request.UserHostAddress;

        //Assign your private key
        tempRC.PrivateKey = "6LeOv_ESAAAAAFROKCQ_Rc9DIZQWFmY4rSvgI4ky";

        Recaptcha.RecaptchaResponse rr = tempRC.Validate();
        if (!rr.IsValid)
        {
            return "No";
        }
        return "Yes";
    }
}