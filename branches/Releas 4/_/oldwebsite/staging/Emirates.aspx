﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Emirates.aspx.cs" Inherits="Emirate" %>

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
    var mashaweeremirates = Mashaweer.MashaweerDatabaseHandler.GetAll<EEmirate>();
%>
        $(function () {

// Start of Calculating Cost
debugger;
            var firstplace = "";
            var map;
<%
    foreach(var emirate in mashaweeremirates)
    {
%>

            var marker<%= emirate.EmirateId %>;

            function toggleBounce<%= emirate.EmirateId %>() {


                if (firstplace == "") {
<%
    foreach(var emirate1 in mashaweeremirates)
    {

        if (emirate1 != emirate)
        {
%>

                    if (marker<%=emirate.EmirateId%>.getAnimation() != null)
                        marker<%=emirate.EmirateId%>.setAnimation(null);
<%
        }
    }
%>
                    firstplace = marker<%= emirate.EmirateId %>.id;          
                    $(".calculator").html("<asp:Literal ID="ltrlFrom" runat="server" Text="<%$ Resources:LanguageFile, FROM%>" /><span class='grayspan'> " + marker<%= emirate.EmirateId %>.title + "</span> <asp:Literal ID="ltrlbyMtrCle1" runat="server" Text="<%$ Resources:LanguageFile, BYCAR%>" /> <input type='button' id='clearmapcalculations' class='snd-btn' value='<asp:Literal ID="ltrlReset" runat="server" Text="<%$ Resources:LanguageFile, RESET%>" />' /></div>");
                    $("#clearmapcalculations").click(function(){
                             clearmapcalc();
                    });
                }
                else {
                    $.ajax({
                        url: "CalculateHandler2.ashx?type=1&db=1&from=" + firstplace + "&to=" + marker<%= emirate.EmirateId %>.id,
                        cache: false,
                        success: function (data) {
                        if(firstplace == 1 && marker<%= emirate.EmirateId %>.id == 3 || firstplace == 1 && marker<%= emirate.EmirateId %>.id == 4 || firstplace == 3 && marker<%= emirate.EmirateId %>.id == 1 || firstplace == 3 && marker<%= emirate.EmirateId %>.id == 4 || firstplace == 4 && marker<%= emirate.EmirateId %>.id == 1 || firstplace == 4 && marker<%= emirate.EmirateId %>.id == 3)  
                        {
                        //alert('You will be prombted to a page which consists of the regions of those 2 emirates, Please specify exactly which 2 regions do you want');
                        window.location.href = 'EmirateRegion.aspx';
                        }
                        else if(parseInt(data, 10) === 0)
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
                if (marker<%= emirate.EmirateId %>.getAnimation() == null) {
                    marker<%= emirate.EmirateId %>.setAnimation(google.maps.Animation.BOUNCE);
                }
            }

<%
    }
%>
            function clearmapcalc(){
                firstplace = "";
                $(".calculator").html("");

<%
    foreach(var emirateClear in mashaweeremirates)
    {

%>
                if (marker<%=emirateClear.EmirateId%>.getAnimation() != null)
                    marker<%=emirateClear.EmirateId%>.setAnimation(null);
<%
    }
%>
            }


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
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions2);
               


<%
    foreach(var emirate in mashaweeremirates)
    {
%>
                if (<%=emirate.EmirateId%> == "2")
                {
                marker<%= emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                        title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"
                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }
                else if(<%=emirate.EmirateId%> == "3")
                {                
                marker<%=emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }
                else if(<%=emirate.EmirateId%> == "4")
                {                marker<%= emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }
                 else if(<%=emirate.EmirateId%> == "5")
                {                marker<%= emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/orange-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }

                                 else if(<%=emirate.EmirateId%> == "6")
                {                marker<%= emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/purple-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }

                                 else if(<%=emirate.EmirateId%> == "7")
                {                marker<%= emirate.EmirateId %> = new google.maps.Marker({
                icon:'http://maps.google.com/mapfiles/ms/icons/pink-dot.png',
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }

                else
                {
                 marker<%= emirate.EmirateId %> = new google.maps.Marker({
                    map: map,
                    draggable: false,
                    animation: google.maps.Animation.DROP,
                    position: new google.maps.LatLng(<%= emirate.X %>, <%= emirate.Y %>),
                    id: "<%= emirate.EmirateId %>",
                                                         title: "<%= Globals.MashaweerLanguage == "en"
                                                            ? emirate.EnglishName
                                                            : emirate.ArabicName%>"

                });
                google.maps.event.addListener(marker<%= emirate.EmirateId %>, 'click', toggleBounce<%= emirate.EmirateId %>);
                }
<%
    }
%>
            }
            initialize();
        });
</script>
    <script type="text/javascript">
      
            $(".placecalc").click(function () {
                if (firstplace == "") {
                    firstplace = $(this).attr("placeid");
                    $(".calculator").html("<asp:Literal ID="ltrlFrom1" runat="server" Text="<%$ Resources:LanguageFile, FROM%>" /><span class='grayspan'> " + $(this).html() + "</span> <asp:Literal ID="ltrlbyMtrCle" runat="server" Text="<%$ Resources:LanguageFile, BYCAR%>" /> <input type='button' id='clearmapcalculations' class='snd-btn' value='<asp:Literal ID="ltrlReset1" runat="server" Text="<%$ Resources:LanguageFile, RESET%>" />' />");
                    $("#clearmapcalculations").click(function(){
                         firstplace = "";
                        $(".calculator").html("");
                    });               
                }
                else {
                    $.ajax({
                        url: "/CalculateHandler2.ashx?type=1&db=1&from=" + firstplace + "&to=" +  $(this).attr("placeid"),
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
