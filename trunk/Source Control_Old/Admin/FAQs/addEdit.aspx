<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="addEdit.aspx.cs" Inherits="Admin_FAQs_addEdit" %>



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
                إضافة \تعديل سؤال شائع</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
            <tr>
                <td>
                    
                    <table class="style1">
                        <tr>
                            <td>
                               السؤال
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuestion" MaxLength="150" runat="server" TabIndex="1"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="rvtxtQuestion" runat="server" ErrorMessage="*" ControlToValidate="txtQuestion" ForeColor="Red"
                                    ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                          <tr>
                            <td>
                               الإجابة
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswer" TextMode="MultiLine" runat="server" Width="247px" Height="175px" TabIndex="2"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="rvtxtAnswer" runat="server" ErrorMessage="*" ControlToValidate="txtAnswer" ForeColor="Red"
                                    ValidationGroup="Valid"></asp:RequiredFieldValidator>
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
                                    <asp:ListItem Value="1">العربية </asp:ListItem>
                                    <asp:ListItem Value="2">English </asp:ListItem>
                                </asp:DropDownList> 
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" style="color:Red; text-align:center;">
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
                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" PostBackUrl="~/Admin/FAQs/Default.aspx" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
