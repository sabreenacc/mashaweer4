<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Service.aspx.cs" Inherits="_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .page-content ul
        {
            line-height: 15px;
            list-style-image: url(/App_Themes/Main/images/bullet.png);
            list-style-position: inside;
        }
        .page-content li
        {
        }
    </style>
    <title>Mashaweer | Our Services</title>
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
                <asp:Literal ID="ltrlServiceTitle" runat="server" Text="<%$ Resources:LanguageFile, Services_Title%>" /></div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>
    <div class="page-content">
        <div class="clear">
        </div>
        <div class="float-far" style="width: 346px;">
            <div class="services-img">
            </div>
            <h2 class="htitle1" style="font-size: 18px; line-height: 22px;">
                <asp:Literal ID="ltrlServiceParagraph" runat="server" Text="<%$ Resources:LanguageFile, SERVICES_PARAGRAPH%>" />
            </h2>
        </div>
        <div class="left-parg" style="margin-bottom:26px;">
            <% var lst = new DBDataContext().Services.Where(s => s.Language == ((Globals.MashaweerLanguage == "en") ? 2 : 1)).ToList();
               foreach (Service ser in lst)
               { %>
            <h3 class="htitle1">
                <%=ser.Name %></h3>
            <br />
            <div style="margin: 0 20px 0 20px;">
                <%=ser.Description %>
            </div>
            <%} %>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var rotate = setInterval(SlideImage, 6000);
        });

        var swap = 1;

        function SlideImage() {
            if (swap == 1) {
                $(".services-img").css("background-position", "right");
                swap = 0;
            }
            else {
                $(".services-img").css("background-position", "left");
                swap = 1;
            }
        }
    </script>
</asp:Content>
