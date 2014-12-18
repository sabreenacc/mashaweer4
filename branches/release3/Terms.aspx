<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title><%=Resources.LanguageFile.SiteTerms %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   
        <div class="page-warp">
            <div class="choose-title">
               <%=Resources.LanguageFile.PageTerms %>

            </div>
            <div class="faq-area" style="font-size:10pt;line-height:18px;">

                              <%=Resources.LanguageFile.TermsContent %>

</div>

         

</asp:Content>
