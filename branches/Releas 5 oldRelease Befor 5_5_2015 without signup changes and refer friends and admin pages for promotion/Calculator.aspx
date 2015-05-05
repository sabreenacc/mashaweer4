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
                    <td width="22%" id="FromCalc"></td>
                    <td width="4%" class="yellow-label">
                        <%=Resources.LanguageFile.STTo %>
                    </td>
                    <td width="19%" id="ToCalc"></td>
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
                        <% if (STRCity == "0")
                           {%>
                        <%=Resources.LanguageFile.STVAN%>
                        <% }
                           else
                           { %>
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
            <div id="map_canvas" style="height: 350px; direction: ltr;">
            </div>
        </div>
        <div class="under-map-banner">
            <div class="rt-part">
                <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/undermap-banner1.png" />
            </div>
            <div class="lft-part">
                <a href="Order.aspx?lang=<%:Globals.MashaweerLanguage%>">
                    <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/send-order.png" /></a>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript">
         
       
<%
        var mashaweerZones = new List<Zone>();
        if (STRCity == "1")
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(z => z.EmirateId == 1);
        else if (STRCity == "2")
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(z => z.EmirateId == 2);
        else if (STRCity == "3")
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(z => z.EmirateId == 3);
        else if (STRCity == "4")
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.Search<Zone>(z => z.EmirateId == 1 || z.EmirateId == 3);
        else if (STRCity == "0")
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<EEmirate>().Select(emrt => new Zone { ZoneId = emrt.EmirateId, X = emrt.X.Value, Y = emrt.Y.Value, EmirateId = 0, ArabicName = emrt.ArabicName, EnglishName = emrt.EnglishName }).ToList();
        else
            mashaweerZones = Mashaweer.MashaweerDatabaseHandler.GetAll<Zone>();
%>

        var firstplace = "";
        var secondplace = "";
        var map;

        $(function () {

            $(".via-select").change(function () {calculateprice(null)});
            // Start of Calculating Cost

            //var result = Options.SelectedValue;
                
            var mapOptions = {
                mapTypeId: google.maps.MapTypeId.ROADMAP,
<%
        if (STRCity == "0")
        {
%>
                zoom: 8,
                center: new google.maps.LatLng(24.88644, 56.04126)
<% 
        }
        else if (STRCity == "3")
        { 
%>
                zoom: 13,
                center: new google.maps.LatLng(25.35224815054477, 55.42396545410156)
<%
        }
        else if (STRCity == "2")
        {
%>
                zoom: 12,
                center: new google.maps.LatLng(24.468088137204234, 54.4456672668457)
<%
        }
        else
        {
%>
                zoom: 12,
                center: new google.maps.LatLng(25.20105815, 55.320110)
<%
        }
%>
            };

            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  
<%
        foreach (var zone in mashaweerZones)
        {
%>

            var marker<%= zone.ZoneId %> = new google.maps.Marker({
<%
            if (zone.EmirateId == 1)
            {
%>
                icon:'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
                <%
            }
            else if (zone.EmirateId == 2)
            {
%> 
                icon:'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                <%    
            }
            else if (zone.EmirateId == 3)
            {
%> 
                icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                <%   
            }
            else if (zone.EmirateId == 0)
            {
%> 
                icon:'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png',
                <% 
            }
%>        
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP,
                position: new google.maps.LatLng(<%= zone.X %>, <%= zone.Y %>),
                id: "<%= zone.ZoneId %>",
                title: "<%= Globals.MashaweerLanguage == "en" ? zone.EnglishName : zone.ArabicName%>"
            });

            google.maps.event.addListener(marker<%= zone.ZoneId %>, 'click', function () {toggleBounce(marker<%= zone.ZoneId %>)}); 
        <%
        }
%> 
         
            function toggleBounce(targetMarker) {
                
                if (firstplace == "") {
<%
foreach (var zone in mashaweerZones)
{
%>
                    if (marker<%=zone.ZoneId%>.getAnimation() != null)
                        marker<%=zone.ZoneId%>.setAnimation(null);
<%
}
%>
                }
                
                targetMarker.setAnimation(google.maps.Animation.BOUNCE);

                $(".map-bubble").hide();

                calculateprice(targetMarker);

            }
        
            function clearmapcalc(){
                firstplace = "";
                secondplace = "";
                $("#ToCalc").html("");
                $("#ToCost").html("");
                $("#FromCalc").html("");
                
<%
        if (STRCity != "0")
        {
%>
                $(".via-select").val("1");
<%
        }
%>
         
<%
foreach (var zoneClear in mashaweerZones)
{
%>
                if (marker<%=zoneClear.ZoneId%>.getAnimation() != null)
                    marker<%=zoneClear.ZoneId%>.setAnimation(null);
<%
}
%>
            }

            $("#clearmapcalculations").click(function(){
                clearmapcalc();
                $('.via-select').prop('disabled',false);
            });

        
            //$(".placecalc").click(function () {
            //    calculateprice($(this).attr("placeid"));
            //});

            function calculateprice(targetMarker) {
                if (firstplace == "" && targetMarker != null) {
                    firstplace = targetMarker.id; 
                    $("#FromCalc").html( $(this).html());
                }
                else {

                    if(targetMarker != null) {
                        if(secondplace != "") {
                            if (targetMarker.getAnimation() != null)
                                targetMarker.setAnimation(null);
                            alert("<%=Resources.LanguageFile.STCALCCLEAR %>");
                            return;
                        }

                        secondplace = targetMarker.id;
                    }

                    <% if (STRCity == "0")
                       {%>
                    if(firstplace == 1 && secondplace == 1) {
                        $(".calculator-row").html("<%=Resources.LanguageFile.STDBMAPRDRCT %>");
                        window.location.href = "Calculator.aspx?ct=1&lang=<%:Globals.MashaweerLanguage%>";
                        return;
                    } else if(firstplace == 2 &&secondplace == 2) {
                        //$(".calculator-row").html("<%=Resources.LanguageFile.STADMAPRDRCT %>");
                        //window.location.href = "Calculator.aspx?ct=2";
                        alert("<%=Resources.LanguageFile.COMINGSOON%>");
                        clearmapcalc();
                        return;
                    } else if(firstplace == 3 && secondplace == 3) {
                        $(".calculator-row").html("<%=Resources.LanguageFile.STSHMAPRDRCT %>");
                        window.location.href = "Calculator.aspx?ct=3&lang=<%:Globals.MashaweerLanguage%>";
                        return;
                    } else if((firstplace == 1 && secondplace == 3) || (firstplace == 3 && secondplace == 1)) {
                        $(".calculator-row").html("<%=Resources.LanguageFile.STDBSHMAPRDRCT %>");
                        window.location.href = "Calculator.aspx?ct=4&lang=<%:Globals.MashaweerLanguage%>";
                        return;
                    }

                    <% } %>

                    $.ajax({
                        <% if (STRCity == "0")
                           {%>
                        url: "CalculateHandler.ashx?type=2&db=1&from=null&to=null&fromEmirate=" + firstplace + "&toEmirate=" +  secondplace,
                        <% }
                           else
                           {%>
                        url: "/CalculateHandler.ashx?type="+ $(".via-select").val() +"&db=1&from=" + firstplace + "&to=" +  secondplace,
                        <% }%>
                        cache: false,
                        success: function (data) {
                        var lastIndex = data.lastIndexOf(",")
                            var s1 = data.substring(0, lastIndex);
                            var s2 = data.substring(lastIndex + 1);
                              
                            if(parseInt(data, 10) === 0)
                                alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            else
                            {
                                var lstData= data.split(',');
                                if(lstData.length >2)
                                {
                                if(s2=='0')//van only
                                    {
                                        $(".via-select").val("2");
                                        $('.via-select').prop('disabled', 'disabled');
                                        calculateprice(null);
                                    }
                                    else
                                    {
                                    $("#FromCalc").html(lstData[0]);
                                    $("#ToCalc").html(lstData[1]);
                                    $("#ToCost").html(lstData[2]);
                                    }
                                }
                            }
                            //firstplace = "";
                        },
                        error: function (data) {
                            alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            $("#form-state").html("");
                        },
                        complete: function () {
                        }
                    });
                }
            }

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
