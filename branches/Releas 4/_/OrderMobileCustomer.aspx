<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="OrderMobileCustomer.aspx.cs" Inherits="OrderMobileCustomer" EnableEventValidation="false" %>

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
        <table class="form-block1" width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td colspan="2">
                    <h3>
                        <%=Resources.LanguageFile.STCustomerDetails %>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCustCmpnyName" runat="server" CssClass="txt-box" placeholder="Customer / Company Name"
                        TabIndex="1"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtCustEmail" runat="server" CssClass="txt-box" placeholder="Email"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="regexEmailValid" runat="server" EnableClientScript="true"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                        ControlToValidate="txtCustEmail" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" EnableClientScript="true"
                        ErrorMessage="*" ControlToValidate="txtCustEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCustPerson" CssClass="txt-box" placeholder="Contact Person" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtCustPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtCustMobile" CssClass="txt-box" placeholder="Mobile Number" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtCustMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCustMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
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
