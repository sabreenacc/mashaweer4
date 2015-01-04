<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="OrderMobileDelivery.aspx.cs" Inherits="OrderMobileDelivery" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteOrder %></title>
    <!--
<% if (DeviceRecognizer.RecongnizeDevice(Request) == "mobile")
   {  
%> 
    <link href="/App_Themes/Main<%= Globals.MashaweerLanguage %>/forcemobile.css" rel="stylesheet" type="text/css" />
<%
   }
%>
        -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <h1 class="form-title">
            <%=Resources.LanguageFile.PageOrderMobile %>
        </h1>
        <!-- Destenation place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                <%=Resources.LanguageFile.STDeliveryLocation %>
            </caption>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryCompanyName" CssClass="txt-box" placeholder="Company Name"
                        runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryPerson" CssClass="txt-box" placeholder="Contact Person"
                        runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" EnableClientScript="true"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtDlvryEmail"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtDlvryEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryMobile" CssClass="txt-box" placeholder="Phone Number " runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator12" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtDlvryMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryAddress" CssClass="txt-box" placeholder="Address " runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryLandMark" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryInstructions" TextMode="MultiLine" placeholder="Instructions"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
        </table>
        <!-- Button place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="normal-btn" ValidationGroup="Valid" />
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript" language="javascript">

        function validate(control) {
            if (isControlValid(control) == true) {
                $(control).css("box-shadow", "none");
                $(control).css("background-color", "#ffffff");
            } else {
                $(control).css("box-shadow", "red 0px 0px 2px 1px");
                $(control).css("background-color", "#fffafa");
            }
        }

        function isControlValid(control) {
            var validators = control.Validators;
            var isValid = true;
            for (keyValidator in validators) {
                isValid = isValid && (validators[keyValidator].isvalid === true);
            }
            //validators.forEach(function (item) {
            //    isValid = isValid && (item.isvalid === true);
            //});
            return isValid;
        }

        $("#<%= Form.ClientID %>").submit(function (e) {
            
            var val = Page_ClientValidate();
            var invalidValues = "<%=Resources.LanguageFile.STORDERFILLMISSINGMSG %>";
            if (val === false) {
                var i = 0;
                var j = 0;
                for (; i < Page_Validators.length; i++) {
                    if (!Page_Validators[i].isvalid) {
                        $("#" + Page_Validators[i].controltovalidate).css("box-shadow", "red 0px 0px 2px 1px");
                        $("#" + Page_Validators[i].controltovalidate).css("background-color", "#fffafa");
                        invalidValues += "\n" + $("#" + Page_Validators[i].controltovalidate).prop("placeholder");
                        j++;
                    }
                }
                if (j > 2)
                    invalidValues = "<%=Resources.LanguageFile.STORDERFILLMISSINGMSG %>";

                alert(invalidValues);
            }
            return val;
        });

    </script>
</asp:Content>
