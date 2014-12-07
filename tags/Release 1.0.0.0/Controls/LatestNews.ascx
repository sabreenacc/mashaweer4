<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LatestNews.ascx.cs" Inherits="Controls_LatestNews" %>
<%--<% var lastNew = Mashaweer.MashaweerDatabaseHandler.Search<New>(i => i.Language == (Globals.MashaweerLanguage == "ar" ? 1 : 2)).OrderByDescending(i => i.CreatedDate).FirstOrDefault();
   if (lastNew != null)
   {
%>
<a href="news.aspx" class="vall"></a>
<h3 class="news-title">
</h3>
<div class="story-date">
    <%=lastNew.CreatedDate.ToShortDateString() %></div>
<a href="newsdetails.aspx?id=<%=lastNew.NewID%>" class="headline">
    <%=lastNew.Title%></a>
<div class="n-summary">
    <p>
        <%= lastNew.Description.ToSubString(100) %>
    </p>
</div>
<%}
   else
   { %>--%>
<h3 class="news-title">
</h3>
<div class="n-summary">
    <p>
        <%--There is no news--%>
        <asp:Literal ID="ltrlNewsComingSoon" runat="server" Text="<%$ Resources:LanguageFile, NEWS_COMING_SOON%>" />
    </p>
</div>
<%--<%} %>--%>