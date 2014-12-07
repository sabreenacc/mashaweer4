<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Mashaweer Control panel</title>
    <style>
        #default-table
        {
            width: 400px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
            position: relative;
        }
        #default-table tr
        {
            text-align: center;
        }
        #default-table .text a
        {
            text-align: center;
            line-height: 40px;
            font-size: 14px;
            color: #405687;
            font-weight: bold;
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="default-table">
        <tr>
            <td>
                <a href="Zones/Default.aspx">
                    <img src='/App_Themes/Admin/images/zones.png' width='80' height='80' />
                </a>
            </td>
            <td>
                <a href="Prices/Default.aspx">
                    <img src='/App_Themes/Admin/images/prices.gif' width='80' height='80' />
                </a>
            </td>
            <td>
                <a href="Services/Default.aspx">
                    <img src='/App_Themes/Admin/images/services.jpg' width='80' height='80' />
                </a>
            </td>
        </tr>
        <tr>
            <td class="text">
                <a href="Zones/Default.aspx">المناطق </a>
            </td>
            <td class="text">
                <a href="Prices/Default.aspx">الأسعار </a>
            </td>
            <td class="text">
                <a href="Services/Default.aspx">الخدمات </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="FAQs/Default.aspx">
                    <img src='/App_Themes/Admin/images/faqs.jpg' width='80' height='80' />
                </a>
            </td>
            <td>
                <a href="News/Default.aspx">
                    <img src='/App_Themes/Admin/images/news.png' width='80' height='80' />
                </a>
            </td>
            <td>
                <a href="Users/Default.aspx">
                    <img src='/App_Themes/Admin/images/users.png' width='80' height='80' />
                </a>
            </td>
        </tr>
        <tr>
            <td class="text">
                <a href="FAQs/Default.aspx">الأسئلة الشائعة </a>
            </td>
            <td class="text">
                <a href="News/Default.aspx">الأخبار </a>
            </td>
            <td class="text">
                <a href="Users/Default.aspx">المستخدمين </a>
            </td>
        </tr>
    </table>
</asp:Content>
