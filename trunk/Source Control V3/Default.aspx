<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
  
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp">
<div class="services-banner">
<div class="banner-slogan">
    <%=Resources.LanguageFile.STWERUN %>
</div></div>
<div class="right-half">
<div class="calc-block">
    <%=Resources.LanguageFile.STOnlineCalculator %>
    <a href="location.aspx" class="normal-btn"> <%=Resources.LanguageFile.STCalculateYourOrder %></a>
</div>

<img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/thumbup.png" class="thumbsup"/></div>
<div class="left-half">
<div class="call-num">
<h2> <%=Resources.LanguageFile.STCALLUS %></h2>
<span>800 900 900</span>
</div>
<div class="big-front-arrow"></div>
<div class="send-inq">
     <%=Resources.LanguageFile.STRequest %>

<br />
<a href="Order.aspx" style="background-color:#f3b902;" class="normal-btn"><%=Resources.LanguageFile.STClickHere %> </a>
</div>
<div class="delivery-man">
       <%=Resources.LanguageFile.STPlaceOrder %>
 
</div>
</div>
<div class="testmonials">
<h2>
<span style="color:#FFF;">
      <%=Resources.LanguageFile.STWHATOUR%>
      </span> 
<br/>
      <span class="tesm-customers"><%=Resources.LanguageFile.STCUSTOMERS%></span>
      <span class="tesm-aboutus"><%=Resources.LanguageFile.STSAYABOUTUS%></span>
</h2>
 
<div class="testm-bg1">
<div class="testm-bg2">
    
      <%=Resources.LanguageFile.STTestimonials %>
<div class="testm-name">
      <%=Resources.LanguageFile.STCustomerName %>  </div>
</div>

</div>
</div>
<div class="clear"></div>
</div>
</asp:Content>
