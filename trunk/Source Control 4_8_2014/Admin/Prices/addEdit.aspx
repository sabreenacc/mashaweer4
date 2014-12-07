<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="addEdit.aspx.cs" Inherits="Admin_Price_addEdit" %>

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
                إضافة \تعديل سعر مابين منطقتين</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
            <tr>
                <td>
                    <asp:LinqDataSource ID="lnqZones" runat="server" ContextTypeName="DBDataContext"
                        OrderBy="ArabicName" Select="new (ArabicName, ZoneId)" TableName="Zones">
                    </asp:LinqDataSource>
                    <table class="style1">
                        <tr>
                            <td>
                                من منطقة
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFromZone" runat="server" TabIndex="1" AppendDataBoundItems="True" DataSourceID="lnqZones"
                                    DataTextField="ArabicName" DataValueField="ZoneId" AutoPostBack="False">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rvFromZone" runat="server" ErrorMessage="*" ControlToValidate="ddlFromZone" ForeColor="Red"
                                    ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                إلى منطقة
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlToZone" runat="server" TabIndex="2" AppendDataBoundItems="True" DataSourceID="lnqZones"
                                    DataTextField="ArabicName" DataValueField="ZoneId" AutoPostBack="False">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rvToZone" runat="server" ErrorMessage="*" ForeColor="Red"
                                    ControlToValidate="ddlToZone" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                سعر السيارة
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtCarPrice" MaxLength="150" runat="server" TabIndex="3"></asp:TextBox>
                                <asp:CompareValidator ID="cprvCarPrice" runat="server"  Type="Double" ErrorMessage="من فضلك إدخل أرقام فقط"
                                    ControlToValidate="txtCarPrice" ForeColor="Red" ValidationGroup="Valid"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                سعر الموتوسيكل
                            </td>
                            <td>
                                :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMotorCyclePrice" MaxLength="150" runat="server" TabIndex="3"></asp:TextBox>
                                <asp:CompareValidator ID="cprvMotorCyclePrice" runat="server"  Type="Double" ErrorMessage="من فضلك إدخل أرقام فقط"
                                    ControlToValidate="txtMotorCyclePrice" ValidationGroup="Valid"></asp:CompareValidator>
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
                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" PostBackUrl="~/Admin/Prices/Default.aspx" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
