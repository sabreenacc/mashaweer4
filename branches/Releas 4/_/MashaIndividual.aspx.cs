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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            var mailBody = Helper.Mail.LoadMailTemplate("MashaIndividualTemplate.html");
            mailBody = mailBody.Replace("{Contact Person}", ContactPerson.Text)
                               .Replace("{Mobile number}", MobileNumber.Text)
                               .Replace("{Email address}", EmailAddress.Text)
                               .Replace("{How we can help}", HowWeCanHelp.Text);
            ////.Replace("{Delivery date}", txtDELIVERYDATE.Text);


            if (Helper.Mail.SendMail("Contact from Mashaweer Website(xmas tree)", Setting.SelectValue("ContactEmail"), mailBody, Setting.SelectValue("EmailUserName")))
            {
                Response.Redirect("thankyou.aspx");
            }
        }
    }
}