<%@ Page Language="C#" AutoEventWireup="true" CodeFile="terms.aspx.cs" Inherits="terms" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <meta http-equiv="Content-Type" content="text/html; charset= ISO-8859-1">
    <meta charset="utf-8">
    <title>Mashaweer UAE | Terms & Conditions</title>
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
<a href="arabic/terms.aspx" class="inda3">عربي</a>
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
            <div id="termscond">
                <h2>
                    Terms and Conditions</h2>
                <p style="line-height: 25px;">
                    1. Customers are responsible for the payments for their errands as per the declared
                    and agreed upon charges.<br>
                    <br>
                    2. Customers are solely responsible for all costs and expenses including the cost
                    of returning the package/consignment.<br>
                    <br>
                    3. Customer and Recipient must provide a valid ID for our representative.<br>
                    <br>
                    4. Customers are responsible for proper packing, security, marking, declaring the
                    senders address on the parcel/consignment.<br>
                    <br>
                    5. Customers should be aware of the dimensions of their parcel/consignment to request
                    a suitable vehicle. In case of unsuitable vehicle being requested the customer will
                    be charged for the full trip.
                    <br>
                    <br>
                    6. If Customers cancel the order during the collection or after the collection takes
                    place, a full charge is payable to Mashaweer.<br>
                    <br>
                    7. The parcel/consignment will not be cleared until we receive full payment for
                    our service.
                    <br>
                    <br>
                    8. Mashaweer does not incur any liability if the information given by the customer
                    is incorrect.<br>
                    <br>
                    9. If Mashaweer messenger experienced any waiting time at any of the pick up and/or
                    drop off location due to the type of errands requested by the customer or due to
                    untimely availability of the customer, waiting charges will be applied at the rate
                    of AED30 for every30 min. and its fraction.<br>
                    <br>
                    10. Mashaweer is not responsible for loss, damage, delay for reasons which cannot
                    be foreseen or which are beyond its control, including but not limited to acts of
                    god, perils of air/weather or mechanical delay of carrier, acts of public enemies,
                    wars, and strikes.<br>
                    <br>
                    11. Prohibited Packages: Cigarettes, Drugs , any kind of weapons, and any illegal
                    substance/item.<br>
                    <br>
                    12. Mashaweer is not liable for any consequential, incidental, indirect damage or
                    loss for example loss of profit, income, etc.<br>
                    <br>
                    13. Mashaweer has the right to open or inspect customer parcel/consignment.<br>
                    <br>
                    14. Mashaweer shall have lien on any goods shipped, for all the charges due to be
                    received from customer, and refuse to surrender possessions of the goods until such
                    charges are paid.<br>
                    <br>
                </p>
                <h4 align="center">
                    The above terms and conditions may be changed at any given time without prior notice.</h4>
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
