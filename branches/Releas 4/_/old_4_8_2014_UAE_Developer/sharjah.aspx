﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="sharjah.aspx.cs"
    Inherits="sharjah" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=ar&dir=rtl"></script>
    <%--<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&language=ar&dir=rtl" type="text/javascript"></script>--%>
    <!-- jQuery Plugin -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">

        /***********************************************

        ***********************************************/

        var csstype = "external" //Specify type of CSS to use. "Inline" or "external"

        //var pc_css = 'body{font-size: 12pt; }' //if "inline", specify PC/default css here

        var mac_externalcss = '../style/mapMac.css' //if "external", specify Mac css file here
        //var pc_css = 'body{font-size: 12pt; }' //if "inline", specify PC/default css here

        //var mac_externalcss = 'style/style.css' //if "external", specify Mac css file here
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

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-32995610-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <script type="text/javascript" src="scripts/progressBar.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta charset="utf-8">
    <title>Mashaweer UAE | Sharjah</title>
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
<a href="arabic/sharjah.aspx" class="inda3">عربي</a>
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
    <!--sections start-->
    <div class="container">
        <div class="content">
            <script type="text/javascript">
	//<![CDATA[
                $(window).load(function () { // makes sure the whole site is loaded
                    $("#status").fadeOut(); // will first fade out the loading animation
                    $("#preloader").delay(350).fadeOut("slow"); // will fade out the white DIV that covers the website.
                })
	//]]>
</script>
            <script type="text/javascript">

                $(window).load($('#transPort').attr('disabled', 'disabled')); // disable dropdown on load


                function myFunction() {
                    var e = document.getElementById('transPort');
                    var price2 = document.getElementById('priceRate').value;

                    toDivInner = document.getElementById('toDiv').innerHTML;
                    if (toDivInner == "") {  //check if toDiv is empty, empty out price
                        price2 = "";
                    }

                    var txt = e.options[e.selectedIndex].text;
                    // var appendPrice;

                    if (txt == "van" && price2 != "") {

                        document.getElementById('priceDivMAP').innerHTML = parseInt(price2) + 60; //van price add 60

                    }

                    if (txt == "motorcycle") {
                        document.getElementById('priceDivMAP').innerHTML = parseInt(price2);
                    }



                }

            </script>
            <!--initializing dxb map-->
            <br>
            <br>
            <br>
            <div id="preloader" style="height: 1px;">
                <div id="status">
                    &nbsp;</div>
            </div>
            <div id="calcBar">
                <div id="clear" style="margin-bottom: 20px;">
                </div>
                <p id="calcS" style="padding-top: 25px; font-size: 0px;">
                    <div id="from">
                        <span id="fromTitle">From<span id="fromDiv" class="fromDivCalc" style="margin-left: 5px;"></span></span></div>
                    <div id="to">
                        <span id="toTitle">To<span id="toDiv" class="toDivCalc" style="margin-left: 10px;"></span></span></div>
                    <div id="price">
                        <span id="priceTitle" style="margin-left: 10px;"><span style="color: #f2b914;">AED</span><span
                            id="priceDivMAP" class="priceDivCalc" style="margin-left: 15px; margin-right: 15px;"></span></span>
                        <span id="selecTor">by
                    </div>
                    <div id="selection">
                        <select id="transPort" class="dropDown" onchange="myFunction()">
                            <option value="motorcycle" selected>motorcycle</option>
                            <option value="van">van</option>
                        </select>
                        <a id="clearmapcalculations" class="blackBtn">reset</a> </span></div>
                </p>
                <input id="priceRate" type="hidden" name="Language" />
            </div>
            <div id="calcBubble" align="right">
                <img src="images/calcBubble.png" alt="Mashaweer" name="calcBubble" width="220" height="360"
                    style="margin-bottom: -140px;">
                <a class="blackBtn" id="bubbleIE" style="margin-left: -206px; width: 141px;" onclick="disAppear();">
                    calculate your order</a>
            </div>
            <!--initializing dxb map-->
            <div id="map_canvas">
                <%-- <div id="map-scroll" style="position: relative; top: -117px; right: -229px">
                <div class="map-holder">
                    <img src="App_Themes/Main/images/map.jpg" width="1400px" height="723px" /></div>
                <!-- Start of Places -->
                <ul id="mapul">
                    <%foreach (var zone in Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>())
                      {
                    %>
                    alert("sdsdsd");
                    <li id="Li1" placeid="<%=zone.ZoneId %>" class="placecalc" style="margin-right: <%= zone.X%>px;
                        margin-top: <%= zone.Y%>px;">
                        <%= Globals.MashaweerLanguage == "en"
                                                        ? zone.EnglishName
                                                        : zone.ArabicName%></li>
                    <%
                      } 
                    %>
                </ul>
                <!-- End of Places -->
            </div>
            <div class="bottom-arrow">
            </div>
            <div class="top-arrow">
            </div>
            <div class="left-arrow">
            </div>
            <div class="right-arrow">
            </div>--%>
            </div>
            <div class="clear">
            </div>
            <script type="text/javascript">

   function disAppear(){
    $("#calcBubble").css("z-index", "0");
   }
    
        $(function () {
            

            $(window).resize(function() {
                var mapheight = $(window).height() - 296;
                if( mapheight > 367)
                        $("#map_canvas").height(mapheight);
            });
        });
<%

//var mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>();
var mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<SharjahZone>();
//var mashaweerZones = new Zone();
%>
        $(function () {

            // Start of Calculating Cost


            var firstplace = "";
            var map;
<%
    foreach(var zone in mashaweerZones)
    {
%>
           
            var marker<%= zone.ZoneId %>;
    
            function toggleBounce<%= zone.ZoneId %>() {


                if (firstplace == "") { 
<%
    foreach(var zone1 in mashaweerZones)
    {

        if (zone1 != zone)
        {
%>
                    if (marker<%=zone1.ZoneId%>.getAnimation() != null)
                        marker<%=zone1.ZoneId%>.setAnimation(null);
<%
        }
    }
%>

                    firstplace = marker<%= zone.ZoneId %>.id;
                    $(".calculator").html("");                    
                    //alert(marker<%= zone.ZoneId %>.title);
                    $(".fromDivCalc").html(marker<%= zone.ZoneId %>.title ); 
                   disAppear();
              
                    $("#fromTitle").show();
                    $('#transPort').attr('disabled', 'disabled'); //disable dropdown
                        var val = 'motorcycle'; //set default to bike
                           $('#transPort').val(val);
                     $(".toDivCalc").html(""); //to empty out the to field if a new pointer is selected    
                      $(".priceDivCalc").html("");   

                       /* $("#toTitle").hide();
                                $("#priceTitle").hide();
                                $("#selecTor").hide();      */
                                     
                    
                    $("#clearmapcalculations").click(function(){
                             clearmapcalc();
                    });
                }
                else {
                // Read a page's GET URL variables and return them as an associative array.


function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

         me = getUrlVars()["me"];
         
         //alert(firstplace + " " + marker<%= zone.ZoneId %>.id)
         if (me != 1 && me!= 2) {me = 1;}
                ///main code starts
                    $.ajax({
                        url: "PriceCalc.ashx?type=1&db=1&from=" + firstplace + "&to=" + marker<%= zone.ZoneId %>.id,
                        cache: false,
                        success: function (data) {
                        
                            if(parseInt(data, 10) === 0)
                                alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            else{
                            var e = document.getElementById('transPort');
                            e.disabled =true;
                             //   $(".calculator").html(data);
                              //  $(".calculator").html(data);
                               $(".toDivCalc").html(marker<%= zone.ZoneId %>.title);
                                  
                               $(".priceDivCalc").html(parseInt(data)); 
                             

                               function terms() {
                                  document.getElementById('priceRate').value=data }
                               
                               terms(data);
                               
                               
                               
                               }

                            firstplace = "";
                        },
                        error: function (data) {
                        alert("Error");
                            alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            $("#form-state").html("");
                        },
                        complete: function () {
                             var e = document.getElementById('transPort');
                             e.disabled = false;
                             $("#clearmapcalculations").click(function(){
                             clearmapcalc();
                            });
                        }
                    });
                }
                if (marker<%= zone.ZoneId %>.getAnimation() == null) {
                    marker<%= zone.ZoneId %>.setAnimation(google.maps.Animation.BOUNCE);
                }
            }
<%
    }
%>
            function clearmapcalc(){

                firstplace = "";
      $(".calculator").html("");
                $(".fromDivCalc").html("");
                $(".toDivCalc").html("");
                $(".priceDivCalc").html("");

<%
    foreach(var zoneClear in mashaweerZones)
    {

%>
                if (marker<%=zoneClear.ZoneId%>.getAnimation() != null)
                    marker<%=zoneClear.ZoneId%>.setAnimation(null);
<%
    }
%>
            }
            function initialize() {
                var mapOptions = {
                    zoom: 11,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                   center: new google.maps.LatLng(25.33333, 55.453333)
                };

                map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

<%
    foreach(var zone in mashaweerZones)
    {
%>

                marker<%= zone.ZoneId %> = new google.maps.Marker({
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    icon: new google.maps.MarkerImage("images/marker1.png"),
                    position: new google.maps.LatLng(<%= zone.X %>, <%= zone.Y %>),
                    id: "<%= zone.ZoneId %>",
                    title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? zone.EnglishName
                                                            : zone.ArabicName%>"
                });
                google.maps.event.addListener(marker<%= zone.ZoneId %>, 'click', toggleBounce<%= zone.ZoneId %>);
<%
    }
%>
            }
            initialize();
        });
            </script>
            <script type="text/javascript" language="javascript">
        
            $(".placecalc").click(function () {
                if (firstplace == "") {
                    firstplace = $(this).attr("placeid");
                   
                    $("#clearmapcalculations").click(function(){
                         firstplace = "";
                        $(".calculator").html("");
                    });
                }
                else {
                    $.ajax({
                        url: "CalculateHandler.ashx?type=1&db=1&from=" + firstplace + "&to=" +  $(this).attr("placeid"),
                        cache: false,
                        success: function (data) {
                            if(parseInt(data, 10) === 0)
                                alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            else
                            //    $(".calculator").html(data);
                            firstplace = "";
                        },
                        error: function (data) {
                            alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            $("#form-state").html("");
                        },
                        complete: function () {
                             $("#clearmapcalculations").click(function(){
                                firstplace = "";
                                $(".calculator").html("");
                            });
                        }
                    });
                }
            });

            // End of Calculating Cost

            // Start of Moving Map
            var animationHandler;
            $(".left-arrow, .right-arrow, .top-arrow, .bottom-arrow").mouseup(function () {
                $('#map-scroll').stop(true);
            });

            $(".left-arrow").mousedown(function () {
                $('#map-scroll').animate({ 'margin-right': "-455px" }, 800);
            });

            $(".right-arrow").mousedown(function () {
                $('#map-scroll').animate({ 'margin-right': "229px" }, 800);
            });

            $(".top-arrow").mousedown(function () {
                $('#map-scroll').animate({ 'margin-top': "115px" }, 800);
            });

            $(".bottom-arrow").mousedown(function () {
                $('#map-scroll').animate({ 'margin-top': "-115px" }, 800);
            });
            // End of Moving Map
        });

            </script>
            <%--<script type="text/javascript">
    //<![CDATA[

        if (GBrowserIsCompatible()) {

            var polys = [];
            var labels = [];

            GPolygon.prototype.Contains = function (point) {
                var j = 0;
                var oddNodes = false;
                var x = point.lng();
                var y = point.lat();
                for (var i = 0; i < this.getVertexCount(); i++) {
                    j++;
                    if (j == this.getVertexCount()) { j = 0; }
                    if (((this.getVertex(i).lat() < y) && (this.getVertex(j).lat() >= y))
          || ((this.getVertex(j).lat() < y) && (this.getVertex(i).lat() >= y))) {
                        if (this.getVertex(i).lng() + (y - this.getVertex(i).lat())
            / (this.getVertex(j).lat() - this.getVertex(i).lat())
            * (this.getVertex(j).lng() - this.getVertex(i).lng()) < x) {
                            oddNodes = !oddNodes
                        }
                    }
                }
                return oddNodes;
            }



            // Display the map, with some controls and set the initial location 
            var map = new GMap2(document.getElementById("map_canvas"));
            //            map.addControl(new GLargeMapControl());
            //            map.addControl(new GMapTypeControl());
            map.setCenter(new GLatLng(25.27854, 55.33024), 13); //25.155929, 55.224667), 13);
            map.enableScrollWheelZoom();


            //            GEvent.addListener(map, "click", function (overlay, point) {
            //                if (!overlay) {
            //                    for (var i = 0; i < polys.length; i++) {
            //                        if (polys[i].Contains(point)) {
            //                            map.openInfoWindowHtml(point, "You clicked on " + labels[i]);
            //                            //i = 999; // Jump out of loop
            //                        }
            //                    }
            //                }
            //            });

            //            GEvent.addListener(map, "mouseover", function (overlay, point) {
            //                if (!overlay) {
            //                    for (var i = 0; i < polys.length; i++) {
            //                        if (polys[i].Contains(point)) {
            //                            map.openInfoWindowHtml(point, "You clicked on " + labels[i]);
            //                            //i = 999; // Jump out of loop
            //                        }
            //                    }
            //                }
            //            });


            var marker = new GMarker(new GLatLng(25.27854, 55.33024), { draggable: false, bouncy: true, title: "Hello World!" });

            map.addOverlay(marker);

//            var marker = new google.maps.Marker({
//                map: map,
//                animation: google.maps.Animation.DROP,
//                position: new GLatLng(25.27854, 55.33024),
//                title: "Place"
//            });
            //google.maps.event.addListener(marker, 'click', toggleBounce);

            // Read the data from states.xml

            //            var request = GXmlHttp.create();
            //            request.open("GET", "states.xml", true);
            //            request.onreadystatechange = function () {
            //                if (request.readyState == 4) {
            //                    var xmlDoc = GXml.parse(request.responseText);

            //                    // ========= Now process the polylines ===========
            //                    var states = xmlDoc.documentElement.getElementsByTagName("state");

            //                    // read each line
            //                    for (var a = 0; a < states.length; a++) {
            //                        // get any state attributes
            //                        var label = states[a].getAttribute("name");
            //                        var colour = states[a].getAttribute("colour");
            //                        // read each point on that line
            //                        var points = states[a].getElementsByTagName("point");
            //                        var pts = [];
            //                        for (var i = 0; i < points.length; i++) {
            //                            pts[i] = new GLatLng(parseFloat(points[i].getAttribute("lat")),
            //                                   parseFloat(points[i].getAttribute("lng")));
            //                        }
            //                        var poly = new GPolygon(pts, "#000000", 1, 1, colour, 0.2, { clickable: false });
            //                        polys.push(poly);
            //                        labels.push(label);
            //                        map.addOverlay(poly);
            //                    }
            //                    // ================================================           
            //                }
            //            }
            //            request.send(null);


        }

        // display a warning if the browser was not compatible
        else {
            alert("Sorry, the Google Maps API is not compatible with this browser");
        }

        function toggleBounce() {

            if (marker.getAnimation() != null) {
                marker.setAnimation(null);
            } else {
                marker.setAnimation(google.maps.Animation.BOUNCE);
            }
        }

    //]]>
    </script>--%>
            <br>
            <br>
            <!-- calculation div ends with style-->
            <img src="images/calcImage.png" alt="Mashaweer" name="calcImg" width="919" height="213">
            <div id="placeOrder" style="margin-top: -45px; margin-right: 65px;" align="right">
                <a href="order.aspx" class="blackBtn">click here</a>
            </div>
            <br>
            <br>
        </div>
    </div>
    <!-- body ends -->
    <br>
    <br>
    <br>
    <div class="footer">
        <div class="content">
            <img src="images/footerSep.png" alt="Mashaweer" name="footerBar" width="941" height="17">
            <p class="indp2">
                <a href="default.aspx" style="padding-left: 0px !important;">home</a>|<a href="services.aspx">our
                    services</a>|<a href="location.aspx">online calculator</a>|<a href="order.aspx">place
                        an order</a>|<a href="faq.aspx">FAQ</a>|<a href="contact.aspx">contact us</a>|<a
                            href="terms.aspx">terms and conditions</a></p>
        </div>
    </div>
</body>
</html>