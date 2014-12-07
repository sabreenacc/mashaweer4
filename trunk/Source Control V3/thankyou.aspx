<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="thankyou.aspx.cs" Inherits="thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.ThankYou %></title>
    <script type="text/javascript">
        $(window).load(function () {
            setTimeout('delayer()', 4000);
        });

        function delayer() {
            window.location = "default.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="container">
            <div class="content">
                <h3 style="padding-left: 20px; font-family: 'helvetica-regular', sans-serif; font-weight: bold;
                    font-size: x-large;">
                    <%= (Request.QueryString["order"] != null) ? Resources.LanguageFile.THANKYOUORDERMESSAGE : Resources.LanguageFile.THANKYOUCONTACTUSMESSAGE %>
                    <br>
                    <br>
                    <h5 style="padding-left: 20px; font-family: 'helvetica-regular', sans-serif; font-size: large;">
                        *<%=Resources.LanguageFile.REDIRECTMSG %>*</h5>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
