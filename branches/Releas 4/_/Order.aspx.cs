using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//[assembly: System.Security.AllowPartiallyTrustedCallers]
public partial class Order : System.Web.UI.Page
{
    protected string lng = "en";

    protected void Page_Load(object sender, EventArgs e)
    {
        vehicleSelect.Items.Add(new ListItem(Resources.LanguageFile.MOTORCYCLE, "1"));
        vehicleSelect.Items.Add(new ListItem(Resources.LanguageFile.VAN, "2"));

        if (!Page.IsPostBack)
        {
            //recaptcha.CustomTranslations = new Dictionary<string, string>() { { "instructions_visual", Resources.LanguageFile.RECAPATCHA_IMAGE_WRITE },
            //                                                                  { "instructions_audio", Resources.LanguageFile.RECAPATCHA_AUDIO_WRITE },
            //                                                                  { "play_again", Resources.LanguageFile.RECAPATCHA_PLAY_AGAIN },
            //                                                                  { "cant_hear_this", Resources.LanguageFile.RECAPATCHA_CANT_HERE_THIS },
            //                                                                  { "visual_challenge", Resources.LanguageFile.RECAPATCHA_GET_IMAGE },
            //                                                                  { "audio_challenge", Resources.LanguageFile.RECAPATCHA_GET_AUDIO },
            //                                                                  { "refresh_btn", Resources.LanguageFile.RECAPATCHA_REFRESH },
            //                                                                  { "help_btn", Resources.LanguageFile.RECAPATCHA_HELP },
            //                                                                  { "incorrect_try_again", Resources.LanguageFile.RECAPATCHA_INCORRECT_TRY_AGAIN } };
            //recaptcha.CustomThemeWidget = "recaptcha_widget";

            ddlFromEmirate.Items.Insert(0, new ListItem(Resources.LanguageFile.STORDERSELECTCITY, "-1", true));
            ddlToEmirate.Items.Insert(0, new ListItem(Resources.LanguageFile.STORDERSELECTCITY, "-1", true));

            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);


            //recaptcha.Language = "ar";



            if (lng == "en")
            {
                lnqZones.OrderBy = "EnglishName";
                ddlFromZone.DataTextField = "EnglishName";
                //ddlToZone.DataTextField = "EnglishName";
                InqEEmirates.OrderBy = "EnglishName";
                ddlFromEmirate.DataTextField = "EnglishName";
                ddlToEmirate.DataTextField = "EnglishName";
            }
            else
            {
                lnqZones.OrderBy = "ArabicName";
                ddlFromZone.DataTextField = "ArabicName";
                //ddlToZone.DataTextField = "ArabicName";
                InqEEmirates.OrderBy = "ArabicName";
                ddlFromEmirate.DataTextField = "ArabicName";
                ddlToEmirate.DataTextField = "ArabicName";
            }
            if (Request.QueryString["done"] != null)
            {
                //ltrlOrderMessage.Visible = true;
                //ltrlOrderTable.Visible = true;
            }

            txtCustCmpnyName.Attributes["placeholder"] = Resources.LanguageFile.CustCmpnyName;
            txtCustEmail.Attributes["placeholder"] = Resources.LanguageFile.CustEmail;
            txtCustPerson.Attributes["placeholder"] = Resources.LanguageFile.CustPerson;
            txtCustMobile.Attributes["placeholder"] = Resources.LanguageFile.CustMobile;
            txtPrclDtl.Attributes["placeholder"] = Resources.LanguageFile.PrclDtls;
            txtClctCompanyName.Attributes["placeholder"] = Resources.LanguageFile.ClctCompanyName;
            txtClctPerson.Attributes["placeholder"] = Resources.LanguageFile.ClctPerson;
            txtClctEmail.Attributes["placeholder"] = Resources.LanguageFile.ClctEmail;
            txtClctMobile.Attributes["placeholder"] = Resources.LanguageFile.ClctMobile;
            txtClctAddress.Attributes["placeholder"] = Resources.LanguageFile.ClctAddress;
            txtClctLandMark.Attributes["placeholder"] = Resources.LanguageFile.ClctLandMark;
            txtClctInstructions.Attributes["placeholder"] = Resources.LanguageFile.ClctInstructions;
            txtDlvryCompanyName.Attributes["placeholder"] = Resources.LanguageFile.DlvryCompanyName;
            txtDlvryPerson.Attributes["placeholder"] = Resources.LanguageFile.DlvryPerson;
            txtDlvryEmail.Attributes["placeholder"] = Resources.LanguageFile.DlvryEmail;
            txtDlvryMobile.Attributes["placeholder"] = Resources.LanguageFile.DlvryMobile;
            txtDlvryAddress.Attributes["placeholder"] = Resources.LanguageFile.DlvryAddress;
            txtDlvryLandMark.Attributes["placeholder"] = Resources.LanguageFile.DlvryLandMark;
            txtDlvryInstructions.Attributes["placeholder"] = Resources.LanguageFile.DlvryInstructions;
            btnSave.Text = Resources.LanguageFile.btnSave;
            btnCancel.Text = Resources.LanguageFile.btnCancel;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Page.Validate();
        //if (Page.IsValid)
        //{
            var mailBody = Helper.Mail.LoadMailTemplate("OrderMailTemplate.html");

            mailBody = mailBody.Replace("{CustomerName}", txtCustCmpnyName.Text);
            mailBody = mailBody.Replace("{CustomerContactPerson}", txtCustPerson.Text);
            mailBody = mailBody.Replace("{CustomerMobileNumber}", txtCustMobile.Text);
            mailBody = mailBody.Replace("{CustomerEmail}", txtCustEmail.Text);
            mailBody = mailBody.Replace("{PaymentLocation}", rdCollection.Checked ? "Collection" : "Delivery");
            mailBody = mailBody.Replace("{TotalCost}", hdnCost.Value);
            mailBody = mailBody.Replace("{Vehicle}", txtDELIVERYDATE.Text == "1" ? Resources.LanguageFile.MOTORCYCLE : Resources.LanguageFile.VAN);
            mailBody = mailBody.Replace("{ParcelDetails}", txtPrclDtl.Text);
            mailBody = mailBody.Replace("{ClctName}", txtClctCompanyName.Text);
            mailBody = mailBody.Replace("{DlvryName}", txtDlvryCompanyName.Text);
            mailBody = mailBody.Replace("{ClctPerson}", txtClctPerson.Text);
            mailBody = mailBody.Replace("{DlvryPerson}", txtDlvryPerson.Text);
            mailBody = mailBody.Replace("{ClctEmail}", txtClctEmail.Text);
            mailBody = mailBody.Replace("{DlvryEmail}", txtDlvryEmail.Text);
            mailBody = mailBody.Replace("{ClctMobile}", txtClctMobile.Text);
            mailBody = mailBody.Replace("{DlvryMobile}", txtDlvryMobile.Text);
            mailBody = mailBody.Replace("{ClctAddress}", txtClctAddress.Text);
            mailBody = mailBody.Replace("{DlvryAddress}", txtDlvryAddress.Text);
            mailBody = mailBody.Replace("{ClctLandMark}", txtClctLandMark.Text);
            mailBody = mailBody.Replace("{DlvryLandMark}", txtDlvryLandMark.Text);

            //mailBody = mailBody.Replace("{ClctZone}", (ddlFromZone.SelectedItem != null) ? ddlFromZone.SelectedItem.Text : "");
            try
            {
                Zone fromZone = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(int.Parse(hdnFromZone.Value));
                mailBody = mailBody.Replace("{ClctZone}", (lng == "en") ? fromZone.EnglishName : fromZone.ArabicName);
            }
            catch (Exception ex)
            {
                mailBody = mailBody.Replace("{ClctZone}", "");
            }

            //mailBody = mailBody.Replace("{DlvryZone}", (ddlToZone.SelectedItem != null) ? ddlToZone.SelectedItem.Text : "");
            try
            {
                Zone toZone = Mashaweer.MashaweerDatabaseHandler.Single<Zone>(int.Parse(hdnToZone.Value));
                mailBody = mailBody.Replace("{DlvryZone}", (lng == "en") ? toZone.EnglishName : toZone.ArabicName);
            }
            catch (Exception ex)
            {
                mailBody = mailBody.Replace("{DlvryZone}", "");
            }
            mailBody = mailBody.Replace("{ClctInstructions}", txtClctInstructions.Text);
            mailBody = mailBody.Replace("{ClctEmirate}", (ddlFromEmirate.SelectedItem != null) ? ddlFromEmirate.SelectedItem.Text : "");
            mailBody = mailBody.Replace("{DlvryEmirate}", (ddlToEmirate.SelectedItem != null) ? ddlToEmirate.SelectedItem.Text : "");
            mailBody = mailBody.Replace("{DlvryInstructions}", txtDlvryInstructions.Text);
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
    //protected void ddlFromEmirate_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddl = (DropDownList)sender;
    //    string value = ddl.SelectedValue;
    //    List<Zone> Zone = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(a => a.EmirateId.ToString() == value);
    //}


}