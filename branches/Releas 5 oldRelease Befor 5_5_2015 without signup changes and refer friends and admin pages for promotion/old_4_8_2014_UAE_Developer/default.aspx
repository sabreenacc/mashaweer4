<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="scripts/scroll-startstop.events.jquery.js" type="text/javascript"></script>
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
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <title>Mashaweer UAE</title>
    <meta name="description" content="">
    <meta name="keywords" content="mashaweer, personal, business, errand, service, dubai, uae, mashaweeruae balloon and flower delivery, grocery store, pharmacy, eye glass repair, drop your visit visa to the airport, Taking forgotten lunches homework gym clothes to school, Dry Cleaning, Post Office, Drop off and pick-up dry-cleaning, tailoring, alterations, shoe repair, movies, books, Food Delivery, Surprise Gifts Delivery, Bill Payment, Document Delivery, Purchase & Delivery of Stationary, Purchase & Delivery of Coffee/Canteen Supplies, Corporate gifts delivery & Distribution, Bulk Mailings, Package Delivery, send Thank you Cards, Flowers and Hampers, Post office services, Lunch Delivery, Special Delivery, Forget anything anywhere, we will bring wherever you want, united arab emirates, ajman, abu dhabi, fujairah, ras al khaimah, alain, messenger, delivery messengers, trip calculator, relieve stress, save time, save money.">
    <meta name="author" content="">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="robots" content="index, follow" />
    <!-- Stylesheets -->
    <link href="style/style.css" rel="stylesheet">
    <link href="style/media1.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="images/favicon.ico">
</head>
<body id="content">
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
<a href="arabic/default.aspx" class="inda3">عربي</a>
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
    <div class="container">
        <div class="content">
            <div align="left" id="runErrands">
                <img src="images/runErrands.png" alt="Mashaweer" name="runErrands">&nbsp;&nbsp;&nbsp;
            </div>
            <div align="right" id="callUsNow">
                <h3 class="indh">
                    <a class="inda1" href="tel:800900900">CALL US</a><br>
                    <a href="tel:800900900">800 900 900 </a>
                </h3>
            </div>
            <div class="ind3" align="right" id="callUs">
                <img src="images/order.png" alt="Order" name="orderMain" width="397" height="543">
                <div class="ind4" id="quickLink">
                    <a href="order.aspx" class="yellowBtn">Quick Link</a>
                </div>
            </div>
            <div class="ind5" align="left" id="onlineCalc">
                <img src="images/calc.png" alt="Order" name="orderMain" width="310" height="543">
                <div class="ind6" id="calcYrOrder">
                    <a href="location.aspx" class="blackBtn">calculate your order</a>
                </div>
                <div class="ind7" id="thumb">
                    <img src="images/shadowThumpup.png" alt="Mashaweer" name="thumbUp" width="202" height="234">
                </div>
                <div class="ind8" id="testimonial">
                    <img src="images/whatCustomerSay.png" alt="Mashaweer" name="whatCustomerSay" width="201"
                        height="90">
                </div>
                <div class="ind9" id="quotes">
                    <img src="images/testiMain.png" alt="Mashaweer" name="testiMain" width="479" height="108">
                    <div class="ind10" id="testiName">
                        <img src="images/name.png" alt="Mashaweer" name="nameTesti" width="90" height="11">
                    </div>
                </div>
            </div>
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

          <div class="footer">
       <div class="content">
     <img src="images/footerSep.png" alt="Mashaweer" name="footerBar" width="941" height="17">
           <p class="indp2"><a href="default.aspx" style="padding-left:0px !important;">home</a>|<a href="services.aspx">our services</a>|<a href="location.aspx">online calculator</a>|<a href="order.aspx">place an order</a>|<a href="faq.aspx">FAQ</a>|<a href="contact.aspx">contact us</a>|<a href="terms.aspx">terms and conditions</a></p>
          
          </div>
      </div>
</footer>
</body>
</html>
