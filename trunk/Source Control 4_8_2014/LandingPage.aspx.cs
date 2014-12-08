using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LandingMashaweer : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        btnSave.Text = Resources.LanguageFile.CONTACT_US_SEND;
        txtCotactUsEmail.Attributes["placeholder"] = Resources.LanguageFile.ContactEmail;
        txtDELIVERYDATE.Attributes["placeholder"] = Resources.LanguageFile.DELIVERYDATE;
        txtDDELIVERYADDRESSLOCATION.Attributes["placeholder"] = Resources.LanguageFile.DDELIVERYADDRESSLOCATION;
        txtMOBILENUMBER.Attributes["placeholder"] = Resources.LanguageFile.MOBILENUMBER;
        txtCotactUsName.Attributes["placeholder"] = Resources.LanguageFile.ContactName;
        if (Request.QueryString["done"] != null)
        {
            //ltrlCotactUsIntro.Text = Resources.LanguageFile.CONTACT_US_FOOTER_PARAGRAPH;
            //ltrlContactTable.Visible = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("LandingPageTemplate2.html");
            mailBody = mailBody.Replace("{Name}", txtCotactUsName.Text)
                               .Replace("{Email}", txtCotactUsEmail.Text)
                               .Replace("{Mobile number}", txtMOBILENUMBER.Text)
                               .Replace("{Delivery address location}", txtDDELIVERYADDRESSLOCATION.Text)
                               .Replace("{Delivery date}", txtDELIVERYDATE.Text);
                               ////.Replace("{Delivery date}", txtDELIVERYDATE.Text);
                              

            if (Helper.Mail.SendMail("Contact from Mashaweer Website", Setting.SelectValue("ContactEmail"), mailBody, Setting.SelectValue("EmailUserName")))
            {
                Response.Redirect("thankyou.aspx");
            }
        }
    }
}