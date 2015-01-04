<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Mashaweer UAE | FAQ</title>
    <meta name="description" content="">
    <meta name="keywords" content="mashaweer, personal, business, errand, service, dubai, uae, mashaweeruae balloon and flower delivery, grocery store, pharmacy, eye glass repair, drop your visit visa to the airport, Taking forgotten lunches homework gym clothes to school, Dry Cleaning, Post Office, Drop off and pick-up dry-cleaning, tailoring, alterations, shoe repair, movies, books, Food Delivery, Surprise Gifts Delivery, Bill Payment, Document Delivery, Purchase & Delivery of Stationary, Purchase & Delivery of Coffee/Canteen Supplies, Corporate gifts delivery & Distribution, Bulk Mailings, Package Delivery, send Thank you Cards, Flowers and Hampers, Post office services, Lunch Delivery, Special Delivery, Forget anything anywhere, we will bring wherever you want, united arab emirates, ajman, abu dhabi, fujairah, ras al khaimah, alain, messenger, delivery messengers, trip calculator, relieve stress, save time, save money.">
    <meta name="author" content="">
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
    <!-- Stylesheets -->
    <link href="../style/stylearbi.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="../images/favicon.ico">
</head>
<body>
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
<a href="../faq.aspx" style="color:#000;">ENGLISH</a>
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
            <a id="#top">
                <h1 id="heading">
                    الأسئلة المتداولة
                </h1>
                <div id="faqQs">
                    <a href="#q1">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            ما هى أسعار خدمات التوصيل؟</p>
                    </a><a href="#q2">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            ما هي المناطق التى تشمل خدمتكم؟</p>
                    </a><a href="#q3">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            هل يجب أن أحضر الطلب بنفسى؟</p>
                    </a><a href="#q4">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            هل هناك حد أقصى لحجم أو وزن الطلب؟</p>
                    </a><a href="#q5">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            ماذا لو لم يتم سرد خدمة أحتاج لها؟</p>
                    </a><a href="#q7">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            كيف أعرف أن طلبى سيكون فى أمان؟</p>
                    </a><a href="#q8">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            هل تستطيع توصيل الطلباتت في نفس اليوم؟</p>
                    </a><a href="#q9">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            ما هي ساعات العمل الخاصة بكم؟</p>
                    </a><a href="#q10">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            هل هناك تأمين؟</p>
                    </a><a href="#q11">
                        <img src="imagesARB/bullet.png" alt="Mashaweer">
                        <p>
                            هل يمكنني تغيير الوجهة بعد ارسال الطلب؟</p>
                    </a>
                    <br>
                    <br>
                    <br>
                    <p>
                        <a id="q1">ما هى أسعار خدمات التوصيل؟</a><br>
                        <span style="color: white">باستخدام الآلة الحاسبة يمكن معرفة أسعار التوصيل من و الى
                            أى مكان فى دولة الامارات العربية المتحدة.</span>
                        <br>
                        <br>
                        <a id="q2">ما هي المناطق التى تشمل خدمتكم؟</a><br>
                        <span style="color: white">نحن تغطي جميع المهمات في دبي والشارقة، ولكن يمكننا أن نوصل
                            في جميع الإمارات السبع و مدينة العين كذلك.</span>
                        <br>
                        <br>
                        <a id="q3">هل يجب أن أحضر الطلب بنفسى؟</a><br>
                        <span style="color: white">لا، سنقوم باستلامه منك في أى وقت و أى مكان حسب رغبتك.</span>
                        <br>
                        <br>
                        <a id="q4">هل هناك حد أقصى لحجم أو وزن الطلب؟</a><br>
                        <span style="color: white">يرجى مراجعة صفحةالالة الحاسبة للحصول على السعر إما لدراجة
                            نارية أو سيارة.</span>
                        <br>
                        <br>
                        <a id="q5">ماذا لو لم يتم سرد خدمة أحتاج لها؟</a><br>
                        <span style="color: white">فقط أسألنا ! وسنفعل ما في وسعنا لمساعدتكم. لن يتم تنفيذ طلبات
                            توصيل غير مشروعة.</span>
                        <br>
                        <br>
                        <a id="q7">كيف أعرف أن طلبى سيكون فى أمان؟</a><br>
                        <span style="color: white">ان الطلب الخاص بكم لا يتنقل من مندوب الى مندوب أو من سيارة
                            الى أخرى و لكن يقوم مندوبنا نتسليم الطلبات فور استلامها مباشرة إلى الوجهة التي تريدها.</span>
                        <br>
                        <br>
                        <a id="q8">هل تستطيع توصيل الطلباتت في نفس اليوم؟</a><br>
                        <span style="color: white">بالتأكيد.</span>
                        <br>
                        <br>
                        <a id="q9">ما هي ساعات العمل الخاصة بكم؟</a><br>
                        <span style="color: white">السبت - الخميس 9:00 ص حتي 9:00 م – العطلة الأسبوعية يوم الجمعة.</span>
                        <br>
                        <br>
                        <a id="q10">هل هناك تأمين؟</a><br>
                        <span style="color: white">نعم.</span>
                        <br>
                        <br>
                        <a id="q11">هل يمكنني تغيير الوجهة بعد ارسال الطلب؟</a><br>
                        <span style="color: white">بكل تأكيد، فقط اتصل بمركز خدمة العملاء وأنهم سوف يقومون بتنفيذ
                            كل التغييرات التي تريدها.</span>
                    </p>
                    <br />
                    <br />
                    <div align="left">
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

      <div class="footer" align="right">
       <div class="content">
 <img src="imagesARB/footerSep.png" alt="Mashaweer" name="footerBar" width="941" height="17">
           <p id="footerLinks"><a href="default.aspx">الرئيسية</a> | <a href="services.aspx">خدماتنا</a> | <a href="location.aspx"> الألة الحاسبة</a> | <a href="order.aspx"> إرسل طلب</a> | <a href="faq.aspx">الأسئلة المتداولة</a> | <a href="contact.aspx">اتصل بنا</a> | <a href="terms.aspx">الشروط والأحكام</a></p>
          
          </div>
      </div>
</footer>
</body>
</html>
