<%@ page language="C#" masterpagefile="~/Admin/Admin.master" autoeventwireup="true" inherits="Admin_User_Default, App_Web_pwwgoyox" %>

<%@ Register Src="../userControl/ConfirmationMessage.ascx" TagName="ConfirmationMessage"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box1">
        <div class="head">
            <div class="head-l">
            </div>
            <div class="head-r">
            </div>
            <div class="head-m">
                البحث</div>
        </div>
        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="10px">
            <tr>
                <td>
                    الاسم
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <uc1:ConfirmationMessage ID="cmDialog" Command="SysUser.Delete" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" OnClick="btnSearch_Click" />
                </td>
                <td>
                    <asp:Button ID="btnShowAll" runat="server" Text="عرض الكل" OnClick="btnShowAll_Click" />
                </td>
            </tr>
        </table>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 15px 0 0 0">
        <tr>
            <td class="top-right">
            </td>
            <td class="top-mid">
                إدارة المستخدمين
            </td>
            <td class="top-left">
            </td>
        </tr>
        <tr>
            <td class="mid-right">
            </td>
            <td class="mid">
                <table style="width: 100%">
                    <tr>
                        <td colspan="7" class="btns-space">
                            <asp:Button ID="btnAdd" runat="server" PostBackUrl="~/Admin/Users/addEdit.aspx" Text="إضافة" />
                        </td>
                    </tr>
                </table>
                <asp:ListView ID="lvUser" runat="server" DataSourceID="lnqUser">
                    <LayoutTemplate>
                        <table width="100%" cellspacing="0" cellpadding="0" class="grid">
                            <tr>
                                <td colspan="7" class="spacer1">
                                </td>
                            </tr>
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="itemPlaceholderContainer" cellpadding="0" cellspacing="0" width="100%"
                                        runat="server" border="0" style="">
                                        <tr id="Tr2" runat="server" style="">
                                            <th scope="col" width="73%" id="Th1" runat="server">
                                                <asp:LinkButton ID="lnkName" OnClick="Sorting_Click" CommandArgument="UserName" runat="server">الاسم</asp:LinkButton>
                                            </th>
                                            <th scope="col" width="9%">
                                                <asp:LinkButton ID="LinkButton2" OnClick="Sorting_Click" CommandArgument="IsActive"
                                                    runat="server">الفاعلية</asp:LinkButton>
                                            </th>
                                            <th scope="col" width="9%">
                                                تعديل
                                            </th>
                                            <th scope="col" width="9%">
                                                حذف
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" class="spacer1">
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td colspan="7" class="tbl-footer">
                                    <asp:DataPager ID="dpUser" runat="server" PageSize="10">
                                        <Fields>
                                            <asp:TemplatePagerField OnPagerCommand="TemplatePagerField_OnPagerCommand">
                                                <PagerTemplate>
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td class="btxt">
                                                                الصفحة
                                                                <%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>
                                                                من
                                                                <%# (Container.TotalRowCount / Container.PageSize) + 1%>
                                                            </td>
                                                            <td align="center" style="width: 90px;">
                                                                <asp:Button ID="FirstButton" runat="server" CommandName="First" CommandArgument="Previous"
                                                                    BorderWidth="0" BackColor="Transparent" Enabled='<%# Container.StartRowIndex > 0 %>'
                                                                    Text="الصفحة الأولى" />
                                                            </td>
                                                            <td style="width: 25px;">
                                                                <asp:Button ID="PreviousButton" runat="server" CommandName="Previous" CommandArgument="Previous"
                                                                    Enabled='<%# Container.StartRowIndex > 0 %>' CssClass="btn_prev" />
                                                            </td>
                                                            <td align="center" class="pager-numbers">
                                                </PagerTemplate>
                                            </asp:TemplatePagerField>
                                            <asp:NumericPagerField ButtonCount="5" />
                                            <asp:TemplatePagerField OnPagerCommand="TemplatePagerField_OnPagerCommand">
                                                <PagerTemplate>
                                                    </td>
                                                    <td style="width: 25px;">
                                                        <asp:Button Font-Bold="true" ID="NextButton" runat="server" CommandArgument="Next"
                                                            CommandName="Next" Enabled='<%# (Container.StartRowIndex + Container.PageSize) < Container.TotalRowCount %>'
                                                            CssClass="btn_next" />
                                                    </td>
                                                    <td align="center" style="width: 90px;">
                                                        <asp:Button Font-Bold="true" ID="LastButton" runat="server" CommandArgument="Last"
                                                            BackColor="Transparent" BorderWidth="0" Text="الصفحة الأخيرة" CommandName="Last"
                                                            Enabled='<%# (Container.StartRowIndex + Container.PageSize) < Container.TotalRowCount %>' />
                                                    </td>
                                                    </tr> </table>
                                                </PagerTemplate>
                                            </asp:TemplatePagerField>
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="grid">
                            <tr id="Tr2" runat="server" style="">
                                <th scope="col" width="73%" id="Th1" runat="server">
                                    الاسم
                                </th>
                                <th scope="col" width="9%">
                                    الفاعلية
                                </th>
                                <th scope="col" width="9%">
                                    تعديل
                                </th>
                                <th scope="col" width="9%">
                                    حذف
                                </th>
                            </tr>
                            <tr class="row2">
                                <td colspan="4" style="vertical-align: middle; text-align: center; height: 200px">
                                    <%= Helper.GetGeneralMessage ("NoData")  %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="tbl-footer">
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr class='row<%# (Container.DataItemIndex%2)==0 ? "1" : "2" %>' id='LvRow_<%# Eval("UserID") %>'>
                            <td style="text-align: right; padding-right: 10px">
                                <%# Eval("UserName") %>
                            </td>
                            <td>
                            <%# Eval("IsActive").ToString() == "True"? "فعال" : "غير فعال"%>
                            </td>
                            <td>
                                <a href='/Admin/Users/addEdit.aspx?id=<%# Eval("UserID")%>'>
                                    <img src='/App_Themes/Admin/images/edit-icon.png' width='20' height='20' /></a>
                            </td>
                            <td>
                                <a href='#' style="display: <%#(SoftCube.Profile.UserID != int.Parse(Eval("UserID").ToString()))? "block":"none" %>;"
                                    onclick='Delete("<%# Eval("UserID")%>");'>
                                    <img src='/App_Themes/Admin/images/delete-icon.png' width='20' height='20' /></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </td>
            <td class="mid-left">
            </td>
        </tr>
        <tr>
            <td class="bottom-right">
            </td>
            <td class="bottom-mid">
            </td>
            <td class="bottom-left">
            </td>
        </tr>
    </table>
    <asp:LinqDataSource ID="lnqUser" runat="server" ContextTypeName="SoftCube.YellowPageDataContext"
        Select="new (UserID, UserName, IsActive)" TableName="SysUsers" OnSelecting="lnqUser_Selecting">
    </asp:LinqDataSource>
    <script type="text/javascript">
  function Delete(obj) {
        <%=cmDialog.ClientID%>_ShowCom(obj);
        }

    </script>
</asp:Content>
