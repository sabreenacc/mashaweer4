<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Calculator,App_Web_e5xlbhse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=ar&dir=rtl"></script>
    <%--<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&language=ar&dir=rtl" type="text/javascript"></script>--%>
    <title>Mashaweer Dubai | Calculator</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--sections start-->
    <div class="page-titlebar">
        <div class="title-l">
        </div>
        <div class="title-r">
        </div>
        <div class="title-cntr">
            <div class="title-txt">
                <asp:Literal ID="ltrlCalculatorTitle" runat="server" Text="<%$ Resources:LanguageFile, CALCULATOR%>" />
            </div>
            <div class="calculator total-cost">
            </div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>
    <div class="page-content">
        <span style="line-height:20px; font-weight: bolder; font-size:18px; margin-bottom: 10px; display:inline-block; color: #11574B;">
            <asp:Literal ID="ltrlCalculatorMapGuide" runat="server" Text="<%$ Resources:LanguageFile, CALCULATOR_MAP_GUIDE%>" />
        </span>
        <div id="map_canvas" style="height: 367px; width: 941px; border-color: #11574B; border-width: 6px;
            border-style: solid; overflow: hidden; position: relative; direction: rtl;">
            <%-- <div id="map-scroll" style="position: relative; top: -117px; right: -229px">
                <div class="map-holder">
                    <img src="App_Themes/Main/images/map.jpg" width="1400px" height="723px" /></div>
                <!-- Start of Places -->
                <ul id="mapul">
                    <%foreach (var zone in Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>())
                      {
                    %>
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
    </div>
    <script type="text/javascript">
    
        $(function () {
            var mapheight = $(window).height() - $(".footer").outerHeight(true) - $(".page-titlebar").outerHeight(true) - $(".header").outerHeight(true) - 55;
            if( mapheight > 367)
                        $("#map_canvas").height(mapheight);

            $(window).resize(function() {
                var mapheight = $(window).height() - 296;
                if( mapheight > 367)
                        $("#map_canvas").height(mapheight);
            });
        });
<%
    var mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>();
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
                    $(".calculator").html("<asp:Literal ID="ltrlFrom" runat="server" Text="<%$ Resources:LanguageFile, FROM%>" /><span class='grayspan'> " + marker<%= zone.ZoneId %>.title + "</span> <asp:Literal ID="ltrlbyMtrCle1" runat="server" Text="<%$ Resources:LanguageFile, BYMOTORCYCLE%>" /> <input type='button' id='clearmapcalculations' class='snd-btn' value='<asp:Literal ID="ltrlReset" runat="server" Text="<%$ Resources:LanguageFile, RESET%>" />' /></div>");
                    $("#clearmapcalculations").click(function(){
                             clearmapcalc();
                    });
                }
                else {
                    $.ajax({
                        url: "/CalculateHandler.ashx?type=1&db=1&from=" + firstplace + "&to=" + marker<%= zone.ZoneId %>.id,
                        cache: false,
                        success: function (data) {
                            if(parseInt(data, 10) === 0)
                                alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            else
                                $(".calculator").html(data);
                            firstplace = "";
                        },
                        error: function (data) {
                            alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            $("#form-state").html("");
                        },
                        complete: function () {
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
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(25.20105815, 55.320110)
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
                    $(".calculator").html("<asp:Literal ID="ltrlFrom1" runat="server" Text="<%$ Resources:LanguageFile, FROM%>" /><span class='grayspan'> " + $(this).html() + "</span> <asp:Literal ID="ltrlbyMtrCle" runat="server" Text="<%$ Resources:LanguageFile, BYMOTORCYCLE%>" /> <input type='button' id='clearmapcalculations' class='snd-btn' value='<asp:Literal ID="ltrlReset1" runat="server" Text="<%$ Resources:LanguageFile, RESET%>" />' />");
                    $("#clearmapcalculations").click(function(){
                         firstplace = "";
                        $(".calculator").html("");
                    });
                }
                else {
                    $.ajax({
                        url: "/CalculateHandler.ashx?type=1&db=1&from=" + firstplace + "&to=" +  $(this).attr("placeid"),
                        cache: false,
                        success: function (data) {
                            if(parseInt(data, 10) === 0)
                                alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                            else
                                $(".calculator").html(data);
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
</asp:Content>
