<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteContact %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="contact-header">
            <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/contact-top-banner.png"
                class="contact-img" usemap="#contactmap" />
            <map name="contactmap">
                <% if (Globals.MashaweerLanguage == "en")
                   { %>
                <area shape="rect" coords="0,175,240,464" alt="Email Mashaweer" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="317,175,554,464" alt="Call Mashaweer" href="tel:800900900" />
                <area shape="rect" coords="632,175,868,464" alt="Contact Mashaweer" href="#contact-form" />
                <% }
                   else
                   {%>
                <area shape="rect" coords="632,175,868,464" alt="إرسل بريد لمشاوير" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="315,175,552,464" alt="إتصل بمشاوير" href="tel:800900900" />
                <area shape="rect" coords="0,175,237,480" alt="إتصل بمشاوير" href="#contact-form" />
                <% } %>
            </map>
            <img src="/App_Themes/Main<%= Globals.MashaweerLanguage %>/images/contact-top-banner2.png"
                class="contact-img2" usemap="#contactmap2" />
            <map name="contactmap2">
                <% if (Globals.MashaweerLanguage == "en")
                   { %>
                <area shape="rect" coords="0,0,600,140" alt="Email Mashaweer" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="0,140,600,260" alt="Call Mashaweer" href="tel:800900900" />
                <area shape="rect" coords="0,260,600,400" alt="Contact Mashaweer" href="#contact-form" />
                <% }
                   else
                   {%>
                <area shape="rect" coords="0,0,600,130" alt="إرسل بريد لمشاوير" href="mailto:info@mashaweeruae.com" />
                <area shape="rect" coords="0,130,600,260" alt="إتصل بمشاوير" href="tel:800900900" />
                <area shape="rect" coords="0,260,600,400" alt="إتصل بمشاوير" href="#contact-form" />
                <% } %>
            </map>
        </div>
        <div class="contact-form" id="contact-form">
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                        <asp:TextBox ID="txtCotactUsName" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="<%$ Resources:LanguageFile, ContactName%>"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ControlToValidate="txtCotactUsName" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtCotactUsEmail" CssClass="txt-box" placeholder="<%$ Resources:LanguageFile, ContactEmail%>"
                            runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCotactUsEmail"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="txtCotactUsEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtCotactUsMessage" CssClass="txt-area" placeholder="<%$ Resources:LanguageFile, ContactMessage%>"
                            runat="server" TextMode="MultiLine" Rows="15" TabIndex="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="txtCotactUsMessage" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="custom" CustomThemeWidget="recaptcha_widget" PublicKey="6LeOv_ESAAAAALnh0MDIUCLeUuF8mgJ-yOAFdQfC"
                            PrivateKey="6LeOv_ESAAAAAFROKCQ_Rc9DIZQWFmY4rSvgI4ky" />
                        
                    <div id="recaptcha_widget" style="display: none">

                        <div id="recaptcha_image" style="float: <%=(Globals.MashaweerLanguage == "en") ? "left" : "right"%>;"></div>
                        <style>
                            #recaptcha_image img {
                                width: 100% !important;
                            }

                            #recaptcha_image {
                                width: 80% !important;
                            }
							
                        </style>
                        <div style="float: <%=(Globals.MashaweerLanguage == "en") ? "left" : "right"%>; margin-<%=(Globals.MashaweerLanguage == "en") ? "left": "right"%>: 10px;">
                            <a id="recaptcha_reload_btn" href="javascript:Recaptcha.reload()" title="<%=Resources.LanguageFile.RECAPATCHA_REFRESH %>">
                                <img id="recaptcha_reload" src="http://www.google.com/recaptcha/api/img/clean/refresh.png" alt="<%=Resources.LanguageFile.RECAPATCHA_REFRESH %>">
                            </a>
                            <div class="recaptcha_only_if_image">
                                <a id="recaptcha_switch_audio_btn" href="javascript:none" class="recaptcha_only_if_image" title="<%=Resources.LanguageFile.RECAPATCHA_GET_AUDIO %>">
                                    <img id="recaptcha_switch_audio" alt="<%=Resources.LanguageFile.RECAPATCHA_GET_AUDIO %>" src="http://www.google.com/recaptcha/api/img/clean/audio.png">
                                </a>
                            </div>
                            <div class="recaptcha_only_if_audio">
                                <a id="recaptcha_switch_img_btn" href="javascript:none" class="recaptcha_only_if_audio" title="<%=Resources.LanguageFile.RECAPATCHA_GET_IMAGE %>">
                                    <img id="recaptcha_switch_img" alt="<%=Resources.LanguageFile.RECAPATCHA_GET_IMAGE %>" src="http://www.google.com/recaptcha/api/img/clean/text.png">
                                </a>
                            </div>
                            <div>
                                <a id="recaptcha_whatsthis_btn" href="javascript:Recaptcha.showhelp()" title="<%=Resources.LanguageFile.RECAPATCHA_HELP %>">
                                    <img id="recaptcha_whatsthis" src="http://www.google.com/recaptcha/api/img/clean/help.png" alt="<%=Resources.LanguageFile.RECAPATCHA_HELP %>">
                                </a>
                            </div>
                        </div>
                        <div style="float: <%=(Globals.MashaweerLanguage == "en") ? "left" : "right"%>; margin-top:10px;">
                            <div class="recaptcha_only_if_incorrect_sol" style="color: red"><%=Resources.LanguageFile.RECAPATCHA_INCORRECT_TRY_AGAIN %></div>
                            <span class="recaptcha_only_if_image"><%=Resources.LanguageFile.RECAPATCHA_IMAGE_WRITE %></span>
                            <span class="recaptcha_only_if_audio"><%=Resources.LanguageFile.RECAPATCHA_AUDIO_WRITE %></span>
                            <input type="text" id="recaptcha_response_field" name="recaptcha_response_field" style="margin-top:10px" class="txt-box"/>
                        </div>
                        <script type="text/javascript"
                            src="http://www.google.com/recaptcha/api/challenge?k=6LeOv_ESAAAAALnh0MDIUCLeUuF8mgJ-yOAFdQfC">
                        </script>
                        <noscript>
                            <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LeOv_ESAAAAALnh0MDIUCLeUuF8mgJ-yOAFdQfC"
                                height="300" width="500" frameborder="0"></iframe>
                            <br>
                            <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
                            <input type="hidden" name="recaptcha_response_field"
                                value="manual_challenge">
                        </noscript>
                        <script>
                            $(function () {

                                $("#recaptcha_switch_audio_btn").click(function () {

                                    $.when(Recaptcha.switch_type('audio')).then(window.setTimeout(afterAddingAudioCapatcha, 400));
                                    //Recaptcha.switch_type('audio');
                                    //$('#recaptcha_audio_play_again').text("<%=Resources.LanguageFile.RECAPATCHA_PLAY_AGAIN %>");
                                    //$('#recaptcha_audio_download').text("<%=Resources.LanguageFile.RECAPATCHA_CANT_HERE_THIS %>");
                                });

                                function afterAddingAudioCapatcha() {
                                    $('#recaptcha_audio_play_again').text("<%=Resources.LanguageFile.RECAPATCHA_PLAY_AGAIN %>");
                                    $('#recaptcha_audio_download').text("<%=Resources.LanguageFile.RECAPATCHA_CANT_HERE_THIS %>");
                                }

                                $("#recaptcha_audio_play_again, #recaptcha_audio_download").click(function () {
                                    $('#recaptcha_audio_play_again').text("<%=Resources.LanguageFile.RECAPATCHA_PLAY_AGAIN %>");
                                    $('#recaptcha_audio_download').text("<%=Resources.LanguageFile.RECAPATCHA_CANT_HERE_THIS %>");
                                });

                                $("#recaptcha_switch_img_btn").click(function () {
                                    Recaptcha.switch_type('image');
                                });

                            });
                        </script>
                    </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSave" CssClass="normal-btn" runat="server" OnClick="btnSave_Click"
                            Text="<%$ Resources:LanguageFile, CONTACT_US_SEND%>" ValidationGroup="Valid" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="contact-arrow">
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
