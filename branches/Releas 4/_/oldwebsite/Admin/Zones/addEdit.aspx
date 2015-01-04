<%@ page title="" language="C#" masterpagefile="~/Admin/Admin.master" autoeventwireup="true" inherits="Admin_Zones_addEdit, App_Web_frwflpja" %>

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
                إضافة \تعديل منطقة</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                الأسم باللغة العربية
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtArabicName" MaxLength="50" runat="server" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvtxtArabicName" runat="server" ErrorMessage="*" ForeColor="Red"
                                    ControlToValidate="txtArabicName" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                الأسم باللغة الإنجليزية
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtEnglishName" MaxLength="50" runat="server" TabIndex="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvtxtEnglishName" runat="server" ErrorMessage="*" ForeColor="Red"
                                    ControlToValidate="txtEnglishName" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="color: Red; text-align: center;">
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
                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" PostBackUrl="~/Admin/Zones/Default.aspx" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
