using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MashaIndividual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    
    protected void btnsend_Click(object sender, EventArgs e)
    {

        Page.Validate();
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("MashaIndividualTemplate.html");
            mailBody = mailBody.Replace("{Contact Person}", ContactPerson.Text)
                               .Replace("{Mobile number}", MobileNumber.Text)
                               .Replace("{Email address}", EmailAddress.Text)
                               .Replace("{How we can help}", HowWeCanHelp.Text)
                               .Replace("{Title1}", "Mashaweer Individual (Help)");

            ContactPerson.Text = "";
            MobileNumber.Text = "";
            EmailAddress.Text = "";
            EmailAddress.Text = "";
            HowWeCanHelp.Text = "";

            if (Helper.Mail.SendMail("Mashaweer Individual 2 (Help)", Setting.SelectValue("ContactEmail"), mailBody, Setting.SelectValue("EmailUserName")))
            {
                Response.Redirect("thankyouLandingPages.aspx");
            }
        }
    }
}