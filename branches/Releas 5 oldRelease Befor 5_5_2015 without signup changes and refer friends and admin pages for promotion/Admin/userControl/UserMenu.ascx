<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Admin_userControl_UserMenu" %>
<%@ Register Src="Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<uc1:Menu ID="menuBar1" runat="server">
    <Items>
        <asp:MenuItem NavigateUrl="/admin/Default.aspx" Text="الرئيسيه" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="المناطق" NavigateUrl="/admin/Zones/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="الأسعار" NavigateUrl="/admin/Prices/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="الخدمات" NavigateUrl="/admin/Services/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="الأسئلة الشائعة" NavigateUrl="/admin/FAQs/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="الأخبار" NavigateUrl="/admin/News/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
        <asp:MenuItem Text="المستخدمين" NavigateUrl="/admin/Users/Default.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
           <asp:MenuItem Text="تغيير كلمة السر" NavigateUrl="/admin/resetcred.aspx" SeparatorImageUrl="/App_Themes/Admin/images/menu_sep_black.png">
        </asp:MenuItem>
    </Items>
</uc1:Menu>