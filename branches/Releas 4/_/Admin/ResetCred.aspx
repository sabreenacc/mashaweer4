<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="ResetCred.aspx.cs" Inherits="Admin_ResetCred" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Mashaweer Control panel</title>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="wrapper-m" style="min-height: 300px">
                            <div class="box2" style="margin: 50px; margin-left: 100px; margin-right: 100px">
                                <div class="head">
                                    <div class="head-l">
                                    </div>
                                    <div class="head-r">
                                    </div>
                                    <div class="head-m">
                                        تغيير كلمة السر</div>
                                </div>
    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px" style="margin-top: 20px">
                                    <tr>
                                        <td width="31%" align="left" style="text-align: left">
                                            الاسم الجديد
                                        </td>
                                        <td width="3%">
                                            :
                                        </td>
                                        <td width="66%" style="text-align: right">
                                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="text-align: left">
                                            كلمة المرور القديمة
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    

                                 
                                    <tr>
                                        <td align="left" style="text-align: left">
                                            كلمة المرور الجديدة
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword2" ForeColor="Red"
                                    ErrorMessage="<%$ Resources:ValidationMessage, Required %>" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td align="left" style="text-align: left">
                                           تاكيد كلمة المرور الجديدة
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                                             <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword2" ForeColor="Red"
                                    ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:ValidationMessage, ComparePassword %>"
                                    ValidationGroup="Valid"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">
                                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td style="padding-top: 25px; padding-bottom: 40px">
                                            <asp:Button ID="btnLogin" runat="server" Text="تغيير" Style="margin-left: 36px" ValidationGroup="Valid" OnClick="btnLogin_Click" />
                                        </td>
                                    </tr>
                                </table>
                                 <div class="lock-img">
                                </div>
                            </div>
                        </div>
</asp:Content>
