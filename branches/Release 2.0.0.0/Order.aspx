<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Order.aspx.cs" Inherits="Order" EnableEventValidation="false"%>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Mashaweer | Place an Order</title>
    <%--<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--sections start-->
    <div class="page-titlebar">
        <div class="title-l">
        </div>
        <div class="title-r">
        </div>
        <div class="title-cntr">
            <div class="title-txt">
                <asp:Literal ID="ltrlOrderTitle" runat="server" Text="<%$ Resources:LanguageFile, PLACE_ORDER%>" /></div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>

    <div class="page-content">
        <asp:LinqDataSource ID="InqEEmirates" runat="server" ContextTypeName="DBDataContext"
            OrderBy="EnglishName" Select="new (ArabicName, EnglishName, EmirateId)" TableName="EEmirates">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lnqZones" runat="server" ContextTypeName="DBDataContext"
            OrderBy="EnglishName" Select="new (ArabicName, EnglishName, ZoneId)" TableName="Zones"
            Where = "EmirateId == @EmirateId">

    <WhereParameters>
        <asp:ControlParameter ControlID="ddlFromEmirate" Name="EmirateId" 
            PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
        
        </asp:LinqDataSource>    
        <div style="font-weight: bold; color: Red; text-align: center; font-size: 16px;">
            <asp:Literal ID="ltrlOrderMessage" Visible="false" runat="server" Text="<%$ Resources:LanguageFile, ORDER_FOOTER_PARAGRAPH %>" />
        </div>
        <table class="contact-table" border="0" style='width: 100%; margin-bottom: 25px;
            <asp:Literal ID="ltrlOrderTable" Visible="false" runat="server" Text="visibility: hidden;" />'>
            <tr>
                <td height="87" colspan="6" style="color: #8D690B; height: 20px; padding-top: 6px;
                    padding-left: 5px; font-size: 19px; font-weight: bold;">
                    <asp:Literal ID="ltrlOrderForm" runat="server" Text="<%$ Resources:LanguageFile, ORDER_FILL_ORDER_FORM %>" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                </td>
            </tr>
            <tr>
                <td height="87" colspan="6" style="color: #8D690B; height: 20px; padding-top: 6px;
                    font-weight: bold; font-size: 16px; padding-left: 5px;">
                    <asp:Literal ID="ltrlCustDetails" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CUSTOMER_DETAILS %>" />
                </td>
            </tr>
            <tr>
                <td width="230">
                    <asp:Literal ID="ltrlCustCmpnyName" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CUSTOMER_COMPANY_NAME%>" />
                    <span style="color: red;">*</span>
                </td>
                <td width="6">
                    :
                </td>
                <td width="414">
                    <asp:TextBox ID="txtCustCmpnyName" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvtxtTitle" runat="server" ErrorMessage="*" ControlToValidate="txtCustCmpnyName"
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td width="230">
                    <asp:Literal ID="ltrlCustNO" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CUSTOMER_NO%>" />
                </td>
                <td width="6">
                    :
                </td>
                <td width="414">
                    <asp:TextBox ID="txtCustNO" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlCustPerson" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CONTACT_PERSON %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtCustPerson" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCustPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlCustMobile" runat="server" Text="<%$ Resources:LanguageFile, ORDER_MOBILE_NO %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtCustMobile" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="txtCustMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlCustEmail" runat="server" Text="<%$ Resources:LanguageFile, ORDER_EMAIL %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtCustEmail" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="regexEmailValid" runat="server"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                        ControlToValidate="txtCustEmail" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtCustEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="6" style="height: 6px;">
                </td>
            </tr>
            <tr>
                <td height="87" colspan="3" style="color: #8D690B; height: 20px; padding-top: 6px;
                    font-weight: bold; font-size: 16px; padding-left: 5px;">
                    <asp:Literal ID="ltrlClctDetails" runat="server" Text="<%$ Resources:LanguageFile, ORDER_COLLECTION_DETAILS %>" />
                </td>
                <td height="87" colspan="3" style="color: #8D690B; height: 20px; padding-top: 6px;
                    font-weight: bold; font-size: 16px; padding-left: 5px;">
                    <asp:Literal ID="ltrlDlvryDetails" runat="server" Text="<%$ Resources:LanguageFile, ORDER_DELIVERY_DETAILS %>" />
                </td>
            </tr>
            <tr>
                <td colspan="6" style="height: 6px;">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctCompanyName" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CUSTOMER_COMPANY_NAME  %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctCompanyName" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctCompanyName" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryCompanyName" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CUSTOMER_COMPANY_NAME %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryCompanyName" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                        ControlToValidate="txtDlvryCompanyName" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctPerson" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CONTACT_PERSON_COLLECTION %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctPerson" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryPerson" runat="server" Text="<%$ Resources:LanguageFile, ORDER_CONTACT_PERSON_DELIVERY %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryPerson" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                        ControlToValidate="txtDlvryPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctEmail" runat="server" Text="<%$ Resources:LanguageFile, ORDER_EMAIL %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctEmail" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClctEmail"
                        Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtClctEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryEmail" runat="server" Text="<%$ Resources:LanguageFile, ORDER_EMAIL %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryEmail" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtDlvryEmail"
                        Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtDlvryEmail" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctMobile" runat="server" Text="<%$ Resources:LanguageFile, ORDER_MOBILE_NO %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctMobile" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryMobile" runat="server" Text="<%$ Resources:LanguageFile, ORDER_MOBILE_NO %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryMobile" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                        ControlToValidate="txtDlvryMobile" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctTel" runat="server" Text="<%$ Resources:LanguageFile, ORDER_TELEPHONE %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctTel" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvyTel" runat="server" Text="<%$ Resources:LanguageFile, ORDER_TELEPHONE %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvyTel" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctFax" runat="server" Text="<%$ Resources:LanguageFile, ORDER_FAX %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctFax" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryFax" runat="server" Text="<%$ Resources:LanguageFile, ORDER_FAX %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryFax" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctAddress" runat="server" Text="<%$ Resources:LanguageFile, ORDER_ADDRESS %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctAddress" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                        ControlToValidate="txtClctAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryAddress" runat="server" Text="<%$ Resources:LanguageFile, ORDER_ADDRESS %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryAddress" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*"
                        ControlToValidate="txtDlvryAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlClctLandMark" runat="server" Text="<%$ Resources:LanguageFile, ORDER_LANDMARK %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtClctLandMark" Style="width: 90%" runat="server" TabIndex="1"></asp:TextBox>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryLandMark" runat="server" Text="<%$ Resources:LanguageFile, ORDER_LANDMARK %>" />
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDlvryLandMark" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>
                <asp:Literal ID="ltrlClctEmirate" runat="server" Text="<%$ Resources:LanguageFile, ORDER_EMIRATE %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                <asp:DropDownList class="dropdownEmirate" ID="ddlFromEmirate" Style="width: 45%" runat="server"
                        TabIndex="1" AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack = "false" onchange="FilterZones()">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvFromEmirate" runat="server" ErrorMessage="*" ControlToValidate="ddlFromEmirate"
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryEmirate" runat="server" Text="<%$ Resources:LanguageFile, ORDER_EMIRATE %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList class="dropdownEmirate" ID="ddlToEmirate" Style="width: 45%" runat="server"
                        TabIndex="2" AppendDataBoundItems="True" DataSourceID="InqEEmirates" DataTextField="EnglishName"
                        DataValueField="EmirateId" AutoPostBack = "false" onchange="FilterZones2()">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvToEmirate" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlToEmirate" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td>
                    <asp:Literal ID="ltrlClctZone" runat="server" Text="<%$ Resources:LanguageFile, ORDER_ZONE %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList class="dropdownZone" ID="ddlFromZone" Style="width: 45%" runat="server"
                        TabIndex="1" AppendDataBoundItems="True" DataSourceID="lnqZones" DataTextField="EnglishName"
                        DataValueField="ZoneId" AutoPostBack="False">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvFromZone" runat="server" ErrorMessage="*" ControlToValidate="ddlFromZone"
                        ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="ltrlDlvryZone" runat="server" Text="<%$ Resources:LanguageFile, ORDER_ZONE %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:DropDownList class="dropdownZone" ID="ddlToZone" Style="width: 45%" runat="server"
                        TabIndex="2" AppendDataBoundItems="True" DataSourceID="lnqZones" DataTextField="EnglishName"
                        DataValueField="ZoneId" AutoPostBack="False">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rvToZone" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlToZone" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ltrlShipment" runat="server" Text="<%$ Resources:LanguageFile, ORDER_SHIPMENT %>" />
                    <span style="color: red;">*</span>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtShipment" Style="width: 90%" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*"
                        ControlToValidate="txtShipment" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:LanguageFile, ORDER_COST %>" />
                </td>
                <td>
                    :
                </td>
                <td id="tdCost" style="line-height: 20px; font-weight: bolder; font-size: 18px;">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="ItrlComments" runat="server" Text="<%$ Resources:LanguageFile, COMMENT %>" />
                </td>
                <td>
                    :
                </td>
                <td colspan="4" rowspan="2">
                    <textarea id="txtComments" cols="20" name="S1" rows="2" style="width: 90%"></textarea></td>
            </tr>

            <tr>
                <td>
                    
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: center;">
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="snd-btn"
                        Style="margin-top: 5px;" Text="<%$ Resources:LanguageFile, CONTACT_US_SEND %>"
                        ValidationGroup="Valid" />
                    <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:LanguageFile, CONTACT_US_CLEAR %>"
                        CssClass="snd-btn" Style="margin-top: 5px;" PostBackUrl="Order.aspx" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" language="javascript">
        $(function () {
            calculateprice();
            $(".dropdownZone").change(calculateprice);


        });

        function calculateprice() {
            $.ajax({
                url: "CalculateHandler.ashx?order=1&type=1&db=1&from=" + $("#<%=ddlFromZone.ClientID %>").val() + "&to=" + $("#<%=ddlToZone.ClientID %>").val() + "&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val(),
                cache: false,
                success: function (data) {
                    if (parseInt(data, 10) === 0)
                        alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                    else
                        $("#tdCost").html(data);
                    //+ "<span style='color: red;'>درهم إماراتى</span>
                },
                error: function (data) {
                    alert("الخدمة غير متوفرة بين هاتين المنطقتين");
                    $("#tdCost").html("");
                }
            });
        }

        function FilterZones() {
            //            var myVal = $("#ddlFromEmirate option:selected").val();
            var strUrl = "";
            strUrl = "CalculateHandler.ashx?order=1&type=1&db=1&fromEmirate=" + $("#<%=ddlFromEmirate.ClientID %>").val() + "&toEmirate=" + 0 + "&FilterZones=1";
            $.ajax({
                url: strUrl,
                cache: false,
                success: function (data) {

                    $("#<%=ddlFromZone.ClientID %>").html(data);
                    calculateprice();
                }
            });

        }
            function FilterZones2() {
//            var myVal = $("#ddlFromEmirate option:selected").val();
            var strUrl = "";
            strUrl = "CalculateHandler.ashx?order=1&type=1&db=1&toEmirate=" + $("#<%=ddlToEmirate.ClientID %>").val() + "&fromEmirate=" + 0 + "&FilterZones2=1";

                $.ajax({
                    url: strUrl,
                    cache: false,
                    success: function (data) {
                        $("#<%=ddlToZone.ClientID %>").html(data);
                        calculateprice();
                    }
                });
            }
      
    </script>
</asp:Content>
