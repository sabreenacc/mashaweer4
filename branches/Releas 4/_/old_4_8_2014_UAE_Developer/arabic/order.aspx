<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
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
    <script type="text/javascript">
        function msg() {
            alert("الرجاء اختيار وجهة السفر الخاصة بك");
        }

        function myFunction1() {
            msg();
            myFunction();
        }


        function myFunction() {
            var e = document.getElementById('CityToARB');
            var txt = e.options[e.selectedIndex].value;
            var e1 = document.getElementById('CityFromARB');
            var txt1 = e1.options[e1.selectedIndex].value;

            if (txt1 == 3 && txt == 3 || txt1 == 4 && txt == 4 || txt1 == 3 && txt == 4 || txt1 == 4 && txt == 3) {
                $("#lblPrice").html("");
                var val = 'motorcycle'; //set default to van
                $('#transPort').val(val);
                $("#transPort").attr("disabled", false);
                $("#AreaToARB").attr("disabled", false);
                $("#AreaFromARB").attr("disabled", false);
                document.getElementById("transPort").style.display = "";


            }


            else if (txt == 1 && txt1 == 1 || txt == 5 && txt1 == 5 || txt == 2 && txt1 == 2 || txt == 7 && txt1 == 7 || txt == 6 && txt1 == 6 || txt == 8 && txt1 == 8) {
                $("#lblPrice").html("");
                alert("هذه الخدمة غير متوفرة حاليا.");
                resetAll();
            }

            else if (txt == 8 || txt1 == 8 || txt == "الرجاء اختيار مدينة" || txt1 == "الرجاء اختيار مدينة") {
                $("#transPort").attr("disabled", false);
                $("#AreaToARB").attr("disabled", false);
                $("#AreaFromARB").attr("disabled", false);
                document.getElementById("transPort").style.display = "";
            }

            else {
                $("#lblPrice").html("");
                var val = 'van'; //set default to van
                $('#transPort').val(val);
                $("#transPort").attr("disabled", true);
                document.getElementById("transPort").style.display = "";
                $("#AreaToARB").attr("disabled", true);
                $("#AreaFromARB").attr("disabled", true);

            }
        }

        function disabledDDL() {


            $("#CityFromARB")[0].selectedIndex = 8;
            $("#CityToARB")[0].selectedIndex = 8;
            var val = 'motorcycle'; //set default to van
            $('#transPort').val(val);
            $("#transPort").attr("disabled", true);
            $("#AreaToARB").attr("disabled", true);
            $("#AreaFromARB").attr("disabled", true);
            resetAll();
            $("#lblPrice").html("");
            resetAll();
        }

        function resetAll() {
            $("#CityFromARB")[0].selectedIndex = 8;
            $("#CityToARB")[0].selectedIndex = 8;
            document.getElementById("AreaToARB").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaToARB").style.borderColor = "#d5d5d5";
            document.getElementById("AreaFromARB").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaFromARB").style.borderColor = "#d5d5d5";
            $("#AreaToARB").attr("disabled", true);
            $("#AreaFromARB").attr("disabled", true);
            $("#lblPrice").html("");
            //document.getElementById("transPort").style.display = "none";

        }

        function addVan() {

            var f = document.getElementById('transPort');
            var price2 = document.getElementById('lblPrice').innerHTML;

            var txt = f.options[f.selectedIndex].text;

            if (txt == "سياره") {

                document.getElementById('lblPrice').innerHTML = parseInt(price2) + 60; //van price add 60

            }

            if (txt == "دراجة نارية") {
                document.getElementById('lblPrice').innerHTML = parseInt(price2) - 60;
            }


        }

        /*******************************************/
        function areaCheck() {
            var areaTo = document.getElementById('AreaToARB');
            var areaToTxt = areaTo.options[areaTo.selectedIndex].text;
            var areaFrom = document.getElementById('AreaFromARB');
            var areaFromtxt = areaFrom.options[areaFrom.selectedIndex].text;

            if (areaToTxt == "مدينة دبى اللوجيستية" || areaFromtxt == "مدينة دبى اللوجيستية"
             || areaToTxt == "نخلة جبل على" || areaFromtxt == "نخلة جبل على"
             || areaToTxt == "البدرا" || areaFromtxt == "البدرا"
             || areaToTxt == "نادى رماية جبل على" || areaFromtxt == "نادى رماية جبل على"
             || areaToTxt == "نادى صحى وفندق جبل على" || areaFromtxt == "نادى صحى وفندق جبل على") {

                alert("This service in this area is unavailable currently!");
                document.getElementById("CityFromARB").value = "Please select city!";
                document.getElementById("CityToARB").value = "Please select city!";
                document.getElementById("AreaToARB").style.backgroundColor = "#d5d5d5";
                document.getElementById("AreaToARB").style.borderColor = "#d5d5d5";
                document.getElementById("AreaFromARB").style.backgroundColor = "#d5d5d5";
                document.getElementById("AreaFromARB").style.borderColor = "#d5d5d5";
                $("#lblPrice").html("");
                document.getElementById("transPort").style.display = "none";
                disabledDDL();
                document.getElementById("transPort").style.display = ""
            }

            else {
                var val = 'motorcycle'; //set default to van
                $('#transPort').val(val);
            }
        }

        function vehicleReset() {
            var vaL = 'motorcycle'; //set default to motorcycle
            $('#transPort').val(vaL);
        }


        /******************************************************************************/

    </script>
    <script type="text/javascript">

        function validateForm() {

            var x1 = document.forms["orderForm"]["contactPerson"].value;
            var x2 = document.forms["orderForm"]["phoneNumber"].value;
            var x6 = document.forms["orderForm"]["emailAddress"].value;

            var x3 = document.forms["orderForm"]["collAddress"].value;
            var x4 = document.forms["orderForm"]["collContactPerson"].value;
            var x5 = document.forms["orderForm"]["collphoneNumber"].value;
            var x9 = document.forms["orderForm"]["collShip"].value;
            var x7 = document.forms["orderForm"]["collemailAddress"].value;

            var x8 = document.forms["orderForm"]["delAddress"].value;
            var x10 = document.forms["orderForm"]["delEmailAddress"].value;
            var x11 = document.forms["orderForm"]["delContactPerson"].value;
            var x12 = document.forms["orderForm"]["delPhoneNumber"].value;

            /********************************************************************/

            if (x1 == null || x1 == "" || x2 == null || x2 == "" || x3 == null || x3 == "" || x6 == null || x6 == "" ||
 x4 == null || x4 == "" || x5 == null || x5 == "" || x8 == null || x8 == "" || x7 == null || x7 == "" || x10 == null || x10 == "" ||
      x9 == null || x9 == "" || x11 == null || x11 == "" || x12 == null || x12 == "") {
                alert("يجب ملء الحقول المطلوبة بها.");
            }

            if (x1 == null || x1 == "") {
                document.forms["orderForm"]["contactPerson"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["contactPerson"].style.boxShadow = "none";
            }

            if (x2 == null || x2 == "") {
                document.forms["orderForm"]["phoneNumber"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["phoneNumber"].style.boxShadow = "none";
            }

            if (x6 == null || x6 == "") {
                document.forms["orderForm"]["emailAddress"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["emailAddress"].style.boxShadow = "none";
            }
            /**********************************************/

            if (x3 == null || x3 == "") {
                document.forms["orderForm"]["collAddress"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["collAddress"].style.boxShadow = "none";
            }

            if (x4 == null || x4 == "") {
                document.forms["orderForm"]["collContactPerson"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["collContactPerson"].style.boxShadow = "none";
            }

            if (x5 == null || x5 == "") {
                document.forms["orderForm"]["collphoneNumber"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["collphoneNumber"].style.boxShadow = "none";
            }

            if (x9 == null || x9 == "") {
                document.forms["orderForm"]["collShip"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["collShip"].style.boxShadow = "none";
            }

            if (x7 == null || x7 == "") {
                document.forms["orderForm"]["collemailAddress"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["collemailAddress"].style.boxShadow = "none";
            }
            /*********************************/
            if (x8 == null || x8 == "") {
                document.forms["orderForm"]["delAddress"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["delAddress"].style.boxShadow = "none";
            }

            if (x10 == null || x10 == "") {
                document.forms["orderForm"]["delEmailAddress"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["delEmailAddress"].style.boxShadow = "none";
            }

            if (x11 == null || x11 == "") {
                document.forms["orderForm"]["delContactPerson"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["delContactPerson"].style.boxShadow = "none";
            }

            if (x12 == null || x12 == "") {
                document.forms["orderForm"]["delPhoneNumber"].style.boxShadow = "0px 0px 2px 1px red";
            }

            else {
                document.forms["orderForm"]["delPhoneNumber"].style.boxShadow = "none";
            }

            /***************************************/



            var cityTo = document.getElementById('CityToARB');
            var txt1 = cityTo.options[cityTo.selectedIndex].text;
            var cityFrom = document.getElementById('CityFromARB');
            var txt2 = cityFrom.options[cityFrom.selectedIndex].text;


            if (txt1 == "الرجاء اختيار مدينة" || txt2 == "الرجاء اختيار مدينة") {
                alert("اختر المدينة الأولى!");
                return false;
            }

            if (!document.getElementById('termChkbox').checked) {

                alert('يرجى الموافقة على الشروط والأحكام.');
                return false;
            }

            if (document.getElementById('captcha-form').value == null || document.getElementById('captcha-form').value == "") {
                alert("الرجاء إدخال رمز CAPTCHA.");
                return false;
            }

            document.getElementById('City_From').value = txt2;
            document.getElementById('City_To').value = txt1;

            if (txt2 == "دبي" && txt1 == "دبي") {
                var areaFrom = document.getElementById('AreaFromARB');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('AreaToARB');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "الشارقةّ" && txt1 == "الشارقةّ") {
                var areaFrom = document.getElementById('ddlAreaShjFrom1ARB');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlAreaShjTo1ARB');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "دبي" && txt1 == "الشارقةّ") {
                var areaFrom = document.getElementById('ddlAreaDxbFrom1ARB');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlAreaShjTo2ARB');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "الشارقةّ" && txt1 == "دبي") {
                var areaFrom = document.getElementById('ddlFromSharjahARB');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlToDubaiARB');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else {
                var empTy = "";
                document.getElementById('Area_From').value = empTy;
                document.getElementById('Area_To').value = empTy;
            }

            return true;
            document.getElementById("orderForm").submit();
        }

        /***********************************************************/
    </script>
    <script type="text/javascript">
        function validatePhone() {
            $('#phoneChk').keypress(function (e) {
                var charCode = (e.which) ? e.which : e.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            });
        }
        function validatePhone1() {
            $('#phoneChk1').keypress(function (e) {
                var charCode = (e.which) ? e.which : e.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            });
        }
        function validatePhone2() {
            $('#phoneChk2').keypress(function (e) {
                var charCode = (e.which) ? e.which : e.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            });
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
    <title>Mashaweer UAE | Order</title>
    <meta name="description" content="">
    <meta name="keywords" content="mashaweer, personal, business, errand, service, dubai, uae, mashaweeruae balloon and flower delivery, grocery store, pharmacy, eye glass repair, drop your visit visa to the airport, Taking forgotten lunches homework gym clothes to school, Dry Cleaning, Post Office, Drop off and pick-up dry-cleaning, tailoring, alterations, shoe repair, movies, books, Food Delivery, Surprise Gifts Delivery, Bill Payment, Document Delivery, Purchase & Delivery of Stationary, Purchase & Delivery of Coffee/Canteen Supplies, Corporate gifts delivery & Distribution, Bulk Mailings, Package Delivery, send Thank you Cards, Flowers and Hampers, Post office services, Lunch Delivery, Special Delivery, Forget anything anywhere, we will bring wherever you want, united arab emirates, ajman, abu dhabi, fujairah, ras al khaimah, alain, messenger, delivery messengers, trip calculator, relieve stress, save time, save money.">
    <meta name="author" content="">
    <!-- Stylesheets -->
    <link href="../style/stylearbi.css" rel="stylesheet">
    <link href="../style/media1.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="../images/favicon.ico">
</head>
<body onload="disabledDDL();">
    <div class="container" id="pgOrder">
        <div class="content">
            <!-- Header Starts -->
            <header>
  <div class="header" align="right">
  <div class="content">
  <h1><a href="default.aspx"><img src="../images/logo.png" alt="Mashaweer"></a></h1>
  <div class="socialIcons" align="left">
 <div id="smartAddon"><!-- SMARTADDON BEGIN -->
<script type="text/javascript">
    (function () {
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;
        s.src = 'http://s1.smartaddon.com/share_addon.js';
        var j = document.getElementsByTagName('script')[0]; j.parentNode.insertBefore(s, j);
    })();
</script>
<a href="../order.aspx" style="color:#000;">ENGLISH</a>
<p id="tellaFriend">|</p>
<a  id="share" href="http://www.smartaddon.com/?share" title="Share" onclick="return sa_tellafriend('http://www.mashaweeruae.com/')" style="color: #000;text-decoration:underline;">أخبر صديق</a>
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
            <form id="form1" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <div id="valueS">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <div id="priceDivARB">
                                        <p>
                                            تكلفة إجمالية تبلغ
                                            <asp:Label ID="lblPrice" runat="server" Style="color: white"></asp:Label>
                                        درهم
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="AreaToARB" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="CityFromARB" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="CityToARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList name="CityFromARB" ID="CityFromARB" runat="server" AutoPostBack="True"
                                        onchange="myFunction1();" OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CityFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="AreaFromARB" runat="server" AutoPostBack="True" onchange="areaCheck();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjFrom1ARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaDxbFrom1ARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlFromSharjahARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList name="CityToARB" ID="CityToARB" runat="server" AutoPostBack="True"
                                        onchange="myFunction();" OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CityToARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="AreaToARB" runat="server" AutoPostBack="True" onchange="areaCheck();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaToARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjTo1ARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjTo2ARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlToDubaiARB" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFromARB" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <!--              -->
            <form action="order-form-handler.php" method="post" id="orderForm">
            <div>
                <img class="img1" src="imagesARB/fillFormAr.png" alt="Mashaweer" name="fillForm"
                    align="right">
            </div>
            <table id="upperTable">
                <tr>
                    <td>
                        <div id="nameCus">
                            <textarea name="emailAddress" placeholder="*البريد الإلكترونى" required></textarea><span
                                id="asteRik">*</span><textarea name="phoneNumber" id="phoneChk" placeholder="*تليفون"
                                    onclick="validatePhone();" required></textarea><span id="asteRik">*</span></div>
                    </td>
                    <td>
                        <div>
                            <textarea name="customerName" placeholder="إسم العميل / الشركة"></textarea><textarea
                                name="contactPerson" placeholder="*إسم مقدم الطلب" required></textarea><span id="asteRik">*</span></div>
                    </td>
                </tr>
            </table>
            <div>
                <img class="img2" src="imagesARB/locDetailsAr.png" alt="Mashaweer" name="locDetail"
                    width="700" height="45">
            </div>
            <table>
                <tr>
                    <td>
                        <div class="divtbl">
                            <textarea name="delCustomerName" placeholder="الشركة"></textarea>
                            <textarea name="delContactPerson" placeholder="*اسم الراسل" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="delEmailAddress" placeholder="*البريد الإلكترونى" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="delPhoneNumber" placeholder="*تليفون" id="phoneChk1" onclick="validatePhone1();"
                                required></textarea><span id="asteRik">*</span>
                            <textarea name="delAddress" placeholder="*العنوان" required></textarea><span id="asteRik">*</span>
                            <textarea name="delLandmark" placeholder="أقرب مكان مشهور"></textarea><br>
                            <span id="asteRik">*</span><br />
                            <textarea class="textareac1" name="delCity" placeholder="*مدينة" disabled></textarea>
                            <textarea name="delArea" id="delArea" class="area1" placeholder="*المنطقة" disabled></textarea>
                            <textarea name="delInstruction" placeholder="تعليمات" rows="7" style="height: auto;"></textarea>
                            <br>
                        </div>
                    </td>
                    <td>
                        <div class="divtb2">
                            <textarea name="collCustomerName" placeholder="الشركة"></textarea>
                            <textarea name="collContactPerson" placeholder="*اسم الراسل" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="collemailAddress" placeholder="*البريد الإلكترونى" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="collphoneNumber" placeholder="*تليفون" id="phoneChk2" onclick="validatePhone2();"
                                required></textarea><span id="asteRik">*</span>
                            <textarea name="collAddress" placeholder="*العنوان" required></textarea><span id="asteRik">*</span>
                            <textarea name="collLandmark" placeholder="أقرب مكان مشهور"></textarea><br>
                            <span id="asteRik">*</span><br />
                            <textarea class="textareac2" name="collCity" placeholder="*مدينة" disabled></textarea>
                            <textarea name="collArea" id="Textarea1" class="area2" placeholder="*المنطقة" disabled></textarea>
                            <textarea name="collInstruction" placeholder="تعليمات" rows="7" style="height: auto;"></textarea>
                            <textarea name="collShip" placeholder="*وزن وحجم الشحنة أو الرسالة" required></textarea><span
                                id="asteRik">*</span>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="chkbux">
                <p id="payChkbox">
                    المكان المرسل إليه<input type="radio" name="payLoc" value="Collection" checked>
                    المكان المرسل منه<input type="radio" name="payLoc" value="Delivery"><p class="chkbuxtxt">
                        <span style="color: Red;">*</span>مكان الدفع</p>
                    <a class="a5" href="terms.aspx" target="_blank">أوافق على جميع الشروط والأحكام</a><input
                        type="checkbox" name="terms" id="termChkbox">
                </p>
            </div>
            <br>
            <div class="divc4">
                <br>
                <table cellspacing="0" border="0" cellpadding="8">
                    <tr valign="bottom">
                        <td>
                            <img src="captcha.php" id="captcha" style="border-width: 0px;" />
                            <div>
                            </div>
                            <a href="#" onclick="document.getElementById('captcha').src='captcha.php?'+Math.random();"
                                id="change-image" style="text-decoration: none; position: relative;"><span style="font-size: 12px;
                                    text-decoration: underline;">تحديث الصورة</span></a><br />
                            <input type="text" name="captcha" id="captcha-form" autocomplete="off" class="captCha" /><br />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divc5">
                <br>
                <select id="transPort" class="dropDownSmall" name="D1" onchange="addVan()" runat="server">
                    <option value="motorcycle" selected>دراجة نارية</option>
                    <option value="van">سياره</option>
                </select>
                </p>
            </div>
            <div class="divc6">
                <input type="submit" class="blackBtn" id="blkbutn" value="إرسال" style="width: 217px;"
                    onclick="return validateForm();">
                <br>
                <br>
                <input type="reset" class="blackBtn" id="blkbutn" value="مسح" style="width: 217px;"
                    onclick="window.location.reload(true);">
            </div>
            <input name="City_From" id="City_From" type="hidden" />
            <input name="City_To" id="City_To" type="hidden" />
            <input name="Area_From" id="Area_From" type="hidden" />
            <input name="Area_To" id="Area_To" type="hidden" />
            </form>
        </div>
    </div>
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
