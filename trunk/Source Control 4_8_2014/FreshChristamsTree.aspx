<%@ Page Title="" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="FreshChristamsTree.aspx.cs" Inherits="LandingMashaweer" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteContact %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <%--Noble Fir Fresh Xmas Tree 6 to 7 FT long--%>
        <%--<img src="App_Themes/Main<%= Globals.MashaweerLanguage %>/images/banner_top5.png" class="contact-img" style="width: 37%;margin-top: -2%;margin-right: 33%;margin-left: 33%;"  />--%>
        <div class="contact-header">
            <img src="/App_Themes/MainEn/images/Mashaweer-FB-Banner-87.png"
                class="contact-img" usemap="#contactmap"  />
            <map name="contactmap">
                <% if (Globals.MashaweerLanguage == "en")
                   { %>
                <area shape="rect" coords="0,175,240,464" alt="Email Mashaweer" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="317,175,554,464" alt="Call Mashaweer" href="tel:800900900" />
                <area shape="rect" coords="632,175,868,464" alt="Contact Mashaweer" href="#contact-form" />
                <% }
                   else
                   {%>
                <area shape="rect" coords="632,175,868,464" alt="إرسل بريد لمشاوير" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="315,175,552,464" alt="إتصل بمشاوير" href="tel:800900900" />
                <area shape="rect" coords="0,175,237,480" alt="إتصل بمشاوير" href="#contact-form" />
                <% } %>
            </map>
            <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/contact-top-banner2.png"
                class="contact-img2" usemap="#contactmap2" />
            <map name="contactmap2">
                <% if (Globals.MashaweerLanguage == "en")
                   { %>
                <area shape="rect" coords="0,0,600,140" alt="Email Mashaweer" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="0,140,600,260" alt="Call Mashaweer" href="tel:800900900" />
                <area shape="rect" coords="0,260,600,400" alt="Contact Mashaweer" href="#contact-form" />
                <% }
                   else
                   {%>
                <area shape="rect" coords="0,0,600,130" alt="إرسل بريد لمشاوير" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="0,130,600,260" alt="إتصل بمشاوير" href="tel:800900900" />
                <area shape="rect" coords="0,260,600,400" alt="إتصل بمشاوير" href="#contact-form" />
                <% } %>
            </map>
        </div>
        <div class="contact-form" id="contact-form">
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                        <asp:TextBox ID="txtCotactUsName" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="<%$ Resources:LanguageFile, ContactName%>"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ControlToValidate="txtCotactUsName" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="txtMOBILENUMBER" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="<%$ Resources:LanguageFile, MOBILENUMBER%>"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                            ValidationExpression="(\+?[0-9]\-?){7,20}" ControlToValidate="txtMOBILENUMBER"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="txtMOBILENUMBER" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        <asp:TextBox ID="txtCotactUsEmail" CssClass="txt-box" placeholder="<%$ Resources:LanguageFile, ContactEmail%>"
                            runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCotactUsEmail"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="txtCotactUsEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               <tr>
                    <td>
                        <asp:TextBox ID="txtDDELIVERYADDRESSLOCATION" CssClass="txt-box" placeholder="<%$ Resources:LanguageFile, DDELIVERYADDRESSLOCATION%>"
                            runat="server" TabIndex="1"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="txtDDELIVERYADDRESSLOCATION" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
              

                <tr>
                    <td>
                        
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
      $(function () {
          $("[id$=txtDELIVERYDATE]").datepicker();
      });
  </script>
                        <asp:TextBox ID="txtDELIVERYDATE" CssClass="txt-box" placeholder="<%$ Resources:LanguageFile, DELIVERYDATE%>"
                            runat="server" TabIndex="1"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="txtDELIVERYDATE" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td>
                        <asp:Button ID="btnSave" CssClass="normal-btn" runat="server" OnClick="btnSave_Click"
                            Text="<%$ Resources:LanguageFile, CONTACT_US_SEND%>" ValidationGroup="Valid" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="contact-arrow">
        </div>
        <div class="clear">
        </div>

        

       <%-- <p>Date: <input type="text" id="datepicker"></p>--%>
    </div>
</asp:Content>
