<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Calculator.aspx.cs" Inherits="Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=ar&dir=rtl"></script>
    <%--<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&language=ar&dir=rtl" type="text/javascript"></script>--%>
    <title>
        <%=Resources.LanguageFile.SiteCalculator %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="order-bar">
            <table class="form2-grid" width="100%" border="1" cellpadding="1" cellspacing="1">
                <tr id="#calculator" class="calculator-row">
                    <td width="4%" class="yellow-label">
                        <%=Resources.LanguageFile.STFrom %>
                    </td>
                    <td width="22%" id="FromCalc">
                    </td>
                    <td width="4%" class="yellow-label">
                        <%=Resources.LanguageFile.STTo %>
                    </td>
                    <td width="19%" id="ToCalc">
                    </td>
                    <td>
                        <span id="ToCost"></span>
                    </td>
                    <td>
                        <span class="yellow-label">
                            <%=Resources.LanguageFile.STCurency %></span>
                    </td>
                    <td width="11%" class="yellow-label">
                        <%=Resources.LanguageFile.STVia %>
                    </td>
                    <td width="29%" align="center">
                    <% if (STRCity == "0") {%>
                            <%=Resources.LanguageFile.STVAN%>
                    <% } else { %>
                        <select name="select" class="via-select">
                            <%=Resources.LanguageFile.STSelectMotor%>
                        </select>
                    <% } %>
                        <input type="button" id='clearmapcalculations' class="cancel-btn" value="<%=Resources.LanguageFile.btnCancel %>" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
        <div class="map-warp">
            <div class="map-bubble">
                <input type="button" class="normal-btn map-btn" value="<%=Resources.LanguageFile.STcalculateorder %>" />
            </div>
            <div id="map_canvas" style="height: 350px;">
            </div>
        </div>
        <div class="under-map-banner">
            <div class="rt-part">
                <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/undermap-banner1.png" /></div>
            <div class="lft-part">
                <a href="Order.aspx">
                    <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/send-order.png" /></a></div>
        </div>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript">
         
       
<%
    var mashaweerZones = new List<Zone>();
    if(STRCity == "1")
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>( z => z.EmirateId == 1);
    else if(STRCity == "2")
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>( z => z.EmirateId == 2);
    else if(STRCity == "3")
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>( z => z.EmirateId == 3);
    else if(STRCity == "4")
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>( z => z.EmirateId == 1 || z.EmirateId == 3);
    else if(STRCity == "0")
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<EEmirate>().Select(emrt => new Zone { ZoneId = emrt.EmirateId, X = emrt.X.Value, Y = emrt.Y.Value, EmirateId = 0, ArabicName = emrt.ArabicName, EnglishName = emrt.EnglishName }).ToList();
    else
        mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>();
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
                
                $(".map-bubble").hide();

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
                    $("#FromCalc").html( marker<%= zone.ZoneId %>.title); 
                    $("#clearmapcalculations").click(function(){
                             clearmapcalc();
                    });
                }
                else {
                    <% if(STRCity == "0") {%>
                        if(firstplace == 1 && marker<%= zone.ZoneId %>.id == 1) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STDBMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=1";
                            return;
                        } else if(firstplace == 2 && marker<%= zone.ZoneId %>.id == 2) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STADMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=2";
                            return;
                        } else if(firstplace == 3 && marker<%= zone.ZoneId %>.id == 3) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STSHMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=3";
                            return;
                        } else if((firstplace == 1 && marker<%= zone.ZoneId %>.id == 3) || (firstplace == 3 && marker<%= zone.ZoneId %>.id == 1)) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STDBSHMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=4";
                            return;
                        }

                    <% } %>

                    $.ajax({
                    <% if(STRCity == "0") {%>
                        url: "CalculateHandler.ashx?type=2&db=1&from=null&to=null&fromEmirate=" + firstplace + "&toEmirate=" + marker<%= zone.ZoneId %>.id,
                    <% } else {%>
                        url: "CalculateHandler.ashx?type="+ $(".via-select").val() +"&db=1&from=" + firstplace + "&to=" + marker<%= zone.ZoneId %>.id,
                    <% } %>
                        cache: false,
                        success: function (data) {
                            if(parseInt(data, 10) === 0)
                                alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            else
                            {
                                var lstData= data.split(',');
                                if(lstData.length >2)
                                {

                                    $("#FromCalc").html(lstData[0]);
                                    $("#ToCalc").html(lstData[1]);
                                    $("#ToCost").html(lstData[2]);
                                }
                            }
                            firstplace = "";
                        },
                        error: function (data) {
                            alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
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
                $("#ToCalc").html("");
                $("#ToCost").html("");
                $("#FromCalc").html("");
         
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


            //var result = Options.SelectedValue;

            <%if(STRCity=="0"){ %>
            var mapOptions = {
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(24.88644, 56.04126)
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            function initialize() {
                var mapOptions2 = {
                    zoom: 8,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(24.88644, 56.04126)
                };

            <% } else if(STRCity=="3"){ %>
            var mapOptions = {
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(25.35224815054477, 55.42396545410156)
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            function initialize() {
                var mapOptions2 = {
                    zoom: 13,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(25.35224815054477, 55.42396545410156)
                };
            <% } else if(STRCity=="2"){ %>
            var mapOptions = {
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(24.468088137204234, 54.4456672668457)
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            function initialize() {
                var mapOptions2 = {
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(24.468088137204234, 54.4456672668457)
                };
            <% } else { %>
            var mapOptions = {
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(25.20105815, 55.320110)
                };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            function initialize() {
                var mapOptions2 = {
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(25.20105815, 55.320110)
                };
                
            <% }  %>
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions2);
               


<%
    foreach(var zone in mashaweerZones)
    {
%>
                if (<%=zone.EmirateId%> == "1")
                {
                marker<%= zone.ZoneId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
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
                }
                else if(<%=zone.EmirateId%> == "2")
                {                marker<%= zone.ZoneId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= zone.X %>, <%= zone.Y %>),
                    id: "<%= zone.ZoneId %>",
                    title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? zone.EnglishName
                                                            : zone.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= zone.ZoneId %>, 'click', toggleBounce<%= zone.ZoneId %>);}
                else if(<%=zone.EmirateId%> == "3")
                {                marker<%= zone.ZoneId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= zone.X %>, <%= zone.Y %>),
                    id: "<%= zone.ZoneId %>",
                    title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? zone.EnglishName
                                                            : zone.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= zone.ZoneId %>, 'click', toggleBounce<%= zone.ZoneId %>);}
                else if(<%=zone.EmirateId%> == "0")
                {                marker<%= zone.ZoneId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= zone.X %>, <%= zone.Y %>),
                    id: "<%= zone.ZoneId %>",
                    title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? zone.EnglishName
                                                            : zone.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= zone.ZoneId %>, 'click', toggleBounce<%= zone.ZoneId %>);}
                
                else
                {
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
                }
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
                    $("#FromCalc").html( $(this).html());
                    $("#clearmapcalculations").click(function(){
                        firstplace = "";
                        $("#ToCalc").html("");
                        $("#ToCost").html("");
                        $("#FromCalc").html("");
         
                    });
                }
                else {
                    <% if(STRCity == "0") {%>
                        if(firstplace == 1 && $(this).attr("placeid") == 1) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STDBMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=1";
                            return;
                        } else if(firstplace == 2 && $(this).attr("placeid") == 2) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STADMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=2";
                            return;
                        } else if(firstplace == 3 && $(this).attr("placeid") == 3) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STSHMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=3";
                            return;
                        } else if((firstplace == 1 && $(this).attr("placeid") == 3) || (firstplace == 3 && $(this).attr("placeid") == 1)) {
                            $(".calculator-row").html("<%=Resources.LanguageFile.STDBSHMAPRDRCT %>");
                            window.location.href = "Calculator.aspx?ct=4";
                            return;
                        }

                    <% } %>
                    $.ajax({
                    <% if(STRCity == "0") {%>
                        url: "CalculateHandler.ashx?type=2&db=1&from=null&to=null&fromEmirate=" + firstplace + "&toEmirate=" +  $(this).attr("placeid"),
                    <% } else {%>
                        url: "/CalculateHandler.ashx?type="+ $(".via-select").val() +"&db=1&from=" + firstplace + "&to=" +  $(this).attr("placeid"),
                    <% }%>
                        cache: false,
                        success: function (data) {
                            if(parseInt(data, 10) === 0)
                                alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            else
                            {
                                var lstData= data.split(',');
                                if(lstData.length >2)
                                {

                                    $("#FromCalc").html(lstData[0]);
                                    $("#ToCalc").html(lstData[1]);
                                    $("#ToCost").html(lstData[2]);
                                }
                            }
                            firstplace = "";
                        },
                        error: function (data) {
                            alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            $("#form-state").html("");
                        },
                        complete: function () {
                             $("#clearmapcalculations").click(function(){
                                firstplace = "";
                                $("#ToCalc").html("");
                                $("#ToCost").html("");
                                $("#FromCalc").html("");
         
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
</asp:Content>
