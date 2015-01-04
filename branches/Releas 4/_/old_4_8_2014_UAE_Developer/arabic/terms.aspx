<%@ Page Language="C#" AutoEventWireup="true" CodeFile="terms.aspx.cs" Inherits="terms" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <title>Mashaweer UAE | Terms & Conditions</title>
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
<a href="../terms.aspx" style="color:#000;">ENGLISH</a>
<p id="tellaFriend">|</p>
<a id="share" href="http://www.smartaddon.com/?share" title="Share" onclick="return sa_tellafriend('http://www.mashaweeruae.com/')" style="color: #000;text-decoration:underline;">أخبر صديق</a>
<!-- SMARTADDON END -->
</div>
   <div class="headtop">
&nbsp;&nbsp; <a href="http://www.linkedin.com/company/mashaweer-uae?trk=cp_followed_name_mashaweer-uae" target="_blank"> <img hspace="2" src="imagesARB/socialIcons6.png" alt="Linkedin" name="li" width="30" height="30"></a> <a href="https://twitter.com/mashaweeruae" target="_blank"><img hspace="2" src="imagesARB/socialIcons4.png" alt="Twitter" name="twitter" width="31" height="30"></a> <a href="https://www.facebook.com/MashaweerUAE" target="_blank""><img hspace="2" src="imagesARB/socialIcons2.png" alt="Facebook" name="fb" width="30" height="30"></a>
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
    <br>
    <br>
    <div class="container">
        <div class="content">
            <div id="terms">
                <h1>
                    الشروط والأحكام</h1>
                <br>
                <p>
                    1.يلتزم العميل بتكلفة المشوار أو المشاوير للمهمات الخاصة بهم وفقا للأسعار المعلنة
                    والمتفق عليها.<br>
                    <br>
                    2. يلتزم العميل بجميع تكاليف ونفقات المشوار أو المشاوير الخاصة بهم بما في ذلك تكلفة
                    إعادة الطلب.<br>
                    <br>
                    3. يجب على العميل والمستفيد اظهار الهوية سارية المفعول لممثلنا عند الاستلام و التسلم.<br>
                    <br>
                    4. يكون العميل مسؤول عن التعبئة السليمة، والأمنة للطلبات.<br>
                    <br>
                    5. يجب على العملاء أن يكونوا على بينة من أبعاد الطرود الخاصة بهم لطلب وسيلة نقل
                    مناسبة. في حالة طلب مركبة غير مناسبة سيتم تحصيل المبلغ من العميل للرحلة كاملة.<br>
                    <br>
                    6. إذا طلب العميل الغاء المشوار أثناء الاستلام أو بعده يلتزم العميل بسداد كامل تكلفة
                    المشوار.<br>
                    <br>
                    7. تحتفظ مشاوير بحقها فى عدم تسليم الطلب حتى سداد كامل التكلفة.<br>
                    <br>
                    8. مشاوير لا تتحمل أي مسؤولية إذا كانت المعلومات التي قدمها العميل غير صحيحة.<br>
                    <br>
                    9. إذا استوجب على مندوب مشاوير الانتظار، نظرا لنوعية المشوار أو لأى سبب أخر يتحمل
                    العميل رسوم انتظار 30 درهم لكل 30 دقىقة أو جزء منها<br>
                    <br>
                    10. مشاوير ليست مسؤولة عن خسارة أو ضرر أو تأخير لأسباب التي لا يمكن التنبؤ بها أو
                    التي هي خارجة عن نطاق سيطرتها، بما في ذلك ولكن لا تقتصرعلى سوء الأحوال الجوية أو
                    الطقس أو التأخيرات الميكانيكية ، وأعمال العنف و الشغب، والحروب، وخلافه<br>
                    <br>
                    11. يحظر طلب: السجائر، المخدرات، أي نوع من الأسلحة، وأي مادة غير قانونية.<br>
                    <br>
                    12. مشاوير ليست مسؤولة عن أي أضرار غير مباشرة أو تبعية أو خسارة لمال أو قت وما إلى
                    ذلك<br>
                    <br>
                    13. مشاوير لها الحق في فتح أو فحص الطلب.<br>
                    <br>
                    14. مشاوير لها الحق فى الاحتفاظ بالطلب لحين سداد أى رسوم أو تكاليف مطلوبة من العميل
                    مقابل التوصيل أو رسوم الانتظار أو اى رسوم أو مصاريف أخرى.<br>
                    <br>
                </p>
                <h3 align="center">
                    قد يتم تغيير الشروط والأحكام المذكورة أعلاه في أي وقت من الأوقات دون إشعار مسبق.</h3>
                .
                <br>
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
