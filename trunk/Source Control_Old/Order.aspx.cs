using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                         ? "en"
                         : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                ? "en"
                                : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

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

        if (lng == "en")
        {
            lnqZones.OrderBy = "EnglishName";
            ddlFromZone.DataTextField = "EnglishName";
            ddlFromZone.DataValueField = "EnglishName";
            ddlToZone.DataTextField = "EnglishName";
            ddlToZone.DataValueField = "EnglishName";
        }
        else
        {
            lnqZones.OrderBy = "ArabicName";
            ddlFromZone.DataTextField = "ArabicName";
            ddlFromZone.DataValueField = "ArabicName";
            ddlToZone.DataTextField = "ArabicName";
            ddlToZone.DataValueField = "ArabicName";
        }
        if (Request.QueryString["done"] != null)
            ltrlOrderMessage.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
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
                           .Replace("{ClctZone}", ddlFromZone.SelectedValue)
                           .Replace("{DlvryZone}", ddlToZone.SelectedValue)
                           .Replace("{Shipment}", txtShipment.Text);

        if (Helper.Mail.SendMail("New Order for Mashaweer", Setting.SelectValue("OrderEmail"), mailBody, Setting.SelectValue("OrderEmail")))
            Response.Redirect("Order.aspx?done=true");
    }



    //    public static bool SendMail(string pHost, int pPort, bool pUseDefaultCredentials, string pUsername, string pPassword, string pSubject, string pTo, string pBody, string pFrom)
    //    {
    //        var success = true;


    //        var smtpClient = new SmtpClient
    //                             {
    //                                 Host = pHost,
    //                                 Port = pPort,
    //                                 UseDefaultCredentials = pUseDefaultCredentials,
    //                                 Credentials = new NetworkCredential(pUsername, pPassword)
    //                             };
    //        try
    //        {
    //            var mail = new MailMessage { From = new MailAddress(pFrom, pFrom), Subject = pSubject, Body = pBody, IsBodyHtml = true };
    //            mail.To.Add(pTo);

    //            smtpClient.Send(mail);
    //        }
    //        catch
    //        {
    //            success = false;
    //        }

    //        return success;
    //    }
}