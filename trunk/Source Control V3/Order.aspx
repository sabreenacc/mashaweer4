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
                    <asp:RequiredFieldValidator ID="rvtxtTitle" runat="server" ErrorMessage="*" ControlToValidate="txtCustCmpnyName" EnableClientScript="true" 
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtCustEmail" runat="server" CssClass="txt-box" placeholder="Email"
                        TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="regexEmailValid" runat="server" EnableClientScript="true" 
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                        ControlToValidate="txtCustEmail" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" EnableClientScript="true" 
                        ErrorMessage="*" ControlToValidate="txtCustEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCustPerson" CssClass="txt-box" placeholder="Contact Person" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" EnableClientScript="true" 
                        ControlToValidate="txtCustPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtCustMobile" CssClass="txt-box" placeholder="Mobile Number" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true" 
                        ControlToValidate="txtCustMobile" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCustMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctCompanyName" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctPerson" CssClass="txt-box" placeholder="Sender Name" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctPerson" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" EnableClientScript="true" runat="server" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClctEmail"
                        Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtClctEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctMobile" CssClass="txt-box" placeholder="Phone Number" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator11" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true" 
                        ControlToValidate="txtClctMobile" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctMobile" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctAddress" CssClass="txt-box" placeholder="Address" runat="server"
                        TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctAddress" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtClctLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <%=Resources.LanguageFile.STCity %>
                    </label>
                    <asp:DropDownList CssClass="select-menu" ID="ddlFromEmirate" runat="server" TabIndex="1"
                        AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack="false" onchange="FilterZones()">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctInstructions" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtPrclDtl" TextMode="MultiLine" placeholder="Parcel Details"
                        class="txt-area" Style="height: 60px;" runat="server" TabIndex="2"></asp:TextBox>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                        ControlToValidate="txtDlvryCompanyName" ForeColor="Red" EnableClientScript="true" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryPerson" CssClass="txt-box" placeholder="Contact Person"
                        runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" EnableClientScript="true" 
                        ControlToValidate="txtDlvryPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryEmail" CssClass="txt-box" placeholder="Email Address" runat="server"
                        TabIndex="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" EnableClientScript="true" 
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtDlvryEmail"
                        Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtDlvryEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryMobile" CssClass="txt-box" placeholder="Phone Number " runat="server"
                        TabIndex="2"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator12" runat="server"
                        ValidationExpression="(\+?[0-9]\-?){7,20}" ForeColor="Red" EnableClientScript="true" 
                        ControlToValidate="txtDlvryMobile" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" EnableClientScript="true" 
                        ControlToValidate="txtDlvryMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryAddress" CssClass="txt-box" placeholder="Address " runat="server"
                        TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" EnableClientScript="true" 
                        ControlToValidate="txtDlvryAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDlvryLandMark" CssClass="txt-box" placeholder="Nearest Landmark"
                        runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        <%=Resources.LanguageFile.STCity %></label>
                    <asp:DropDownList CssClass="select-menu" ID="ddlToEmirate" runat="server" TabIndex="2"
                        AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack="false" onchange="FilterZones2()">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" EnableClientScript="true" 
                        ControlToValidate="txtDlvryInstructions" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
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
                    <select name="select" class="via-select">
                        <%=Resources.LanguageFile.STSelectMotor %>
                    </select>
                </td>
            </tr>
        </table>
        <!-- Terms & Button place-->
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
                    <recaptcha:RecaptchaControl ID="recaptcha" runat="server" Theme="clean" PublicKey="6LeOv_ESAAAAALnh0MDIUCLeUuF8mgJ-yOAFdQfC"
                        PrivateKey="6LeOv_ESAAAAAFROKCQ_Rc9DIZQWFmY4rSvgI4ky" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="normal-btn"
                        OnClientClick="return validateData()" ValidationGroup="Valid" />
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
            $("#<%=btnSave.ClientID %>").click(function () {
                return $("#<%=chkTerms.ClientID %>").is(':checked');

            });

        });

        function validateData() {
            if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1" && $("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCITIES %>");
                return false;
            } else if ($("#<%=ddlFromEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCOLLECTIONCITY %>");
                return false;
            } else if ($("#<%=ddlToEmirate.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTDESTINATIONCITY %>");
                return false;
            } if ($("#<%=ddlFromZone.ClientID %>").val() === "-1" && $("#<%=ddlToZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTAREAS %>");
                return false;
            } else if ($("#<%=ddlFromZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTCOLLECTIONAREA %>");
                return false;
            } else if ($("#<%=ddlToZone.ClientID %>").val() === "-1") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGESELECTDESTINATIONAREA %>");
                return false;
            } else if ($("#tdCost").html() === "") {
                alert("<%=Resources.LanguageFile.STORDERMESSAGE %>");
                return false;
            }

            var val = Page_ClientValidate();
            var invalidValues = "<%=Resources.LanguageFile.STORDERFILLMISSINGMSG %>";
            if (!val) {
                var i = 0;
                for (; i < Page_Validators.length; i++) {
                    if (!Page_Validators[i].isvalid) {
                        $("#" + Page_Validators[i].controltovalidate).css("box-shadow", "red 0px 0px 2px 1px");
                        $("#" + Page_Validators[i].controltovalidate).css("background-color", "#fffafa");
                        invalidValues += "\n" + $("#" + Page_Validators[i].controltovalidate).prop("placeholder");
                    }
                }
                alert(invalidValues);
            }

            return val;
        }

        function filterType() {
            $.ajax({
                url: "CalculateHandler.ashx?filterType=1&db=1&from=" + $("#<%=ddlFromZone.ClientID %>").val() + "&to=" + $("#<%=ddlToZone.ClientID %>").val() + "&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val(),
                cache: false,
                success: function (data) {
                    if (parseInt(data, 10) === 0) {
                        // there is no Motorcycle Service between these zones
                        $(".via-select").val("2");
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
                $.ajax({
                    url: "CalculateHandler.ashx?order=1&type=" + $(".via-select").val() + "&db=1&from=" + $("#<%=ddlFromZone.ClientID %>").val() + "&to=" + $("#<%=ddlToZone.ClientID %>").val() + "&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val(),
                    cache: false,
                    success: function (data) {
                        if (parseInt(data, 10) === 0) {
                            alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                            $("#tdCost").html("");
                        }
                        else
                            $("#tdCost").html(data);
                        //+ "<span style='color: red;'>درهم إماراتى</span>
                    },
                    error: function (data) {
                        alert("<%=Resources.LanguageFile.STCHOICEMESSAGE %>");
                        $("#tdCost").html("");
                    }
                });
            }
        }

        function FilterZones() {
            //            var myVal = $("#ddlFromEmirate option:selected").val();
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
