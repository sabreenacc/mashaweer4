<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="OrderMobileCollection.aspx.cs" Inherits="OrderMobileCollection" EnableEventValidation="false" %>

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
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                <%=Resources.LanguageFile.STCollectionLocation %>
            </caption>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctCompanyName" CssClass="txt-box" placeholder="Company Name"
                        runat="server" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctPerson" CssClass="txt-box" placeholder="Sender Name" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctPerson" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" EnableClientScript="true" runat="server" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClctEmail"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtClctEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctMobile" CssClass="txt-box" placeholder="Phone Number" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator11" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtClctMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctAddress" CssClass="txt-box" placeholder="Address" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctAddress" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctLandMark" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctInstructions" TextMode="MultiLine" placeholder="Instructions"
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
