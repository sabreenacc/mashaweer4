<%@ page language="C#" masterpagefile="~/Admin/Admin.master" autoeventwireup="true" inherits="Admin_User_addEdit, App_Web_pwwgoyox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style1 td
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box2">
        <div class="head">
            <div class="head-l">
            </div>
            <div class="head-r">
            </div>
            <div class="head-m">
                إضافة / تعديل مستخدم</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                الاسم
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" MaxLength="50"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                اسم الدخول
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName"  MaxLength="100" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                كلمة المرور
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword"  MaxLength="20" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تأكيد كلمة المرور
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ForeColor="Red"
                                    ControlToValidate="txtConfirmPassword" ErrorMessage="<%$ Resources:ValidationMessage, ComparePassword %>"
                                    ValidationGroup="Valid"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                فعال
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" Checked="True" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 25px; padding-bottom: 40px">
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" ValidationGroup="Valid" />
                    <asp:Button ID="btnSaveExit" runat="server" OnClick="btnSaveExit_Click" Text="حفظ وخروج"
                        ValidationGroup="Valid" />
                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" PostBackUrl="~/Admin/User/Default.aspx" />
                </td>
            </tr>
        </table>
    </div>
    <% if (UserID != 0)
       {
    %>
    <script type="text/javascript">
        $(function () {
            ValidatorEnable(document.getElementById("<%=RequiredFieldValidator2.ClientID%>"), false);
        });
    </script>
    <%  }%>
</asp:Content>
