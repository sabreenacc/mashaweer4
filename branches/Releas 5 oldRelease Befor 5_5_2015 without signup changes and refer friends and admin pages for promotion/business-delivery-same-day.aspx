
<%@ Page Title="" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="business-delivery-same-day.aspx.cs" Inherits="MashaweerCorporate2" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp" style="margin-top: -4%;">
<div class="left">
   
    <img src="App_Themes/MainEn/images/Masha-Corporate-2.png" style="width: 43%;float: right;margin-top: -2%;" />
</div>
    <div class="right">
        <p class="short-desc2" style="color:#FFFDFD;font-size: 231%;">
             <font  style="color:#000000;"> 
                 Mashaweer is one of the very first companies to make its service available to both businesses and individuals
                  alike in UAE. </font> </p>
           <div class="footer" style="width: 51%;margin-top: 1%;"></div>
    </div>
    <div style="margin-top: -1%;">
        <span class="short-desc"  style="color:#000;font-size: 146%;margin-left: -2%;">
      We can run all Business/office errands for you reliably and professionally, saving you time, effort, and valuable business resources. We are your multiple office messengers running around the city. Mashaweer provides businesses with professional same day turnaround on all errands.
            </span>
        </div>
    <div style="margin-top: 1%;">
        <span class="short-desc" style="color:#000;font-size: 146%;margin-left: -2%;">
By delegating everyday, mundane & time-consuming tasks to Mashaweer .
            </span>
        </div>
    <div style="margin-top: 1%;">
        <span class="short-desc" style="color:#000;font-size: 146%;margin-left: -2%;">
Busy professionals can relax knowing there is someone <br />to help reduce tasks on their business agendas,<br />giving them back time to be more productive. 
            </span>
    </div>
    <div style="margin-top: 0%;width:100%">
        <span class="short-desc2" style="color:#FFFDFD;font-size: 146%;">
         To ﬁnd out more on how we can help
            <a class='normal-btn inline' style="padding-bottom: 0%;margin-left: 1%;" href="#inline_content">Click Here</a>
            </span>
    </div>
     <%-- =================//popup with its JS :) ================--%>
       <style>
			body{font:12px/1.2 Verdana, sans-serif; padding:0 10px;}<img src="App_Themes/_Main/popupimages/loading.gif" />
			a:link, a:visited{text-decoration:none; color:#416CE5; border-bottom:1px solid #416CE5;}
			h2{font-size:13px; margin:15px 0 0 0;}
		</style>
        <link href="scripts/colorbox.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="scripts/jquery.colorbox.js"></script>
        <script>
            $(document).ready(function () {
                if (screen.width <= 900 || $(window).width() <= 900) {
                    $(".inline").colorbox({ inline: true, width: "90%", height: "94%" });
                    $("#imgDiv").remove();
                    $("#txtPopup").attr("style", "width: 100%;");
                }
                else {
                    $(".inline").colorbox({ inline: true, width: "47%", height: "94%" });
                }
            });
            </script>
       
        <div style='display:none;' >
			<div id='inline_content' style='padding:10px; background:#fff;background-image: url("App_Themes/_Main/images/bg.jpg");'>
           
                <div>
                <div id="txtPopup" style="width: 54%; float: left; margin-top: 6%;">
                        <span class="short-desc" style="color: #ffcc00;font-weight: normal;margin-left: -2%;font-family: 'Helvetica';font-weight: bold;font-size: 610%;">
                        Hello!
                        </span>
                     <p class="short-desc" style="color: #000;margin-left: -2%;font-weight: normal;font-size: 189%;font-family: 'Helvetica';font-weight: bold;margin-top: 0;">
                    We will get back to you
shortly, but first let’s
know more about you
                         </p>
                  </div>
                <div id="imgDiv" style="width: 27%; float: left; margin-top: -1%;margin-left: 14%;">
                    <img src="App_Themes/_Main/popupimages/logoP.png" style="max-width: 100%" />
                    
                        </div>
                    </div>
                <div class="footer" style="clear: both;width: 91.5%;margin-left: 3%;"></div>
                <span class="short-desc" style="color: #000;font-weight: normal;font-family: 'Helvetica';font-weight: bold;font-size: 97%;">
                Please fill in the below information and we will get back to you shortly
                    </span>
                <form runat="server">
			<table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                        <asp:TextBox ID="CompanyName" CssClass="txt-box" runat="server" TabIndex="1" style="border-radius: 5px;border:1px solid #B0AEAD;margin-top: 1%;margin-left: 3%;"
                            placeholder="Company Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ControlToValidate="CompanyName" ForeColor="Red" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="ContactPerson" CssClass="txt-box" runat="server" TabIndex="1" style="border-radius: 5px;border:1px solid #B0AEAD;margin-top: 1%;margin-left: 3%;"
                            placeholder="Contact Person"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="ContactPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        <asp:TextBox ID="MobileNumber" CssClass="txt-box" style="border-radius: 5px;border:1px solid #B0AEAD;margin-top: 1%;margin-left: 3%;" placeholder="Mobile Number"
                            runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                            ValidationExpression="(\+?[0-9]\-?){7,20}" ControlToValidate="MobileNumber" ValidationGroup="Valid"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="MobileNumber" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               <tr>
                    <td>
                        <asp:TextBox ID="EmailAddress" CssClass="txt-box" placeholder="Email Address" style="border-radius: 5px;border:1px solid #B0AEAD;margin-top: 1%;margin-left: 3%;"
                            runat="server" TabIndex="1"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="EmailAddress"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid" ></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="EmailAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
              
                <tr>
                    <td>
                        <asp:TextBox ID="HowWeCanHelp" CssClass="txt-area" style="border-radius: 5px;border:1px solid #B0AEAD;margin-top: 1%;margin-left: 3%;height: 91%;" placeholder="How We Can Help" TextMode="MultiLine" Rows="4"
                            runat="server" TabIndex="1"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="HowWeCanHelp" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                      <asp:Button ID="btnsend" Text="Submit" style="margin-left: 3%;background-color: #ffcc00;padding-right: 6%;padding-left: 6%;margin-top: 0%;" runat="server" OnClick="btnsend_Click" CssClass="normal-btn" ValidationGroup="Valid"/>
                    <%--<asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="normal-btn" Style="margin-top: 5px;" />--%>
                    </td>
                </tr>
            </table>
                    </form>
			</div>
		</div>
        <%-- =========================================================--%>
    
   
    <div class="clear">
        </div>
</div>
</asp:Content>
