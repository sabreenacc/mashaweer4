<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="Controls/LatestNews.ascx" TagName="LatestNews" TagPrefix="uc1" %>
<%@ Register Src="Controls/Service.ascx" TagName="Service" TagPrefix="uc2" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <center>
            <object type="application/x-shockwave-flash" data="piecemaker.swf" width="960" height="430"
                id="piecemaker" style="visibility: visible;">
                <param name="play" value="true">
                <param name="menu" value="false">
                <param name="scale" value="showall">
                <param name="wmode" value="transparent">
                <param name="allowfullscreen" value="true">
                <param name="allowscriptaccess" value="always">
                <param name="allownetworking" value="all">
                <param name="flashvars" value="cssSource=piecemaker.css&amp;xmlSource=piecemaker.xml">
                <param name="movie" value="piecemaker.swf" />
                <img src="contents/banner1.jpg" />
            </object>
        </center>
    </div>
    <!--sections start-->
    <ul class="sections">
        <li>
            <uc1:LatestNews ID="LatestNews1" runat="server" />
        </li>
        <li>
            <h3 class="calculator-title">
            </h3>
            <div class="n-summary">
                <p>
                    <asp:Literal ID="ltrlCalculatorHome" runat="server" Text="<%$ Resources:LanguageFile, CALCULATOR_HOMEPAGE %>" />
                </p>
            </div>
            <a href="Calculator.aspx" class="calc-btn"></a></li>
        <li>
            <uc2:Service ID="Service1" runat="server" />
        </li>
    </ul>
</asp:Content>
