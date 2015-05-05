<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       <title><%=Resources.LanguageFile.SiteCalculator %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="page-warp">
<div class="choose-title">
    <%=Resources.LanguageFile.PageLocation %>
</div>

<%--<a href="Calculator.aspx?ct=2" class="circle"><%=Resources.LanguageFile.STAbuDhabi %></a>--%>
<a href="Calculator.aspx?ct=2&lang=<%:Globals.MashaweerLanguage%>" class="circle"><%=Resources.LanguageFile.STAbuDhabi %><%-- <br /> <span style="font-size: 0.55em; color: lightgrey; line-height: 2.5em;"><%=Resources.LanguageFile.COMINGSOON %></span>--%></a>
<a href="Calculator.aspx?ct=1&lang=<%:Globals.MashaweerLanguage%>" class="circle bg-white"><%=Resources.LanguageFile.STDubai %></a>
<a href="Calculator.aspx?ct=3&lang=<%:Globals.MashaweerLanguage%>" class="circle bg-yellow"><%=Resources.LanguageFile.STSharjah %></a>
<a href="Calculator.aspx?ct=0&lang=<%:Globals.MashaweerLanguage%>" class="circle bg-gray"><%=Resources.LanguageFile.STAcrossUAE %></a>



  <div class="clear"></div>
</div>
</asp:Content>

