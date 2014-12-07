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

        if (!Page.IsPostBack)
        {
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
        Page.Validate();
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("OrderMailTemplate.html");

            mailBody = mailBody.Replace("{CustomerName}", txtCustCmpnyName.Text);
            //mailBody = mailBody.Replace("{CustomerAccount}", txtCustNO.Text);
            mailBody = mailBody.Replace("{CustomerContactPerson}", txtCustPerson.Text);
            mailBody = mailBody.Replace("{CustomerMobileNumber}", txtCustMobile.Text);
            mailBody = mailBody.Replace("{CustomerEmail}", txtCustEmail.Text);
            mailBody = mailBody.Replace("{ParcelDetails}", txtPrclDtl.Text);
            mailBody = mailBody.Replace("{ClctName}", txtClctCompanyName.Text);
            mailBody = mailBody.Replace("{DlvryName}", txtDlvryCompanyName.Text);
            mailBody = mailBody.Replace("{ClctPerson}", txtClctPerson.Text);
            mailBody = mailBody.Replace("{DlvryPerson}", txtDlvryPerson.Text);
            mailBody = mailBody.Replace("{ClctEmail}", txtClctEmail.Text);
            mailBody = mailBody.Replace("{DlvryEmail}", txtDlvryEmail.Text);
            mailBody = mailBody.Replace("{ClctMobile}", txtClctMobile.Text);
            mailBody = mailBody.Replace("{DlvryMobile}", txtDlvryMobile.Text);
            //mailBody = mailBody.Replace("{ClctTel}", txtClctTel.Text);
            //mailBody = mailBody.Replace("{DlvryTel}", txtDlvyTel.Text);
            //mailBody = mailBody.Replace("{ClctFax}", txtClctFax.Text);
            //mailBody = mailBody.Replace("{DlvryFax}", txtDlvryFax.Text);
            mailBody = mailBody.Replace("{ClctAddress}", txtClctAddress.Text);
            mailBody = mailBody.Replace("{DlvryAddress}", txtDlvryAddress.Text);
            mailBody = mailBody.Replace("{ClctLandMark}", txtClctLandMark.Text);
            mailBody = mailBody.Replace("{DlvryLandMark}", txtDlvryLandMark.Text);
            mailBody = mailBody.Replace("{ClctZone}", (ddlFromZone.SelectedItem != null) ? ddlFromZone.SelectedItem.Text : "");
            mailBody = mailBody.Replace("{DlvryZone}", (ddlToZone.SelectedItem != null) ? ddlToZone.SelectedItem.Text : "");
            mailBody = mailBody.Replace("{ClctInstructions}", txtClctInstructions.Text);
            mailBody = mailBody.Replace("{ClctEmirate}", ddlFromEmirate.Text);
            mailBody = mailBody.Replace("{DlvryEmirate}", ddlToEmirate.Text);
            mailBody = mailBody.Replace("{DlvryInstructions}", txtDlvryInstructions.Text);

            if (Helper.Mail.SendMail("New Order for Mashaweer", Setting.SelectValue("OrderEmail"), mailBody,
                                     Setting.SelectValue("OrderEmail")))
            {
                Response.Redirect("thankyou.aspx?order=true");
            }
        }
        //else
        //{
        //lblResult.Text = "Incorrect";
        //lblResult.ForeColor = System.Drawing.Color.Red;
        //}
    }

    //protected void ddlFromEmirate_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddl = (DropDownList)sender;
    //    string value = ddl.SelectedValue;
    //    List<Zone> Zone = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(a => a.EmirateId.ToString() == value);
    //}


}