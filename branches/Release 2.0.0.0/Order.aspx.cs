using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    protected string lng = "en";
     
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);


            //recaptcha.Language = "ar";

            ltrlShipment.Text = Resources.LanguageFile.ORDER_SHIPMENT;
            ltrlOrderTitle.Text = Resources.LanguageFile.PLACE_ORDER;
            ltrlOrderMessage.Text = Resources.LanguageFile.ORDER_FOOTER_PARAGRAPH;
            ltrlOrderForm.Text = Resources.LanguageFile.ORDER_FILL_ORDER_FORM;
            ltrlDlvyTel.Text = Resources.LanguageFile.ORDER_TELEPHONE;
            ltrlDlvryZone.Text = Resources.LanguageFile.ORDER_ZONE;
            ltrlDlvryPerson.Text = Resources.LanguageFile.ORDER_CONTACT_PERSON_DELIVERY;
            ltrlDlvryMobile.Text = Resources.LanguageFile.ORDER_MOBILE_NO;
            ltrlDlvryLandMark.Text = Resources.LanguageFile.ORDER_LANDMARK;
            ltrlDlvryFax.Text = Resources.LanguageFile.ORDER_FAX;
            ltrlDlvryEmail.Text = Resources.LanguageFile.ORDER_EMAIL;
            ltrlDlvryDetails.Text = Resources.LanguageFile.ORDER_DELIVERY_DETAILS;
            ltrlDlvryCompanyName.Text = Resources.LanguageFile.ORDER_CUSTOMER_COMPANY_NAME;
            ltrlDlvryAddress.Text = Resources.LanguageFile.ORDER_ADDRESS;
            ltrlCustPerson.Text = Resources.LanguageFile.ORDER_CONTACT_PERSON;
            ltrlCustNO.Text = Resources.LanguageFile.ORDER_CUSTOMER_NO;
            ltrlCustMobile.Text = Resources.LanguageFile.ORDER_MOBILE_NO;
            ltrlCustEmail.Text = Resources.LanguageFile.ORDER_EMAIL;
            ltrlCustDetails.Text = Resources.LanguageFile.ORDER_CUSTOMER_DETAILS;
            ltrlCustCmpnyName.Text = Resources.LanguageFile.ORDER_CUSTOMER_COMPANY_NAME;
            ltrlClctZone.Text = Resources.LanguageFile.ORDER_ZONE;
            ltrlClctTel.Text = Resources.LanguageFile.ORDER_TELEPHONE;
            ltrlClctPerson.Text = Resources.LanguageFile.ORDER_CONTACT_PERSON_COLLECTION;
            ltrlClctMobile.Text = Resources.LanguageFile.ORDER_MOBILE_NO;
            ltrlClctLandMark.Text = Resources.LanguageFile.ORDER_LANDMARK;
            ltrlClctFax.Text = Resources.LanguageFile.ORDER_FAX;
            ltrlClctEmail.Text = Resources.LanguageFile.ORDER_EMAIL;
            ltrlClctDetails.Text = Resources.LanguageFile.ORDER_COLLECTION_DETAILS;
            ltrlClctCompanyName.Text = Resources.LanguageFile.ORDER_CUSTOMER_COMPANY_NAME;
            ltrlClctAddress.Text = Resources.LanguageFile.ORDER_ADDRESS;
            btnCancel.Text = Resources.LanguageFile.CONTACT_US_CLEAR;
            btnSave.Text = Resources.LanguageFile.CONTACT_US_SEND;
            ltrlClctEmirate.Text = Resources.LanguageFile.ORDER_EMIRATE;
            ltrlDlvryEmirate.Text = Resources.LanguageFile.ORDER_EMIRATE;
            Literal1.Text = Resources.LanguageFile.ORDER_COST;
            ItrlComments.Text = Resources.LanguageFile.COMMENT;

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
                ltrlOrderMessage.Visible = true;
                ltrlOrderTable.Visible = true;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("OrderMailTemplate.html");
            mailBody = mailBody.Replace("{CustomerName}", txtCustCmpnyName.Text)
                .Replace("{CustomerAccount}", txtCustNO.Text)
                .Replace("{CustomerContactPerson}", txtCustPerson.Text)
                .Replace("{CustomerMobileNumber}", txtCustMobile.Text)
                .Replace("{CustomerEmail}", txtCustEmail.Text)
                .Replace("{ClctName}", txtClctCompanyName.Text)
                .Replace("{DlvryName}", txtDlvryCompanyName.Text)
                .Replace("{ClctPerson}", txtClctPerson.Text)
                .Replace("{DlvryPerson}", txtDlvryPerson.Text)
                .Replace("{ClctEmail}", txtClctEmail.Text)
                .Replace("{DlvryEmail}", txtDlvryEmail.Text)
                .Replace("{ClctMobile}", txtClctMobile.Text)
                .Replace("{DlvryMobile}", txtDlvryMobile.Text)
                .Replace("{ClctTel}", txtClctTel.Text)
                .Replace("{DlvryTel}", txtDlvyTel.Text)
                .Replace("{ClctFax}", txtClctFax.Text)
                .Replace("{DlvryFax}", txtDlvryFax.Text)
                .Replace("{ClctAddress}", txtClctAddress.Text)
                .Replace("{DlvryAddress}", txtDlvryAddress.Text)
                .Replace("{ClctLandMark}", txtClctLandMark.Text)
                .Replace("{DlvryLandMark}", txtDlvryLandMark.Text)
                .Replace("{ClctZone}", ddlFromZone.SelectedItem.Text)
                .Replace("{DlvryZone}", ddlToZone.SelectedItem.Text)
                .Replace("{Shipment}", txtShipment.Text)
                .Replace("{ClctEmirate}", ddlFromEmirate.Text)
                .Replace("{DlvryEmirate}", ddlToEmirate.Text)
                .Replace("{Comments}", ItrlComments.Text);

            //if (Helper.Mail.SendMail("New Order for Mashaweer", Setting.SelectValue("OrderEmail"), mailBody,
             //                        Setting.SelectValue("OrderEmail")))
            //{
                Response.Redirect("Order.aspx?done=true");
            //}
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