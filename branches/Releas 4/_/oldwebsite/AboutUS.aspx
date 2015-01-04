<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="AboutUS, App_Web_e5xlbhse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Mashaweer UAE | About US & Mision & Vision</title>
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
                <asp:Literal ID="ltrlAboutUSTitle" runat="server" Text="<%$ Resources:LanguageFile, ABOUTMASHAWEER%>" />
            </div>
        </div>
    </div>
    <div class="page-content">
        <div class="clear">
        </div>
        <div class="services-img">
        </div>
        <div class="left-parg" style="font-size:15px;">
            <asp:Literal ID="ltrlAboutUsContent" runat="server" Text="<%$ Resources:LanguageFile, ABOUTUS_CONTENT%>" />
        </div>
    </div>
</asp:Content>
