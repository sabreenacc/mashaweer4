<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="OrderMobileCheckout.aspx.cs" Inherits="OrderMobileCheckout" EnableEventValidation="false" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteOrder %></title>
    <!--
<% if (DeviceRecognizer.RecongnizeDevice(Request) == "mobile")
   {  
%> 
    <link href="/App_Themes/Main<%= Globals.MashaweerLanguage %>/forcemobile.css" rel="stylesheet" type="text/css" />
<%
   }
%>
        -->
		
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <h1 class="form-title">
            <%=Resources.LanguageFile.PageOrderMobile %>
        </h1>
        <!-- Price place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <asp:TextBox ID="txtPrclDtl" TextMode="MultiLine" placeholder="Parcel Details"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="*"
                        ControlToValidate="txtPrclDtl" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="small-title">
                        <%=Resources.LanguageFile.STPaymentlocation %>
                    </span>
                    <div class="check-group">
                        <span>
                            <asp:RadioButton runat="server" ID="rdCollection" GroupName="Payment" />
                            <label for="<%=rdCollection.ClientID %>">
                                <%=Resources.LanguageFile.STCollection %>
                            </label>
                        </span><span>
                            <asp:RadioButton runat="server" ID="idDelivery" Checked="true" GroupName="Payment" />
                            <label for="<%=idDelivery.ClientID %>">
                                <%=Resources.LanguageFile.STDelivery %>
                            </label>
                        </span>
                    </div>
                </td>
            </tr>
        </table>
        <!-- Terms place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td class="agree-terms">
                    <span class="astrix"></span>
                    <asp:CheckBox runat="server" ID="chkTerms" />
                    <label for="<%=chkTerms.ClientID %>">
                        <%=Resources.LanguageFile.STTermsAndConditions %>
                    </label>
                    <a href="Terms.aspx" target="_blank">
                        <%=Resources.LanguageFile.STTermsAndConditions %>
                    </a>
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
        </table>
        <!-- Button place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="normal-btn" ValidationGroup="Valid" />
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript" language="javascript">

        function validate(control) {
            if (isControlValid(control) == true) {
                $(control).css("box-shadow", "none");
                $(control).css("background-color", "#ffffff");
            } else {
                $(control).css("box-shadow", "red 0px 0px 2px 1px");
                $(control).css("background-color", "#fffafa");
            }
        }

        function isControlValid(control) {
            var validators = control.Validators;
            var isValid = true;
            for (keyValidator in validators) {
                isValid = isValid && (validators[keyValidator].isvalid === true);
            }
            //validators.forEach(function (item) {
            //    isValid = isValid && (item.isvalid === true);
            //});
            return isValid;
        }

        $("#<%= Form.ClientID %>").submit(function (e) {

            if ($(this).attr("data-checked")) {
                return true;
            }

            if ($("#<%=chkTerms.ClientID %>").is(':checked') === false) {
                alert("<%=Resources.LanguageFile.STORDERTERMSINVALIDMESSAGE %>");
                return false;
            }
            
            var val = Page_ClientValidate();
            var invalidValues = "<%=Resources.LanguageFile.STORDERFILLMISSINGMSG %>";
            if (val === false) {
                var i = 0;
                var j = 0;
                for (; i < Page_Validators.length; i++) {
                    if (!Page_Validators[i].isvalid) {
                        $("#" + Page_Validators[i].controltovalidate).css("box-shadow", "red 0px 0px 2px 1px");
                        $("#" + Page_Validators[i].controltovalidate).css("background-color", "#fffafa");
                        invalidValues += "\n" + $("#" + Page_Validators[i].controltovalidate).prop("placeholder");
                        j++;
                    }
                }
                if (j > 2)
                    invalidValues = "<%=Resources.LanguageFile.STORDERFILLMISSINGMSG %>";

                alert(invalidValues);
            } else {
                var response = $('#recaptcha_response_field').val();
                var challenge = $('#recaptcha_challenge_field').val();
                $.ajax({
                    url: "Order.aspx/ValidateCaptcha",
                    data: "{\"response\":\"" + response + "\",\"challenge\":\"" + challenge + "\"}",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        //.net 3.5 uses msg.d, .net 2.0 uses just "msg"
                        if (msg.d === "Yes") {
                            // flag as checked
                            $("#<%= Form.ClientID %>").attr("data-checked", "1");

                            // submit
                            $("#<%= btnSave.ClientID %>").click();
                        } else {
                            //Reload the CAPTCHA (get a new one)
                            Recaptcha.reload();
                            alert("<%=Resources.LanguageFile.STORDERCAPTCHAINVALID %>");
                        }
                    },
                    error: function (a) {
                        alert("<%=Resources.LanguageFile.STORDERCAPTCHAINVALID %>");
                    }
                });
            }
            e.preventDefault();
        });

    </script>
</asp:Content>
