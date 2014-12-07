<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteContact %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="contact-header">
            <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/contact-top-banner.png"
                class="contact-img" usemap="#contactmap" />
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
                class="contact-img2" />
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
                        <asp:TextBox ID="txtCotactUsMessage" CssClass="txt-area" placeholder="<%$ Resources:LanguageFile, ContactMessage%>"
                            runat="server" TextMode="MultiLine" Rows="15" TabIndex="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="txtCotactUsMessage" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="clean" PublicKey="6LeOv_ESAAAAALnh0MDIUCLeUuF8mgJ-yOAFdQfC"
                            PrivateKey="6LeOv_ESAAAAAFROKCQ_Rc9DIZQWFmY4rSvgI4ky" />
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
    </div>
</asp:Content>
