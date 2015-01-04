<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="arabic_contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">

        /***********************************************

        ***********************************************/

        var csstype = "external" //Specify type of CSS to use. "Inline" or "external"

        //var mac_css = '' //if "inline", specify mac css here
        //var pc_css = 'body{font-size: 12pt; }' //if "inline", specify PC/default css here

        var mac_externalcss = '../style/mac.css' //if "external", specify Mac css file here
        //var pc_externalcss = 'style/style.css'   //if "external", specify PC/default css file here

        ///////No need to edit beyond here////////////

        var mactest = navigator.userAgent.indexOf("Mac") != -1
        if (csstype == "inline") {
            document.write('<style type="text/css">')
            if (mactest)
                document.write(mac_css)
            else
                document.write(pc_css)
            document.write('</style>')
        }
        else if (csstype == "external")
            document.write('<link rel="stylesheet" type="text/css" href="' + (mactest ? mac_externalcss : pc_externalcss) + '">')

    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="../scripts/scroll-startstop.events.jquery.js" type="text/javascript"></script>
    <script>
        $(function () {
            var $elem = $('#content');

            $('#nav_up').fadeIn('slow');
            $('#nav_down').fadeIn('slow');

            $(window).bind('scrollstart', function () {
                $('#nav_up,#nav_down').stop().animate({ 'opacity': '0.2' });
            });
            $(window).bind('scrollstop', function () {
                $('#nav_up,#nav_down').stop().animate({ 'opacity': '1' });
            });

            $('#nav_down').click(
					function (e) {
					    $('html, body').animate({ scrollTop: $elem.height() }, 800);
					}
				);
        });
    </script>
    <script>
        function validateForm() {
            var x = document.forms["contactForm"]["name"].value;
            var x1 = document.forms["contactForm"]["message"].value;
            if (x == null || x == "" || x1 == null || x1 == "") {
                alert("يجب ملء جميع الحقول خارج.");
                return false;
            }
            var x = document.forms["contactForm"]["email"].value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                alert("ليس عنوان بريد إلكتروني صالح.");
                return false;
            }
            document.getElementById("contactForm").submit();
        }



    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-32995610-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Mashaweer UAE | Contact Us</title>
    <meta name="description" content="">
    <meta name="keywords" content="mashaweer, personal, business, errand, service, dubai, uae, mashaweeruae balloon and flower delivery, grocery store, pharmacy, eye glass repair, drop your visit visa to the airport, Taking forgotten lunches homework gym clothes to school, Dry Cleaning, Post Office, Drop off and pick-up dry-cleaning, tailoring, alterations, shoe repair, movies, books, Food Delivery, Surprise Gifts Delivery, Bill Payment, Document Delivery, Purchase & Delivery of Stationary, Purchase & Delivery of Coffee/Canteen Supplies, Corporate gifts delivery & Distribution, Bulk Mailings, Package Delivery, send Thank you Cards, Flowers and Hampers, Post office services, Lunch Delivery, Special Delivery, Forget anything anywhere, we will bring wherever you want, united arab emirates, ajman, abu dhabi, fujairah, ras al khaimah, alain, messenger, delivery messengers, trip calculator, relieve stress, save time, save money.">
    <meta name="author" content="">
    <!-- Stylesheets -->
    <link href="../style/stylearbi.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="../images/favicon.ico">
</head>
<body id="content">
    <!-- Header Starts -->
    <header>
  <div class="header" align="right">
  <div class="content">
  <h1><a href="default.aspx"><img src="imagesARB/logo.png" alt="Mashaweer"></a></h1>
  <div class="socialIcons" align="left">
   <div id="smartAddon"><!-- SMARTADDON BEGIN -->
<script type="text/javascript">
    (function () {
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;
        s.src = 'http://s1.smartaddon.com/share_addon.js';
        var j = document.getElementsByTagName('script')[0]; j.parentNode.insertBefore(s, j);
    })();
</script>
<a href="../contact.aspx" style="color:#000;">ENGLISH</a>
<p id="tellaFriend">|</p>
<a id="share" href="http://www.smartaddon.com/?share" title="Share" onclick="return sa_tellafriend('http://www.mashaweeruae.com/')" style="color: #000;text-decoration:underline;">أخبر صديق</a>
<!-- SMARTADDON END -->
</div>
   <div class="headtop">
&nbsp;&nbsp;<a href="http://www.linkedin.com/company/mashaweer-uae?trk=cp_followed_name_mashaweer-uae" target="_blank"><img hspace="2" src="imagesARB/socialIcons6.png" alt="Linkedin" name="li" width="30" height="30"></a> <a href="https://twitter.com/mashaweeruae" target="_blank"><img hspace="2" src="imagesARB/socialIcons4.png" alt="Twitter" name="twitter" width="31" height="30"></a> <a href="https://www.facebook.com/MashaweerUAE" target="_blank""><img hspace="2" src="imagesARB/socialIcons2.png" alt="Facebook" name="fb" width="30" height="30"></a>
  </div>
  </div>
 
  <br>
  <div class="navMenu" align="left">
<a href="contact.aspx">  <img src="imagesARB/contactNav.png" alt="Services" name="servNav"  width="74" height="90"></a> <a href="order.aspx"><img hspace="36" src="imagesARB/placeorderNav.png" alt="Calculator" name="calcNav" width="70" height="90"></a> <a href="location.aspx"><img src="imagesARB/calculatorNav.png" alt="Order" name="orderNav" width="76" height="90"></a> <a href="services.aspx"><img hspace="30" src="imagesARB/servicesNav.png" alt="ContactUs" name="contactNav" width="70" height="90"></a>
  </div>
  </div>
   </div>
  
  </header>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
        <div class="content">
            <div id="contctImg" align="center">
                <img src="imagesARB/contact.png" alt="Mashaweer" name="contctImg" width="880" height="750">
                <div id="phoneMail">
                    <a href="mailto:info@mashaweeruae.com?Subject=Customer%20Query" target="_blank">
                        <p style="margin-right: 70px;">
                            info@mashaweeruae.com</p>
                    </a><a href="tel:800900900">
                        <p id="phoneContact">
                            800 900 900</p>
                    </a>
                </div>
            </div>
            <div class="arbicntact" id="contctDetail" align="left">
                <form action="contact-form-handler.php" method="post" name="contactForm">
                <textarea name="name" placeholder="اسم"></textarea><br>
                <textarea name="email" placeholder="البريد الإلكتروني"></textarea><br>
                <textarea name="message" cols="35" rows="5" placeholder="رسالتك" id="msgBox"></textarea><br>
                <input type="submit" class="blackBtn" id="contactBtn" value="إرسال" onclick="return validateForm(); return false;">
                </form>
            </div>
            <br>
            <br>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <!-- Footer -->
    <div style="display: none;" class="nav_down" id="nav_down">
    </div>
    <footer>

      <div class="footer" align="right">
       <div class="content">
 <img src="imagesARB/footerSep.png" alt="Mashaweer" name="footerBar" width="941" height="17">
           <p id="footerLinks"><a href="default.aspx">الرئيسية</a> | <a href="services.aspx">خدماتنا</a> | <a href="location.aspx"> الألة الحاسبة</a> | <a href="order.aspx"> إرسل طلب</a> | <a href="faq.aspx">الأسئلة المتداولة</a> | <a href="contact.aspx">اتصل بنا</a> | <a href="terms.aspx">الشروط والأحكام</a></p>
          
          </div>
      </div>
</footer>
</body>
</html>
