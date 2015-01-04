
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Calculator4.aspx.cs" Inherits="Calculator4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=ar&dir=rtl"></script>
    <%--<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&language=ar&dir=rtl" type="text/javascript"></script>--%>
    <title>Mashaweer | Calculator</title>
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
                        url: "CalculateHandler.ashx?type=1&db=1&from=" + firstplace + "&to=" + marker<%= zone.ZoneId %>.id,
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


            //var result = Options.SelectedValue;
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
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions2);
               


<%
    foreach(var zone in mashaweerZones)
    {
%>
                if (<%=zone.EmirateId%> == "2")
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
                else if(<%=zone.EmirateId%> == "4")
                {                marker<%= zone.ZoneId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
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
   
</asp:Content>

