<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Mashaweer | Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--sections start-->
    <div class="page-titlebar">
        <div class="title-l">
        </div>
        <div class="title-r">
        </div>
        <div class="title-cntr">
            <div class="title-txt">
                <asp:Literal ID="ltrlContactusTitle" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US%>" /></div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>
    <div class="page-content">
        <div class="contact-par">
            <asp:Literal ID="ltrlCotactUsIntro" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_INTRODUCTION%>" />
        </div>
        <div class="clear">
        </div>
        <div class="contact-img">
        </div>
        <table class="contact-table" width="500" border="0" style="margin-top: 20px; margin-bottom: 96px;">
            <%--<tr>
                <td height="30" colspan="3">
                    <asp:Literal ID="ltrlCotactUsTelephone" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_PHONE%>" />
                </td>
            </tr>--%>
            <tr>
                <td height="30" colspan="3">
                    <asp:Literal ID="ltrlCotactUsFax" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_FAX%>" />
                </td>
            </tr>
            <tr>
                <td height="30" colspan="3">
                    <asp:Literal ID="ltrlCotactUsTollFree" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_TOLLFREE%>" />
                </td>
            </tr>
            <tr>
                <td height="87" colspan="3" style="color: #8D690B; height: 20px; padding-top: 6px;
                    padding-left: 5px; font-weight: bold;">
                    <asp:Literal ID="ltrlCotactUsFillContact" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_FILL_CONTACT_FORM%>" />
                </td>
            </tr>
            <tr>
                <td width="86">
                    <asp:Literal ID="ltrlCotactUsName" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_NAME%>" />
                </td>
                <td width="6">
                    :
                </td>
                <td width="394">
                    <asp:TextBox ID="txtCotactUsName" Style="width: 50%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCotactUsName" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlCotactUsEmail" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_EMAIL%>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtCotactUsEmail" Style="width: 50%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtCotactUsEmail" Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtCotactUsEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <tr>
                    <td>
                        <asp:Literal ID="ltrlCotactUsMessage" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_MESSAGE %>" />
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                    <asp:TextBox ID="txtCotactUsMessage" Style="width: 50%" runat="server" TextMode="MultiLine" Rows="15" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCotactUsMessage" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="snd-btn"
                        Style="margin-top: 5px;" Text="<%$ Resources:LanguageFile, CONTACT_US_SEND%>"
                        ValidationGroup="Valid" />
                    <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_CLEAR%>"
                        CssClass="snd-btn" Style="margin-top: 5px;" PostBackUrl="ContactUs.aspx" />
                    </td>
                </tr>
        </table>
    </div>
    <script type="text/javascript">
        $(function () {
            var rotate = setInterval(SlideImage, 6000);
        });

        var swap = 1;

        function SlideImage() {
            if (swap == 1) {
                $(".contact-img").css("background-position", "right");
                swap = 0;
            }
            else {
                $(".contact-img").css("background-position", "left");
                swap = 1;
            }
        }
    </script>
</asp:Content>
