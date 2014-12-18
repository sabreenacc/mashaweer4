<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Order.aspx.cs" Inherits="Order" EnableEventValidation="false" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.SiteOrder %></title>
    <%--<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:LinqDataSource ID="InqEEmirates" runat="server" ContextTypeName="DBDataContext"
        OrderBy="EnglishName" Select="new (ArabicName, EnglishName, EmirateId)" TableName="EEmirates">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="lnqZones" runat="server" ContextTypeName="DBDataContext"
        OrderBy="EnglishName" Select="new (ArabicName, EnglishName, ZoneId)" TableName="Zones"
        Where="EmirateId == @EmirateId">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlFromEmirate" Name="EmirateId" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <div class="page-warp">
        <h1 class="form-title">
            <%=Resources.LanguageFile.PageOrder %>
            <%= (Request.QueryString["done"] != null) ? Resources.LanguageFile.STORDERSENT : ""%>
        </h1>
        <table class="form-block1" width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td colspan="2">
                    <h3>
                        <%=Resources.LanguageFile.STCustomerDetails %>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCustCmpnyName" runat="server" CssClass="txt-box" placeholder="Customer / Company Name"
                        TabIndex="1"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtCustEmail" runat="server" CssClass="txt-box" placeholder="Email"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="regexEmailValid" runat="server" EnableClientScript="true"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                        ControlToValidate="txtCustEmail" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" EnableClientScript="true"
                        ErrorMessage="*" ControlToValidate="txtCustEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCustPerson" CssClass="txt-box" placeholder="Contact Person" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtCustPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtCustMobile" CssClass="txt-box" placeholder="Mobile Number" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtCustMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCustMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                <%=Resources.LanguageFile.STCollectionLocation %>
            </caption>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctCompanyName" CssClass="txt-box" placeholder="Company Name"
                        runat="server" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctPerson" CssClass="txt-box" placeholder="Sender Name" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctPerson" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" EnableClientScript="true" runat="server" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClctEmail"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtClctEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctMobile" CssClass="txt-box" placeholder="Phone Number" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator11" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtClctMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctAddress" CssClass="txt-box" placeholder="Address" runat="server"
                        TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctAddress" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="1" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctLandMark" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <%=Resources.LanguageFile.STCity %>
                    </label>
                    <asp:DropDownList CssClass="select-menu" ID="ddlFromEmirate" runat="server" TabIndex="1"
                        AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack="false" onchange="FilterZones()" onblur="validate(this);">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvFromEmirate" runat="server" ErrorMessage="*" EnableClientScript="true" ControlToValidate="ddlFromEmirate"
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblFromZone">
                        <%=Resources.LanguageFile.STArea %>
                    </label>
                    <asp:DropDownList CssClass="select-menu select-area" ID="ddlFromZone" runat="server"
                        TabIndex="1" AppendDataBoundItems="True" DataSourceID="lnqZones" DataTextField="EnglishName"
                        DataValueField="ZoneId" AutoPostBack="False">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="rvFromZone" runat="server" ErrorMessage="*" ControlToValidate="ddlFromZone"
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctInstructions" TextMode="MultiLine" placeholder="Instructions"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtPrclDtl" TextMode="MultiLine" placeholder="Parcel Details"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="*"
                        ControlToValidate="txtPrclDtl" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <!-- Destenation place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                <%=Resources.LanguageFile.STDeliveryLocation %>
            </caption>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryCompanyName" CssClass="txt-box" placeholder="Company Name"
                        runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryPerson" CssClass="txt-box" placeholder="Contact Person"
                        runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" EnableClientScript="true"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtDlvryEmail"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtDlvryEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryMobile" CssClass="txt-box" placeholder="Phone Number " runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator12" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="txtDlvryMobile" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryAddress" CssClass="txt-box" placeholder="Address " runat="server"
                        TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="2" onblur="validate(this);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" EnableClientScript="true"
                        ControlToValidate="txtDlvryLandMark" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <%=Resources.LanguageFile.STCity %></label>
                    <asp:DropDownList CssClass="select-menu" ID="ddlToEmirate" runat="server" TabIndex="2"
                        AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack="false" onchange="FilterZones2()" onblur="validate(this);">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvToEmirate" runat="server" ErrorMessage="*" ForeColor="Red" EnableClientScript="true"
                        ControlToValidate="ddlToEmirate" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="lblToZone">
                        <%=Resources.LanguageFile.STArea %></label>
                    <asp:DropDownList CssClass="select-menu select-area" ID="ddlToZone" runat="server"
                        TabIndex="2" AppendDataBoundItems="True" DataSourceID="lnqZones" DataTextField="EnglishName"
                        DataValueField="ZoneId" AutoPostBack="False">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="rvToZone" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlToZone" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryInstructions" TextMode="MultiLine" placeholder="Instructions"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
        </table>
        <!-- Price place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
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
            <tr>
                <td>
                    <%=Resources.LanguageFile.STTotalCostinAED %>
                    <span style="min-width: 30px; display: -webkit-inline-box; display: -moz-inline-box;"
                        id="tdCost"></span>
                    <asp:HiddenField ID="hdnCost" ClientIDMode="Static" Value="" runat="server"/>
                    <asp:TextBox ID="txtDELIVERYDATE" CssClass="txt-box" placeholder="<%$ Resources:LanguageFile, DELIVERYDATE%>"
                            runat="server" TabIndex="1" style="display:none;"></asp:TextBox>
                    <select name="select" id="vehicleSelect" runat="server" class="via-select">
                    </select>
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
                    <asp:Button ID="btnSave" runat="server"   OnClick="btnSave_Click" CssClass="normal-btn" ValidationGroup="Valid" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="normal-btn" Style="margin-top: 5px;"
                        PostBackUrl="Order.aspx" />
                </td>
            </tr>
        </table>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        $(function () {
            filterType();
            $(".select-area").change(filterType);
            $(".via-select").change(calculateprice);

        });

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

            if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1" && $("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCITIES %>");
                return false;
            } else if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCOLLECTIONCITY %>");
                return false;
            } else if ($("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTDESTINATIONCITY %>");
                return false;
            } else if ($("#<%=ddlFromZone.ClientID %>").val() === "-1" && $("#<%=ddlToZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTAREAS %>");
                return false;
            } else if ($("#<%=ddlFromZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCOLLECTIONAREA %>");
                return false;
            } else if ($("#<%=ddlToZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTDESTINATIONAREA %>");
                return false;
            } else if ($("#tdCost").html() === "") {
                
                if ($("#<%=ddlFromEmirate.ClientID %>").val() === "2" && $("#<%=ddlToEmirate.ClientID %>").val() === "2") {
                    alert("<%=Resources.LanguageFile.COMINGSOON%>\n<%=Resources.LanguageFile.STORDERMESSAGE %>");
                } else {
                    alert("<%=Resources.LanguageFile.STORDERMESSAGE %>");
                }
                return false;
            } else if ($("#<%=chkTerms.ClientID %>").is(':checked') === false) {
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

function filterType() {
    $.ajax({
        url: "CalculateHandler.ashx?filterType=1&db=1&from=" + $("#<%=ddlFromZone.ClientID %>").val() + "&to=" + $("#<%=ddlToZone.ClientID %>").val() + "&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val(),
        cache: false,
        success: function (data) {
            if (parseInt(data, 10) === 0) {
                // there is no Motorcycle Service between these zones
                 $(".via-select").val("2");
                $("[id$=txtDELIVERYDATE]").val("2");
                $('.via-select').prop('disabled', 'disabled');
            }
            else
                $('.via-select').prop('disabled', false);
        },
        error: function (data) {
        },
        complete: function () {
            // Handle the complete event
            calculateprice();
        }
    });

}

function calculateprice() {
    if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1" || $("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
        $("#tdCost").html("");
        $("#hdnCost").val("");

        if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1") {
            $("#<%=ddlFromZone.ClientID %>").html("");
            $('#<%=ddlFromZone.ClientID %>').prop('disabled', 'disabled');
            $('#<%=ddlFromZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
            $('#lblFromZone').css("background-color", "rgb(213, 213, 213)");
        }

        if ($("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
            $("#<%=ddlToZone.ClientID %>").html("");
            $('#<%=ddlToZone.ClientID %>').prop('disabled', 'disabled');
            $('#<%=ddlToZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
            $('#lblToZone').css("background-color", "rgb(213, 213, 213)");
        }
    } else {
        if ($("#<%=ddlFromEmirate.ClientID %>").val() === "2" && $("#<%=ddlToEmirate.ClientID %>").val() === "2") {
            alert("<%=Resources.LanguageFile.COMINGSOON%>");
            $("#tdCost").html("");
            $("#hdnCost").val("");
            return;
        }
        $.ajax({
            url: "CalculateHandler.ashx?order=1&type=" + $(".via-select").val() + "&db=1&from=" + $("#<%=ddlFromZone.ClientID %>").val() + "&to=" + $("#<%=ddlToZone.ClientID %>").val() + "&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val(),
            cache: false,
            success: function (data) {
                if (parseInt(data, 10) === 0) {
                    $("#tdCost").html("");
                    $("#hdnCost").val("");
                    if ($('#<%=ddlFromZone.ClientID %>').prop('disabled') || $('#<%=ddlToZone.ClientID %>').prop('disabled'))
                        alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                }
                else {
                    $("#tdCost").html(data);
                    $("#hdnCost").val(data);
                }
                //+ "<span style='color: red;'>درهم إماراتى</span>
            },
            error: function (data) {
                alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                $("#tdCost").html("");
                $("#hdnCost").val("");
            }
        });
        }
    }

    function FilterZones() {
        //            var myVal = $("#ddlFromEmirate option:selected").val();
        
        if ($("#<%=ddlFromEmirate.ClientID %>").val() === "2") {
            $("#<%=ddlFromZone.ClientID %>").html("");
            $('#<%=ddlFromZone.ClientID %>').prop('disabled', 'disabled');
            $('#<%=ddlFromZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
            $('#lblFromZone').css("background-color", "rgb(213, 213, 213)");
            filterType();
            return;
        }
        var strUrl = "";
        strUrl = "CalculateHandler.ashx?order=1&type=" + $(".via-select").val() + "&db=1&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + 0 + "&FilterZones=1";
        $.ajax({
            url: strUrl,
            cache: false,
            success: function (data) {
                if (data === "") {
                    $("#<%=ddlFromZone.ClientID %>").html("");
                    $('#<%=ddlFromZone.ClientID %>').prop('disabled', 'disabled');
                    $('#<%=ddlFromZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
                    $('#lblFromZone').css("background-color", "rgb(213, 213, 213)");
                } else {
                    $("#<%=ddlFromZone.ClientID %>").html("<option value='-1'><%=Resources.LanguageFile.STORDERSELECTAREA %></option>" + data);
                    $('#<%=ddlFromZone.ClientID %>').prop('disabled', false);
                    $('#<%=ddlFromZone.ClientID %>').css("background-color", "#fff");
                    $('#lblFromZone').css("background-color", "#fff");
                }
                filterType();
            }
        });

    }
    function FilterZones2() {
        //            var myVal = $("#ddlFromEmirate option:selected").val();

        if ($("#<%=ddlToEmirate.ClientID %>").val() === "2") {
            $("#<%=ddlToZone.ClientID %>").html("");
            $('#<%=ddlToZone.ClientID %>').prop('disabled', 'disabled');
            $('#<%=ddlToZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
            $('#lblToZone').css("background-color", "rgb(213, 213, 213)");
            filterType();
            return;
        }
        var strUrl = "";
        strUrl = "CalculateHandler.ashx?order=1&type=" + $(".via-select").val() + "&db=1&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val() + "&fromEmirate=" + 0 + "&FilterZones2=1";

        $.ajax({
            url: strUrl,
            cache: false,
            success: function (data) {
                if (data === "") {
                    $("#<%=ddlToZone.ClientID %>").html("");
                    $('#<%=ddlToZone.ClientID %>').prop('disabled', 'disabled');
                    $('#<%=ddlToZone.ClientID %>').css("background-color", "rgb(213, 213, 213)");
                    $('#lblToZone').css("background-color", "rgb(213, 213, 213)");
                } else {
                    $("#<%=ddlToZone.ClientID %>").html("<option value='-1'><%=Resources.LanguageFile.STORDERSELECTAREA %></option>" + data);
                    $('#<%=ddlToZone.ClientID %>').prop('disabled', false);
                    $('#<%=ddlToZone.ClientID %>').css("background-color", "#fff");
                    $('#lblToZone').css("background-color", "#fff");
                }
                filterType();
            }
        });
    }






    </script>
</asp:Content>
