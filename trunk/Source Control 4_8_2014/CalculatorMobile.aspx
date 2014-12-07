<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="CalculatorMobile.aspx.cs" Inherits="CalculatorMobile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
            <%=OrderFlag ? Resources.LanguageFile.SiteOrder : Resources.LanguageFile.SiteCalculator%></title>
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
            <%=OrderFlag ? Resources.LanguageFile.PageOrderMobile : ""%>
        </h1>
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                        <%=Resources.LanguageFile.STFrom %>
            </caption>
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
        </table>
        <!-- Destenation place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <caption>
                        <%=Resources.LanguageFile.STTo %>
            </caption>
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
        </table>
        <!-- Price place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <%=Resources.LanguageFile.STTotalCostinAED %>
                    <span style="min-width: 30px; display: -webkit-inline-box; display: -moz-inline-box;"
                        id="tdCost"></span>
                    <asp:HiddenField ID="hdnCost" ClientIDMode="Static" Value="" runat="server"/>
                    <select name="select" id="vehicleSelect" runat="server" clientidmode="Static" class="via-select">
                    </select>
					<style>
					.via-select {
						width:45% !important;
					}
					</style>
                </td>
            </tr>
        </table>
        <!-- Button place-->
        <table class="form-block2" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="normal-btn"/>
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
            }
            return true;
        });

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
