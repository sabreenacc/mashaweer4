using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MashaweerCorporate1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
   
    protected void btnsend_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("MashaweerCorporate1Template.html");
            mailBody = mailBody.Replace("{Company Name}", CompanyName.Text)
                               .Replace("{Contact Person}", ContactPerson.Text)
                               .Replace("{Mobile number}", MobileNumber.Text)
                               .Replace("{Email address}", EmailAddress.Text)
                               .Replace("{How we can help}", HowWeCanHelp.Text)
                               .Replace("{Title}", " Mashaweer Corporate 1 (Help)");
            ////.Replace("{Delivery date}", txtDELIVERYDATE.Text);
            CompanyName.Text = "";
            ContactPerson.Text = "";
            MobileNumber.Text = "";
            EmailAddress.Text = "";
            HowWeCanHelp.Text = "";
            if (Helper.Mail.SendMail("Mashaweer Corporate 4 (Help)", Setting.SelectValue("ContactEmail"), mailBody, Setting.SelectValue("EmailUserName")))
            {
                Response.Redirect("thankyouLandingPages2.aspx");
            }
        }
    }
}