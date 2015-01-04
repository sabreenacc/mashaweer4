<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">

        function msg() {
            alert("Please select a Destination City");
        }

        function myFunction1() {
            msg();
            myFunction();
        }


        function myFunction() {

            var e = document.getElementById('CityTo');
            var txt = e.options[e.selectedIndex].text;
            var e1 = document.getElementById('CityFrom');
            var txt1 = e1.options[e1.selectedIndex].text;




            if (txt1 == "Dubai" && txt == "Dubai" || txt1 == "Sharjah" && txt == "Sharjah" || txt1 == "Dubai" && txt == "Sharjah" || txt1 == "Sharjah" && txt == "Dubai") {
                $("#lblPrice").html("");
                var val = 'motorcycle'; //set default to van
                $('#transPort1').val(val);

                document.getElementById("collArea").style.backgroundColor = "#fff";
                document.getElementById("collArea").style.borderColor = "#fff";

                document.getElementById("delArea").style.backgroundColor = "#fff";
                document.getElementById("delArea").style.borderColor = "#fff";
                $("#transPort1").attr("disabled", false);
                document.getElementById("transPort1").style.display = "";

            }


            else if (txt == "Abu Dhabi" && txt1 == "Abu Dhabi" || txt == "Ajman" && txt1 == "Ajman" || txt == "Al Ain" && txt1 == "Al Ain"
        || txt == "Fujairah" && txt1 == "Fujairah" || txt == "Ras al-Khaimah" && txt1 == "Ras al-Khaimah"
        || txt == "Umm al-Quwain" && txt1 == "Umm al-Quwain") {
                $("#lblPrice").html("");
                alert("This service is unavailable currently!");
                document.getElementById("CityFrom").value = "Please select city";
                document.getElementById("CityTo").value = "Please select city";
                $("#lblPrice").value("");
                ("#transPort1").attr("disabled", true);
                //document.getElementById("transPort1").style.display = "none";
                resetAll();
            }

            else {
                $("#lblPrice").html("");
                var val = 'van'; //set default to van
                $('#transPort1').val(val);
                $("#transPort1").attr("disabled", true);
                document.getElementById("transPort1").style.display = "";
            }
        }

        function disabledDDL() {

            var val = 'motorcycle'; //set default to van
            $('#transPort1').val(val);
            $("#transPort1").attr("disabled", true);
            $("#AreaTo").attr("disabled", true);
            $("#AreaFrom").attr("disabled", true);
            $("#CityFrom")[0].selectedIndex = 8;
            $("#CityTo")[0].selectedIndex = 8;
            document.getElementById("collArea").style.backgroundColor = "#d5d5d5";
            document.getElementById("collArea").style.borderColor = "#d5d5d5";
            document.getElementById("delArea").style.backgroundColor = "#d5d5d5";
            document.getElementById("delArea").style.borderColor = "#d5d5d5";

            document.getElementById("AreaTo").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaTo").style.borderColor = "#d5d5d5";
            document.getElementById("AreaTo").style.color = "#d5d5d5";
            document.getElementById("AreaFrom").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaFrom").style.borderColor = "#d5d5d5";
            document.getElementById("AreaFrom").style.color = "#d5d5d5";
            $("#lblPrice").html("");
            resetAll();
        }

        function resetAll() {
            $("#CityFrom")[0].selectedIndex = 8;
            $("#CityTo")[0].selectedIndex = 8;
            document.getElementById("AreaTo").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaTo").style.borderColor = "#d5d5d5";
            document.getElementById("AreaFrom").style.backgroundColor = "#d5d5d5";
            document.getElementById("AreaFrom").style.borderColor = "#d5d5d5";
            $("#AreaTo").attr("disabled", true);
            $("#AreaFrom").attr("disabled", true);
            $("#lblPrice").html("");
            //document.getElementById("transPort").style.display = "none";

        }

        function addVan() {

            var f = document.getElementById('transPort1');
            var price2 = document.getElementById('lblPrice').innerHTML;

            var txt = f.options[f.selectedIndex].text;


            if (txt == "van") {

                document.getElementById('lblPrice').innerHTML = parseInt(price2) + 60; //van price add 60

            }

            if (txt == "motorcycle") {
                document.getElementById('lblPrice').innerHTML = parseInt(price2) - 60;
            }


        }

        /*******************************************/
        function areaCheck() {

            var areaTo = document.getElementById('AreaTo');
            var areaToTxt = areaTo.options[areaTo.selectedIndex].text;
            var areaFrom = document.getElementById('AreaFrom');
            var areaFromtxt = areaFrom.options[areaFrom.selectedIndex].text;

            if (areaToTxt == "Dubai Logistics City" || areaFromtxt == "Dubai Logistics City"
             || areaToTxt == "Palm Jebel Ali" || areaFromtxt == "Palm Jebel Ali"
             || areaToTxt == "Al Badrah" || areaFromtxt == "Al Badrah"
             || areaToTxt == "Jebel Ali Shooting Club" || areaFromtxt == "Jebel Ali Shooting Club"
             || areaToTxt == "Jebel Ali Hotel & Spa" || areaFromtxt == "Jebel Ali Hotel & Spa") {

                alert("This service in this area is unavailable currently!");
                document.getElementById("CityFrom").value = "Please select city!";
                document.getElementById("CityTo").value = "Please select city!";
                document.getElementById("AreaTo").style.backgroundColor = "#d5d5d5";
                document.getElementById("AreaTo").style.borderColor = "#d5d5d5";
                document.getElementById("AreaFrom").style.backgroundColor = "#d5d5d5";
                document.getElementById("AreaFrom").style.borderColor = "#d5d5d5";
                $("#lblPrice").html("");
                ("#transPort1").attr("disabled", true);
                //document.getElementById("transPort1").style.display = "none";
                resetAll();
                disabledDDL();
            }

            else {
                var val = 'motorcycle'; //set default to motorcycle
                $('#transPort1').val(val);
            }
        }

        function vehicleReset() {
            var vaL = 'motorcycle'; //set default to motorcycle
            $('#transPort1').val(vaL);
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
                alert("Required fields must be filled out");
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
            var cityTo = document.getElementById('CityTo');
            var txt1 = cityTo.options[cityTo.selectedIndex].text;
            var cityFrom = document.getElementById('CityFrom');
            var txt2 = cityFrom.options[cityFrom.selectedIndex].text;

            var x = document.forms["orderForm"]["emailAddress"].value;
            var y = document.forms["orderForm"]["collemailAddress"].value;
            var z = document.forms["orderForm"]["delEmailAddress"].value;

            var x = document.forms["orderForm"]["emailAddress"].value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");

            var y = document.forms["orderForm"]["collemailAddress"].value;
            var atpos = y.indexOf("@");
            var dotpos = y.lastIndexOf(".");

            var z = document.forms["orderForm"]["delEmailAddress"].value;
            var atpos = z.indexOf("@");
            var dotpos = z.lastIndexOf(".");

            var atpos1 = x.indexOf("@");
            var dotpos1 = x.lastIndexOf(".");

            var atpos2 = y.indexOf("@");
            var dotpos2 = y.lastIndexOf(".");

            var atpos3 = z.indexOf("@");
            var dotpos3 = z.lastIndexOf(".");



            if (txt1 == "Please select city" || txt2 == "Please select city") {
                alert("Please select a city first");

                return false;
            }


            if (atpos1 < 1 || dotpos1 < atpos1 + 2 || dotpos1 + 2 >= x.length) {
                alert("Customer Details, e-mail address missing or not valid");
                document.forms["orderForm"]["emailAddress"].focus();
                return false;
            }


            if (atpos2 < 1 || dotpos2 < atpos2 + 2 || dotpos2 + 2 >= y.length) {
                alert("Collection Location Details, e-mail address missing or not valid");
                document.forms["orderForm"]["collemailAddress"].focus();
                return false;
            }


            if (atpos3 < 1 || dotpos3 < atpos3 + 2 || dotpos3 + 2 >= z.length) {
                alert("Delivery Location Details, e-mail address missing or not valid");
                document.forms["orderForm"]["delEmailAddress"].focus();
                return false;
            }

            if (!document.getElementById('termChkbox').checked) {

                alert('Please agree to the terms and conditions!');
                return false;
            }

            if (document.getElementById('captcha-form').value == null || document.getElementById('captcha-form').value == "") {
                alert("Please enter the CAPTCHA code");
                return false;
            }



            document.getElementById('City_From').value = txt2;
            document.getElementById('City_To').value = txt1;

            if (txt2 == "Dubai" && txt1 == "Dubai") {
                var areaFrom = document.getElementById('AreaFrom');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('AreaTo');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "Sharjah" && txt1 == "Sharjah") {
                var areaFrom = document.getElementById('ddlAreaShjFrom1');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlAreaShjTo1');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "Dubai" && txt1 == "Sharjah") {
                var areaFrom = document.getElementById('ddlAreaDxbFrom1');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlAreaShjTo2');
                var at1 = areaTo.options[areaTo.selectedIndex].text;
                document.getElementById('Area_To').value = at1;
                //alert(at1);

            }

            else if (txt2 == "Sharjah" && txt1 == "Dubai") {
                var areaFrom = document.getElementById('ddlFromSharjah');
                var af1 = areaFrom.options[areaFrom.selectedIndex].text;
                document.getElementById('Area_From').value = af1;
                //alert(af1);

                var areaTo = document.getElementById('ddlToDubai');
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
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="robots" content="index, follow" />
    <!-- Stylesheets -->
    <link href="style/style.css" rel="stylesheet">
    <link href="style/media1.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon1.ico">
</head>
<body onload="disabledDDL();">
    <div class="container">
        <div class="content">
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
<a href="arabic/order.aspx" class="inda3">عربي</a>
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
            <!--              -->
            <form id="form1" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <div id="valueS">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <div id="priceDiv">
                                        <p>
                                            The total cost is
                                            <asp:Label ID="lblPrice" runat="server" Style="color: white"></asp:Label>
                                        AED
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="AreaTo" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="CityFrom" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="CityTo" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList name="CityFrom" ID="CityFrom" runat="server" AutoPostBack="True"
                                        onchange="myFunction1();" OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CityFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="AreaFrom" runat="server" AutoPostBack="True" onchange="areaCheck();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjFrom1" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaDxbFrom1" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlFromSharjah" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList name="CityTo" ID="CityTo" runat="server" AutoPostBack="True" onchange="myFunction();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CityTo" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="AreaTo" runat="server" AutoPostBack="True" onchange="areaCheck();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaTo" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjTo1" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlAreaShjTo2" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlToDubai" runat="server" AutoPostBack="True" onchange="vehicleReset();"
                                        OnSelectedIndexChanged="DDLRate" CssClass="dropDown">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AreaFrom" EventName="SelectedIndexChanged" />
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
                <img style="margin-left: -15px;" src="images/fillForm.png" alt="Mashaweer" name="fillForm"
                    width="962" height="130">
            </div>
            <table>
                <tr>
                    <td>
                        <div>
                            <textarea name="customerName" placeholder="Customer/Company Name"></textarea><textarea
                                name="contactPerson" placeholder="Contact Person *" required></textarea><span id="asteRik">*</span></div>
                    </td>
                    <td>
                        <div>
                            <textarea name="emailAddress" placeholder="Email Address *" required></textarea><span
                                id="asteRik">*</span><textarea id="phoneChk" name="phoneNumber" placeholder="Phone Number *"
                                    onclick="validatePhone();" required></textarea><span id="asteRik">*</span></div>
                    </td>
                </tr>
            </table>
            <div>
                <img style="margin-left: -15px;" src="images/locDetails.png" alt="Mashaweer" name="locDetail"
                    width="962" height="65">
            </div>
            <table>
                <tr>
                    <td>
                        <div style="margin-top: -5px">
                            <textarea name="collCustomerName" placeholder="Customer/Company Name"></textarea>
                            <textarea name="collContactPerson" placeholder="Contact Person *" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="collemailAddress" placeholder="Email Address *" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="collphoneNumber" id="phoneChk1" placeholder="Phone Number *" onclick="validatePhone1();"
                                required></textarea><span id="asteRik">*</span>
                            <textarea name="collAddress" placeholder="Address *" required></textarea><span id="asteRik">*</span>
                            <textarea name="collLandmark" placeholder="Nearest Landmark"></textarea><br>
                            <span id="asteRik" style="margin-left: 410px">*</span><br />
                            <textarea name="collCity" style="width: 80px; margin-top: -20px;" placeholder="City *"
                                disabled></textarea><br />
                            <textarea name="collArea" id="collArea" style="width: 80px;" placeholder="Area *"
                                disabled></textarea>
                            <textarea name="collInstruction" placeholder="Instructions" rows="7" style="height: auto;"></textarea>
                            <textarea name="collShip" placeholder="Parcel details*" required></textarea><span
                                id="asteRik">*</span>
                            <br>
                        </div>
                    </td>
                    <td>
                        <div>
                            <textarea name="delCustomerName" placeholder="Customer/Company Name"></textarea>
                            <textarea name="delContactPerson" placeholder="Contact Person *" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="delEmailAddress" placeholder="Email Address *" required></textarea><span
                                id="asteRik">*</span>
                            <textarea name="delPhoneNumber" id="phoneChk2" placeholder="Phone Number *" onclick="validatePhone2();"
                                required></textarea><span id="asteRik">*</span>
                            <textarea name="delAddress" placeholder="Address *" required></textarea><span id="asteRik">*</span>
                            <textarea name="delLandmark" placeholder="Nearest Landmark"></textarea><br>
                            <span id="asteRik" style="margin-left: 410px">*</span><br />
                            <textarea name="delCity" style="width: 80px; margin-top: -20px;" placeholder="City *"
                                disabled></textarea><br />
                            <textarea name="delArea" id="delArea" style="width: 80px;" placeholder="Area *" disabled></textarea>
                            <textarea name="delInstruction" placeholder="Instructions" rows="7" style="height: auto;"></textarea>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="chkbux">
                <p>
                    Payment Location <span id="asteRik">*</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
                        name="payLoc" value="Collection" checked>Collection&nbsp;&nbsp;
                    <input type="radio" name="payLoc" id="payLoc" value="Delivery">Delivery
                    <br>
                    <br>
                    <input type="checkbox" name="terms" id="termChkbox">I agree to all <a style="color: #000"
                        href="terms.aspx" target="_blank">terms and conditions</a>
                </p>
            </div>
            <br>
            <div style="width: 415px; height: 150px; margin-top: 10px;">
                <br>
                <table cellspacing="0" border="0" cellpadding="8">
                    <tr valign="bottom">
                        <td>
                            <img src="captcha.php" id="captcha" style="border-width: 0px;" />
                            <div>
                            </div>
                            <a href="#" onclick="document.getElementById('captcha').src='captcha.php?'+Math.random();"
                                id="change-image" style="text-decoration: none;"><span style="font-size: 12px; text-decoration: underline;">
                                    Reload Image</span></a><br />
                            <input type="text" name="captcha" id="captcha-form" autocomplete="off" class="captCha" /><br />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-left: 485px; margin-top: -170px;">
                <br>
                <select id="transPort1" class="dropDown" name="D1" onchange="addVan()">
                    <option value="motorcycle" selected>motorcycle</option>
                    <option value="van">van</option>
                </select>
                </p>
                <input type="submit" class="blackBtn" id="blkbutn" value="Send" style="border: none;
                    width: 217px;" onclick="return validateForm();">
                <br>
                <br>
                <input type="reset" class="blackBtn" id="blkbutn" value="Clear" style="border: none;
                    width: 217px;" onclick="window.location.reload(true);">
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
