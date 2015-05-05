<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title><%=Resources.LanguageFile.SiteTerms %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   
	<div><%= Request.ServerVariables["HTTP_USER_AGENT"]%></div>
         

</asp:Content>
