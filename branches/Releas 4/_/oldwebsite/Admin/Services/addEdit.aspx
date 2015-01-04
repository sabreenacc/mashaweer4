<%@ page title="" language="C#" masterpagefile="~/Admin/Admin.master" validaterequest="false" autoeventwireup="true" inherits="Admin_Services_addEdit, App_Web_zettbey0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Mashaweer Control panel</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style1 td
        {
            text-align: right;
        }
        .nicEdit-main
        {
            color:Black;
            background-color:White;
        }
    </style>
    <script type="text/javascript" src="/Js/niceditor/nicEdit.js"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(function () { nicEditors.allTextAreas() });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box2">
        <div class="head">
            <div class="head-l">
            </div>
            <div class="head-r">
            </div>
            <div class="head-m">
                إضافة \تعديل خدمة</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                أسم الخدمه
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" MaxLength="100" runat="server" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvtxtName" runat="server" ErrorMessage="*" ControlToValidate="txtName"
                                    ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                التفاصيل
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtDesc" TextMode="MultiLine" runat="server" BackColor="White" Width="447px" Height="175px"
                                    TabIndex="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtDesc" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                اللغة
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlLang" runat="server" TabIndex="3" AppendDataBoundItems="True"
                                    AutoPostBack="False">
                                    <asp:ListItem Value="1">العربيه </asp:ListItem>
                                    <asp:ListItem Value="2">English </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="color: Red; text-align: center;">
                                <asp:Label runat="server" ID="lblError"></asp:Label>
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
                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" PostBackUrl="~/Admin/Services/Default.aspx" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
