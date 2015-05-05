using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mashaweer;
using System.Web.Services;
using System.Data;

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
          
            //if (Session["visitorId"] != null && int.Parse(Session["visitorId"].ToString()) != 0)
            //{
            //    var customerLoc = Mashaweer.MashaweerDatabaseHandler.Search<CustomerLocation>(a =>a.TypeLoc == "D"&& a.CustomerId == int.Parse(Session["visitorId"].ToString())).OrderByDescending(a => a.DeliveryLocId).Take(10).ToList();
               
            //    var Deliveryloc = customerLoc.Select(p => new { ProductId = p.DeliveryLocId, DisplayText = p.CompName.ToString() + " (" + p.ContatctPerson+")" });


            //    deliveryLocation.DataSource = Deliveryloc;
            //    deliveryLocation.DataTextField = "DisplayText";
            //    deliveryLocation.DataValueField = "ProductId";
            //    deliveryLocation.DataBind();

            //    var collectionDet = Mashaweer.MashaweerDatabaseHandler.Search<CustomerLocation>(a => a.TypeLoc == "C" && a.CustomerId == int.Parse(Session["visitorId"].ToString())).OrderByDescending(a => a.DeliveryLocId).Take(10).ToList();
            //    var collection = collectionDet.Select(p => new { ProductId = p.DeliveryLocId, DisplayText = p.CompName.ToString() + " (" + p.ContatctPerson + ")" });
            //    collectionDetails.DataSource = collection;
            //    collectionDetails.DataTextField = "DisplayText";
            //    collectionDetails.DataValueField = "ProductId";
            //    collectionDetails.DataBind();
            //}
            //else
            //{
            //    deliveryLocation.Enabled = false;
            //    collectionDetails.Enabled = false;
            //}
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
            //PromotionCode.Attributes["placeholder"] = Resources.LanguageFile.PROMOTION_CODE;
            btnSave.Text = Resources.LanguageFile.btnSave;
            btnCancel.Text = Resources.LanguageFile.btnCancel;
        }

            if (Session["visitorId"] != null && int.Parse( Session["visitorId"].ToString()) != 0)
            {
                var visitor = MashaweerDatabaseHandler.Search<Visitor>(a => a.VisitorId == int.Parse(Session["visitorId"].ToString())).FirstOrDefault();
                 txtCustPerson.Text = visitor.Name;
                 txtCustMobile.Text = visitor.PhoneNumber;
                 txtCustEmail.Text = visitor.Email;                
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
        mailBody = mailBody.Replace("{TotalCost}", hdnCost.Value +" AED");
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
        // check promotion code and get bonus
//        int CodeUsedNow=0;
//        int VisitorIsReferedFrndUsedReferPromotionBefore=0;
//        var chkIfReferedFrnd = Mashaweer.MashaweerDatabaseHandler.Search<ReferToFriend>(a => (a.FriendEmail == txtCustEmail.Text) && a.Discountcode.PromotionCode == PromotionCode.Text).FirstOrDefault();//check if place an order cuz he refered frnd
//        if(chkIfReferedFrnd!=null)
//        {
//        var UsedPromotionOfReferBefore = Mashaweer.MashaweerDatabaseHandler.Search<ReferToFriend>(a => (a.FriendEmail == txtCustEmail.Text) && a.Discountcode.Codeused == true).FirstOrDefault();//check if refered frnd get promotion of refer before
//            if(UsedPromotionOfReferBefore!=null)
//            {
//                VisitorIsReferedFrndUsedReferPromotionBefore=1;
//            }
//        }
//        var checkPromExst = Mashaweer.MashaweerDatabaseHandler.Search<Discountcode>(a => (a.PromotionCode == PromotionCode.Text) && a.Codeused == false && a.ExpiryDate>=DateTime.Now ).FirstOrDefault();
//        if (checkPromExst != null && VisitorIsReferedFrndUsedReferPromotionBefore==0)
//        {
//            var chkEmailExst = Mashaweer.MashaweerDatabaseHandler.Search<VisitorPromotion>(a => (a.CodeNumber == checkPromExst.CodeNumber) && a.Visitor.Email == txtCustEmail.Text).FirstOrDefault();
//            if (checkPromExst != null && chkEmailExst != null)
//            {
//                checkPromExst.Codeused = true;
//                checkPromExst.UsedDate = DateTime.Now;
//                checkPromExst.Update();
//                CodeUsedNow = 1;
//                mailBody = mailBody.Replace(hdnCost.Value + " AED", " Cost before discout is " + hdnCost.Value+"<br />discount :"+hdndiscount.Value+"<br />Total cost:"+hdntotal.Value);
//                string emailCongratulatin = @"  Dear "+chkEmailExst.Visitor.Name+" <br />You got mashaweer "+hdndiscount.Value+" discount on "+DateTime.Now+@" so you can’t 
//                                        use this promotion code “"+PromotionCode.Text+@"” again but you can get other discounts for each refer
//                                        to friend that you will make once your friend place an order you will get bonus click on
//                                         the below link and refer to friend now<br /> <a href='http://mashaweeruae.com/'> http://mashaweeruae.com/ </a>";
//                Helper.Mail.SendMail("You got mashaweer discount", txtCustEmail.Text, emailCongratulatin, Setting.SelectValue("EmailUserName"));
//            }
//        }
        //Tell visitor to register or refer friend
//        #region
//         var discount=Mashaweer.MashaweerDatabaseHandler.Search<DiscountType>(a=>a.Description=="ReferBonus" && a.Activate==true).FirstOrDefault();
//        if(discount!=null)//tell user to refer his friend after order
//        {
//             var visitor=Mashaweer.MashaweerDatabaseHandler.Search<Visitor>(a => a.Email == txtCustEmail.Text && a.password != "invalidpass" && (a.Name != "visitor" && a.Name != "RferedFriend")).FirstOrDefault();
//            if (Session["visitorId"] != null || visitor!=null)
//            {              
//                string TellAboutbonus = @"Dear "+visitor.Name+@" <br />Congratulations Mashaweer offers you "+(discount.FixedAmount!=null?discount.FixedAmount+"AED":discount.StandardPer+"%")+@" discount for each refer to
//                                       friend that you will make once your friend make place an order you will get bonus 
//                                        click on the below link and refer to friend now <br /> <a href='http://mashaweeruae.com/'>http://mashaweeruae.com/</a>";       
//                Helper.Mail.SendMail("Mashaweer offers", txtCustEmail.Text, TellAboutbonus, Setting.SelectValue("EmailUserName"));
//             }
//            else
//             {
//                 string TellToRegister = @"Dear customer <br />Congratulations Mashaweer offers you 10% discount in your
//                                       next place an order if you make register now in our web site , Click the below
//                                         link and register to get discount <br /> <a href='http://mashaweeruae.com/'>http://mashaweeruae.com/</a>";       
//                    Helper.Mail.SendMail("Register to mashaweer", txtCustEmail.Text, TellToRegister, Setting.SelectValue("EmailUserName"));
//             }
//        }
//        #endregion

        //bonus (refer to friend if exist)
        //if (CodeUsedNow == 1)
        //{
        //    try
        //    {
        //        var VisitorThatReferToHisFriend = MashaweerDatabaseHandler.Search<ReferToFriend>(a => a.FriendEmail == txtCustEmail.Text && a.Discountcode.PromotionCode==PromotionCode.Text).FirstOrDefault();
        //        if (getBonusIfVisitorRegister(VisitorThatReferToHisFriend) != 1)//if that make refer to friend not registered
        //        {
        //            getBonusIfVisitorThatMakeReferNotRegistered(VisitorThatReferToHisFriend);
        //        }
        //    }
        //    catch
        //    {
        //        // write code to show error msg
        //    }
        //}
        //================================================================================================================
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

        ////save delivery loc
        //CustomerLocation delivery = new CustomerLocation();
        //delivery.Address = txtDlvryAddress.Text;
        //delivery.CompName = txtDlvryCompanyName.Text;
        //delivery.ContatctPerson = txtDlvryPerson.Text;
        //delivery.Email = txtDlvryEmail.Text;
        //delivery.PhoneNum = txtDlvryMobile.Text;
        //delivery.NearestLandMark = txtDlvryLandMark.Text;
        //delivery.TypeLoc = "D";
        //delivery.City = int.Parse(ddlToEmirate.SelectedValue.ToString());
        //delivery.AreaId = int.Parse(hdnToZone.Value);
        //delivery.CustomerId = int.Parse(Session["visitorId"].ToString());
        //delivery.Insert();

        ////save collec loc
        //CustomerLocation collection = new CustomerLocation();
        //collection.Address = txtClctAddress.Text;
        //collection.CompName = txtClctCompanyName.Text;
        //collection.ContatctPerson = txtClctPerson.Text;
        //collection.Email = txtClctEmail.Text;
        //collection.PhoneNum = txtClctMobile.Text;
        //collection.NearestLandMark = txtClctLandMark.Text;
        //collection.TypeLoc = "C";
        //collection.City = int.Parse(ddlFromEmirate.SelectedValue.ToString());
        //collection.AreaId = int.Parse(hdnFromZone.Value);
        //collection.CustomerId = int.Parse(Session["visitorId"].ToString());
        //collection.Insert();

        if (Helper.Mail.SendMail("New Order for Mashaweer", Setting.SelectValue("OrderEmail"), mailBody, Setting.SelectValue("EmailUserName")))
        {
            Response.Redirect("thankyou.aspx?order=true");
        }

      //  else
        {
            //lblResult.Text = "Incorrect";
           // lblResult.ForeColor = System.Drawing.Color.Red;
        }
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

    string  GeneratePromotionCode()
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var stringChars = new char[8];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];
        }

         return  new String(stringChars);
    }
    int getBonusIfVisitorRegister(ReferToFriend VisitorThatReferToHisFriend)
    {
        //save promotion for bonus       
        if (VisitorThatReferToHisFriend.VisitorId != null)
        {
            string promotionForBonus = GeneratePromotionCode();
            while (MashaweerDatabaseHandler.Search<Discountcode>(a => a.PromotionCode == promotionForBonus).Count() != 0)
            {
                promotionForBonus = GeneratePromotionCode();
            }
            Discountcode discountC2 = new Discountcode();
            discountC2.Codeused = false;
            discountC2.GeneratedDate = DateTime.Now;
           // discountC2.ValidatPeriod = 3; // will changed
            var discountType = MashaweerDatabaseHandler.Search<DiscountType>(a => a.Description == "ReferBonus" && a.Activate == true).FirstOrDefault();
            if(discountType!=null)
            {
            discountC2.DiscountTypeId = discountType.DiscountTypeId; //based on what
            discountC2.ExpiryDate=DateTime.Today.AddDays(Convert.ToDouble(discountType!=null?( discountType.ValidatePeriodInDays != null ? discountType.ValidatePeriodInDays : 0):0));  
            }
            else
            {
                discountC2.DiscountTypeId=null;
                discountC2.ExpiryDate=DateTime.Now;
            }
            discountC2.PromotionCode = promotionForBonus;
            discountC2.Insert();

            VisitorPromotion visitorDisc2 = new VisitorPromotion();
            visitorDisc2.VisitorId = Convert.ToInt32(VisitorThatReferToHisFriend.VisitorId);
            visitorDisc2.CodeNumber = discountC2.CodeNumber;
            visitorDisc2.Insert();
            
            if(discountType!=null)
            {
                string EmailBodyforBonus = @" Dear " + VisitorThatReferToHisFriend.Visitor.Name + @"<br />Mashaweer offers you "+(discountType.FixedAmount!=null?discountType.FixedAmount+"AED":discountType.StandardPer+"%")+@" discount in
                                      your next place an order because you refer to your friend to place an order in mashaweer
                                        so login or use this email to make place an order and get bonus, your promation code 
                                       is “"+promotionForBonus+@"” and this offer is available from today until "+discountC2.ExpiryDate+@",Click the below link
                                       and place your order and get bonus <a href='http://mashaweeruae.com/Order.aspx'>http://mashaweeruae.com/Order.aspx</a>";

                Helper.Mail.SendMail("You get bonus from mashaweer", VisitorThatReferToHisFriend.Visitor.Email, EmailBodyforBonus, Setting.SelectValue("EmailUserName"));
            }
            return 1;
        }
        return 0;
    }
    int getBonusIfVisitorThatMakeReferNotRegistered(ReferToFriend VisitorThatReferToHisFriend)
    {

        //save promotion for bonus
        string promotionForBonus = GeneratePromotionCode();
        while (MashaweerDatabaseHandler.Search<Discountcode>(a => a.PromotionCode == promotionForBonus).Count() != 0)
        {
            promotionForBonus = GeneratePromotionCode();
        }
        if (VisitorThatReferToHisFriend.VisitorId == null && VisitorThatReferToHisFriend.VisitorEmailIfnotRegistered != null)
        {
            Visitor visitor = new Visitor();
            visitor.Name = "visitor";
            visitor.Email = VisitorThatReferToHisFriend.VisitorEmailIfnotRegistered;
            visitor.PhoneNumber = null;
            visitor.Address = null;
            visitor.AreaId = null;
            visitor.password = "invalidpass";
            visitor.Insert();
            Discountcode discountC2 = new Discountcode();
            discountC2.Codeused = false;
            discountC2.GeneratedDate = DateTime.Now;

            var discountType = MashaweerDatabaseHandler.Search<DiscountType>(a => a.Description == "ReferBonus" && a.Activate == true).FirstOrDefault();
            if (discountType != null)
            {
                discountC2.DiscountTypeId = discountType.DiscountTypeId; 
                discountC2.ExpiryDate = DateTime.Today.AddDays(Convert.ToDouble(discountType != null ? (discountType.ValidatePeriodInDays != null ? discountType.ValidatePeriodInDays : 0) : 0));
            }
            else
            {
                discountC2.DiscountTypeId = null;
                discountC2.ExpiryDate = DateTime.Now;
            }            

            discountC2.PromotionCode = promotionForBonus;
            discountC2.Insert();

            VisitorPromotion visitorDisc2 = new VisitorPromotion();
            visitorDisc2.VisitorId = Convert.ToInt32(visitor.VisitorId);
            visitorDisc2.CodeNumber = discountC2.CodeNumber;
            visitorDisc2.Insert();
            if (discountType != null)
            {
                string EmailBodyforBonus = @" Dear Customer <br />Mashaweer offers you " + (discountType.FixedAmount != null ? discountType.FixedAmount + "AED" : discountType.StandardPer + "%") + @" discount in
                                      your next place an order because you refer to your friend to place an order in mashaweer
                                        so login or use this email to make place an order and get bonus, your promation code 
                                       is “" + promotionForBonus + @"” and this offer is available from today until " + discountC2.ExpiryDate + @",Click the below link
                                       and place your order and get bonus <a href='http://mashaweeruae.com/Order.aspx'>http://mashaweeruae.com/Order.aspx</a>";

                Helper.Mail.SendMail("Register to mashaweer", VisitorThatReferToHisFriend.VisitorEmailIfnotRegistered, EmailBodyforBonus, Setting.SelectValue("EmailUserName"));
            }
            return 1;
        }
        return 0;
    }

    //protected void deliveryLocation_SelectedIndexChanged(object sender, System.EventArgs e)
    //{
    //    var deliverLoc = MashaweerDatabaseHandler.Search<CustomerLocation>(a => a.DeliveryLocId == int.Parse(deliveryLocation.SelectedValue.ToString())).FirstOrDefault();
    //    if (deliverLoc != null)
    //    {
    //        txtDlvryCompanyName.Text = deliverLoc.CompName;
    //        txtDlvryPerson.Text = deliverLoc.ContatctPerson;
    //        txtDlvryEmail.Text = deliverLoc.Email;
    //        txtDlvryMobile.Text = deliverLoc.PhoneNum;
    //        txtDlvryAddress.Text = deliverLoc.Address;
    //        txtDlvryLandMark.Text = deliverLoc.NearestLandMark;
    //        if (deliverLoc.City!=null)
    //        ddlToEmirate.SelectedValue = deliverLoc.City.ToString();
    //        if (deliverLoc.AreaId != null)
    //        {
    //            ddlToZone.SelectedValue = deliverLoc.AreaId.ToString();
    //            hdnToZone.Value = deliverLoc.AreaId.ToString();
    //        }
    //        txtDlvryCompanyName.Enabled = false;
    //        txtDlvryPerson.Enabled = false;
    //        txtDlvryEmail.Enabled = false;
    //        txtDlvryMobile.Enabled = false;
    //        txtDlvryAddress.Enabled = false;
    //        txtDlvryLandMark.Enabled = false;
    //       // ddlToEmirate.Enabled = false;   
    //        ddlToEmirate.Enabled = false;
    //        ddlToZone.Enabled = false;
    //    }
    //    else
    //    {
    //        txtDlvryCompanyName.Text = "";
    //        txtDlvryPerson.Text = "";
    //        txtDlvryEmail.Text = "";
    //        txtDlvryMobile.Text = "";
    //        txtDlvryAddress.Text = "";
    //        txtDlvryLandMark.Text = "";
    //        ddlToEmirate.SelectedValue = "-1";

    //        txtDlvryCompanyName.Enabled = true;
    //        txtDlvryPerson.Enabled = true;
    //        txtDlvryEmail.Enabled = true;
    //        txtDlvryMobile.Enabled = true;
    //        txtDlvryAddress.Enabled = true;
    //        txtDlvryLandMark.Enabled = true;
    //        ddlToEmirate.Enabled = true;
    //        ddlToZone.Enabled = true;
    //    }
    //}
    //protected void collectionDelivery_SelectedIndexChanged(object sender, System.EventArgs e)
    //{
    //    var CollecLoc = MashaweerDatabaseHandler.Search<CustomerLocation>(a => a.DeliveryLocId == int.Parse(collectionDetails.SelectedValue.ToString())).FirstOrDefault();
    //    if (CollecLoc != null)
    //    {
    //        txtClctCompanyName.Text = CollecLoc.CompName;
    //        txtClctPerson.Text = CollecLoc.ContatctPerson;
    //        txtClctEmail.Text = CollecLoc.Email;
    //        txtClctMobile.Text = CollecLoc.PhoneNum;
    //        txtClctAddress.Text = CollecLoc.Address;
    //        txtClctLandMark.Text = CollecLoc.NearestLandMark;
    //        if (CollecLoc.City != null)
    //            ddlFromEmirate.SelectedValue = CollecLoc.City.ToString();
    //        if (CollecLoc.AreaId != null)
    //        {
    //            ddlFromZone.SelectedValue = CollecLoc.AreaId.ToString();
    //            hdnFromZone.Value = CollecLoc.AreaId.ToString();
    //        }

    //        txtClctCompanyName.Enabled = false;
    //        txtClctPerson.Enabled = false;
    //        txtClctEmail.Enabled = false;
    //        txtClctMobile.Enabled = false;
    //        txtClctAddress.Enabled = false;
    //        txtClctLandMark.Enabled = false;
    //        ddlFromEmirate.Enabled = false;
    //        ddlFromZone.Enabled = false;
    //    }
    //    else
    //    {
    //        txtClctCompanyName.Text = "";
    //        txtClctPerson.Text = "";
    //        txtClctEmail.Text = "";
    //        txtClctMobile.Text = "";
    //        txtClctAddress.Text = "";
    //        txtClctLandMark.Text = "";
    //        ddlFromEmirate.SelectedValue = "-1";    

    //        txtClctCompanyName.Enabled = true;
    //        txtClctPerson.Enabled = true;
    //        txtClctEmail.Enabled = true;
    //        txtClctMobile.Enabled = true;
    //        txtClctAddress.Enabled = true;
    //        txtClctLandMark.Enabled = true;
    //        ddlFromEmirate.Enabled = true;
    //        ddlFromZone.Enabled = true;
    //    }
    //}
}