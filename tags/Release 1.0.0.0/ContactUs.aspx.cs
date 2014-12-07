using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        ltrlContactusTitle.Text = Resources.LanguageFile.CONTACT_US;
        //ltrlMashaweerWall.Text = Resources.LanguageFile.WRITE_ON_MASHAWEER_WALL;
        ltrlCotactUsIntro.Text = Resources.LanguageFile.CONTACT_US_INTRODUCTION;
        //ltrlCotactUsTelephone.Text = Resources.LanguageFile.CONTACT_US_PHONE;
        ltrlCotactUsTollFree.Text = Resources.LanguageFile.CONTACT_US_TOLLFREE;
        ltrlCotactUsFax.Text = Resources.LanguageFile.CONTACT_US_FAX;
        ltrlCotactUsFillContact.Text = Resources.LanguageFile.CONTACT_US_FILL_CONTACT_FORM;
        ltrlCotactUsName.Text = Resources.LanguageFile.CONTACT_US_NAME;
        ltrlCotactUsEmail.Text = Resources.LanguageFile.CONTACT_US_EMAIL;
        ltrlCotactUsMessage.Text = Resources.LanguageFile.CONTACT_US_MESSAGE;
        btnSave.Text = Resources.LanguageFile.CONTACT_US_SEND;
        btnCancel.Text = Resources.LanguageFile.CONTACT_US_CLEAR;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        var mailBody = Helper.Mail.LoadMailTemplate("ContactUsMailTemplate.html");
        mailBody = mailBody.Replace("{Name}", txtCotactUsName.Text)
                           .Replace("{Email}", txtCotactUsEmail.Text)
                           .Replace("{Message}", txtCotactUsMessage.Text);

        Helper.Mail.SendMail("Contact from Mashaweer Website", Setting.SelectValue("ContactEmail"), mailBody, Setting.SelectValue("ContactEmail"));
        Response.Redirect("ContactUs.aspx");
    }
}