<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <title>Mashaweer UAE | FAQ</title>
    <meta name="description" content="">
    <meta name="keywords" content="mashaweer, personal, business, errand, service, dubai, uae, mashaweeruae balloon and flower delivery, grocery store, pharmacy, eye glass repair, drop your visit visa to the airport, Taking forgotten lunches homework gym clothes to school, Dry Cleaning, Post Office, Drop off and pick-up dry-cleaning, tailoring, alterations, shoe repair, movies, books, Food Delivery, Surprise Gifts Delivery, Bill Payment, Document Delivery, Purchase & Delivery of Stationary, Purchase & Delivery of Coffee/Canteen Supplies, Corporate gifts delivery & Distribution, Bulk Mailings, Package Delivery, send Thank you Cards, Flowers and Hampers, Post office services, Lunch Delivery, Special Delivery, Forget anything anywhere, we will bring wherever you want, united arab emirates, ajman, abu dhabi, fujairah, ras al khaimah, alain, messenger, delivery messengers, trip calculator, relieve stress, save time, save money.">
    <meta name="author" content="">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="robots" content="index, follow" />
    <!-- Stylesheets -->
    <link href="style/style.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="images/favicon.ico">
</head>
<body>
    <script>
        $(document).ready(function () {

            // hide #back-top first
            $("#back-top").hide();

            // fade in #back-top
            $(function () {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 300) {
                        $('#back-top').fadeIn();
                    } else {
                        $('#back-top').fadeOut();
                    }
                });

                // scroll body to 0px on click
                $('#back-top a').click(function () {
                    $('body,html').animate({
                        scrollTop: 0
                    }, 800);
                    return false;
                });
            });

        });
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
    <!-- Header Starts -->
    <header>
  <div class="header">
  <div class="content">
  <h1><a href="default.aspx"><img src="images/logo.png" alt="Mashaweer" id="lOgo"></a></h1>
  <div class="socialIcons" align="right">
  <br><br>
  <div class="ind1"><!-- SMARTADDON BEGIN -->
<script type="text/javascript">
    (function () {
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;
        s.src = 'http://s1.smartaddon.com/share_addon.js';
        var j = document.getElementsByTagName('script')[0]; j.parentNode.insertBefore(s, j);
    })();
</script>
<a href="arabic/faq.aspx" class="inda3">عربي</a>
<p class="indp1">|</p>
<a href="http://www.smartaddon.com/?share" title="Share" onclick="return sa_tellafriend('http://www.mashaweeruae.com/')" style="color: #000;text-decoration:underline;">tell a friend</a>
<!-- SMARTADDON END -->
</div>
 <div class="ind2">
&nbsp;&nbsp; <a href=" https://www.facebook.com/MashaweerUAE" target="_blank"> <img src="images/socialIcons2.png" alt="Facebook" name="fb" width="30" height="30"></a>&nbsp;&nbsp; <a href="https://twitter.com/mashaweeruae" target="_blank"><img src="images/socialIcons4.png" alt="Twitter" name="twitter" width="31" height="30"></a>&nbsp;&nbsp; <a href="http://www.linkedin.com/company/mashaweer-uae?trk=cp_followed_name_mashaweer-uae" target="_blank"><img src="images/socialIcons6.png" alt="LinkedIn" name="linkedin" width="30" height="30"></a>
  </div>
  </div>
 
  <br>
  <div class="navMenu" align="right">
<a href="services.aspx">  <img src="images/serviceNav.png" alt="Services" name="servNav"  width="74" height="90"></a><a href="location.aspx"><img src="images/calcNav.png" alt="Calculator" name="calcNav" width="70" height="90"></a><a href="order.aspx"><img src="images/orderNav.png" alt="Order" name="orderNav" width="86" height="90"></a><a href="contact.aspx"><img src="images/contactNav.png" alt="ContactUs" name="contactNav" width="70" height="90"></a>
  </div>
  </div>
   </div>
  
  </header>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
        <div class="content">
            <a id="#top">
                <img src="images/faqHeader.png" alt="mashawir" name="faqhead" width="919" height="446"></a>
            <div id="faqQs">
                <a href="#q1">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        How do you charge for your services?</p>
                </a><a href="#q2">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        What Area do you cover?</p>
                </a><a href="#q3">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        Do I have to bring my parcel to you?</p>
                </a><a href="#q4">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        Is there a size or weight limit to my consignment?</p>
                </a><a href="#q5">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        What if a service I require is not listed?</p>
                </a><a href="#q7">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        How do I know my parcel will be safe?</p>
                </a><a href="#q8">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        Can you do same-day requests?</p>
                </a><a href="#q9">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        What are your working hours?</p>
                </a><a href="#q10">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        Are you insured?</p>
                </a><a href="#q11">
                    <img src="images/bullet.png" alt="Mashaweer">
                    <p>
                        Can I change destination after collection?</p>
                </a>
                <br>
                <p>
                    <a id="q1">How do you charge for your services?</a><br>
                    <span style="color: white">Take a look at our calculator or call us for a quote.</span>
                    <br>
                    <br>
                    <a id="q2">What Area do you cover?</a><br>
                    <span style="color: white">We cover all errands within Dubai & Sharjah, yet we can do
                        pickups and drop offs
                        <br />
                        in all seven emirates and Al Ain city as well.</span>
                    <br>
                    <br>
                    <a id="q3">Do I have to bring my parcel to you?</a><br>
                    <span style="color: white">No, we will collect it from you at the time of your convenience.</span>
                    <br>
                    <br>
                    <a id="q4">Is there a size or weight limit to my consignment?</a><br>
                    <span style="color: white">Please check our calculator page to get a quote for either
                        a motorcycle or car errand.</span>
                    <br>
                    <br>
                    <a id="q5">What if a service I require is not listed?</a><br>
                    <span style="color: white">Just ask! We will do what we can to assist you. Requests
                        for service
                        <br>
                        which are illegal will not be granted.</span>
                    <br>
                    <br>
                    <a id="q7">How do I know my parcel will be safe?</a><br>
                    <span style="color: white">Your goods will not exchange hands, a dedicated messenger
                        will pick
                        <br>
                        up, transport and deliver your parcel personally to your desired
                        <br>
                        destination.</span>
                    <br>
                    <br>
                    <a id="q8">Can you do same-day requests?</a><br>
                    <span style="color: white">Sure.</span>
                    <br>
                    <br>
                    <a id="q9">What are your working hours?</a><br>
                    <span style="color: white">SAT – THU 9:00 a.m. - 9:00 p.m. We are closed on Fridays.</span>
                    <br>
                    <br>
                    <a id="q10">Are you insured?</a><br>
                    <span style="color: white">Yes.</span>
                    <br>
                    <br>
                    <a id="q11">Can I change destination after collection?</a><br>
                    <span style="color: white">Sure you can, just contact our call center and they will
                        assist you in
                        <br>
                        implementing all the changes you desire.</span>
                </p>
                <div align="right">
                    <p id="back-top" style="display: block;">
                        <a href="#top"><span></span></a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <!-- Footer -->
    <footer>

<div class="footer">
       <div class="content">
     <img src="images/footerSep.png" alt="Mashaweer" name="footerBar" width="941" height="17">
           <p class="indp2"><a href="default.aspx" style="padding-left:0px !important;">home</a>|<a href="services.aspx">our services</a>|<a href="location.aspx">online calculator</a>|<a href="order.aspx">place an order</a>|<a href="faq.aspx">FAQ</a>|<a href="contact.aspx">contact us</a>|<a href="terms.aspx">terms and conditions</a></p>
          
          </div>
      </div>
</footer>
</body>
</html>
