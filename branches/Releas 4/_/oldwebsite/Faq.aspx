<%@ page title="Home Page" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="_FAQ, App_Web_e5xlbhse" %>
<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Mashaweer UAE | Frequently Asked Questions</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-titlebar">
        <div class="title-l">
        </div>
        <div class="title-r">
        </div>
        <div class="title-cntr">
            <div class="title-txt">
                <asp:Literal ID="ltrlFAQTitle" runat="server" Text="<%$ Resources:LanguageFile, FAQ%>" /></div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>
    <div class="page-content">
        <div class="clear">
        </div>
        <div class="faq-area">
            <ul class="faq-list">
                <% var lst = new DBDataContext().FAQs.Where(s => s.Language == ((Globals.MashaweerLanguage == "en") ? 2 : 1)).ToList();
                   foreach (FAQ fq in lst)
                   { %>
                <li><a href="#answer<%=fq.FAQId %>">
                    <%=fq.Question %>?
                </a></li>
                <%} %>
            </ul>
            <ul class="answers">
                <% foreach (FAQ fq in lst)
                   { %>
                <li><a name="answer<%=fq.FAQId %>"></a>
                    <h3 class="htitle1">
                        <%=fq.Question %>?
                    </h3>
                    <%=fq.Answer %>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
</asp:Content>
