<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="FAQ.aspx.cs" Inherits="_FAQ" %>
<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title><%=Resources.LanguageFile.SiteFAQ %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  
           





    
        <div class="page-warp">
            <div class="choose-title">
               <%=Resources.LanguageFile.PageFAQ %>

            </div>
            <div class="faq-area">

                <script>
                    $(document).ready(function () {

                        $('.questions-list li').click(function () {
                            $(this).children('div').slideToggle()
                        });

                    });

                </script>



                   

                <ul class="questions-list">

                            <% var lst = new DBDataContext().FAQs.Where(s => s.Language == ((Globals.MashaweerLanguage == "en") ? 2 : 1)).ToList();
                 
               
            foreach (FAQ fq in lst)
                   { %>
                

                      <li>
                        <a  style="cursor:pointer;" name="answer<%=fq.FAQId %>" ><%=fq.Question %></a>
                        <div class="answer-panel">
                            <p>
                                <%=fq.Answer %>
                            </p>
                        </div>
                    </li>
                <%} %> 
                  
                   
                </ul>
            </div>

            <div class="clear"></div>
        </div>



</asp:Content>
