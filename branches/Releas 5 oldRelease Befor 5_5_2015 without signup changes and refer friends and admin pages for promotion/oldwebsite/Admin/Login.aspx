<%@ page language="C#" autoeventwireup="true" inherits="Admin_Login, App_Web_n2p2v1dr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mashaweer Control panel</title>
    <script src="/Js/jquery-1.3.2.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="/App_Themes/fav.ico" type="image/x-icon" />
    <link href="/App_Themes/Admin/style.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/Admin/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {

            $('iframe').remove();

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="layout">
        <div id="bg_img">
            <div id="bg_img2">
                <div class="wrapper">
                    <div id="header">
                        <div id="toolbar">
                            <div id="date" class="fr">
                                <%=  DateTime.Now.ToString("dddd d MMMM yyyy", System.Globalization.CultureInfo.CreateSpecificCulture("ar-AE"))%>
                            </div>
                        </div>
                        <div id="menubar">
                            <div class="menubar-l">
                            </div>
                            <div class="menubar-r">
                            </div>
                            <div class="menubar-m">
                                <img src="/App_Themes/Admin/images/login-icon.png" width="32" height="32" class="fr"
                                    style="margin-top: 3px" /><div class="login_title fr">
                                        تسجيل الدخول</div>
                            </div>
                        </div>
                    </div>
                    <div id="wrapper">
                        <div class="wrapper-container-t">
                            <div class="wrapper-tl">
                            </div>
                            <div class="wrapper-tr">
                            </div>
                            <div class="wrapper-t">
                            </div>
                        </div>
                        <div class="wrapper-m" style="min-height: 300px">
                            <div class="box2" style="margin: 50px; margin-left: 100px; margin-right: 100px">
                                <div class="head">
                                    <div class="head-l">
                                    </div>
                                    <div class="head-r">
                                    </div>
                                    <div class="head-m">
                                        تسجيل الدخول</div>
                                </div>
                                <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px" style="margin-top: 20px">
                                    <tr>
                                        <td width="31%" align="left" style="text-align: left">
                                            الاسم
                                        </td>
                                        <td width="3%">
                                            :
                                        </td>
                                        <td width="66%" style="text-align: right">
                                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="text-align: left">
                                            كلمة المرور
                                        </td>
                                        <td>
                                            :
                                        </td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td style="text-align: right">
                                            <asp:CheckBox ID="chkRember" Text="تذكرني" runat="server" />
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
                                            <asp:Button ID="btnLogin" runat="server" Text="دخول" Style="margin-left: 36px" OnClick="btnLogin_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="lock-img">
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-container-b">
                            <div class="wrapper-bl">
                            </div>
                            <div class="wrapper-br">
                            </div>
                            <div class="wrapper-b">
                                <a href="http://www.Premitek.com/" target="_blank" title="Premitek">
                                    <div class="logo fl">
                                    </div>
                                    <div class="fl" style="margin-top: 50px; color: #BCB592; font-weight: bolder; opacity: 0.8;">
                                        تم التطوير بواسطة
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
