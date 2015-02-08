<%@ Page Title="MashaweerCorporate1" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="MashaweerCorporate1.aspx.cs" Inherits="MashaweerCorporate1" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp">
<div class="left">
    <img src="App_Themes/MainEn/images/Masha-Corporate-11%20(2).png" style="width: 44%;float: right;margin-top: -8%;" />
</div>
    <div class="right">
        <p class="short-desc2" style="color:#FFFDFD;font-size: 208%;">
        At Mashaweer, we offer a timesaving and reliable service where we are able to run all kinds of business-related errands, deliveries and pick-ups across the City in just <font class="short-desc2" style="color:#000000;font-size: 77%;"> 90 minutes !</font> </p>
           <div class="footer" style="width: 48%;margin-top: 1%;"></div>
    </div>
    <div >
        <span class="short-desc" style="color:#000;font-size: 105%;margin-left: -2%;">
        Busy professionals can relax knowing there is someone to help reduce the tasks on their business agendas, giving them back valuable time to be more productive.
            <br /> From running errands, cheque collection, bank deposit, bills payment, delivering and distributing hampers to your high end customers such as chocolates, ﬂowers, gifts, invitations to handling your banking needs, Mashaweer is your multiple ofﬁce messenger / driver ready to free your time so you can focus on what’s more important to you.
            </span>
    </div>
    <div style="margin-top: 2%;width:100%">
        <span class="short-desc2" style="color:#FFFDFD;font-size: 125%;">
         To ﬁnd out more on how we can help
            <asp:Button ID="btnSave" CssClass="normal-btn" runat="server" 
                            Text="Click Here" ValidationGroup="Valid" OnClick="btnSave_Click1" />
            </span>
    </div>
    <div class="contact-form" id="contact-form" style="float: left;margin-top: -7%;padding: 0%;">
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                        <asp:TextBox ID="CompanyName" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="Company Name:"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ControlToValidate="CompanyName" ForeColor="Red" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="ContactPerson" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="Contact Person:"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="ContactPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        <asp:TextBox ID="MobileNumber" CssClass="txt-box" placeholder="Mobile Number:"
                            runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                            ValidationExpression="(\+?[0-9]\-?){7,20}" ControlToValidate="MobileNumber"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="MobileNumber" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               <tr>
                    <td>
                        <asp:TextBox ID="EmailAddress" CssClass="txt-box" placeholder="Email Address:"
                            runat="server" TabIndex="1"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="EmailAddress"
                            Display="Dynamic" ErrorMessage="*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="EmailAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
              
                <tr>
                    <td>
                        <asp:TextBox ID="HowWeCanHelp" CssClass="txt-area" placeholder="How We Can Help:" TextMode="MultiLine" Rows="4"
                            runat="server" TabIndex="1"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="HowWeCanHelp" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                


                <tr>
                    <td>
                        
                    </td>
                </tr>
            </table>

        <span class="short-desc" style="color:#000;margin-left: -4%;font-size: 89%;">
    Thank you for contacting MashaweerUAE, we will get back within 24hrs.
         Our working hours SAT - THU 9AM-9PM.
        </span>
        </div>
    <div class="contact-arrow" style="transform: rotate(180deg);margin-top: -11%;">
        </div>
    <div class="clear">
        </div>
</div>
</asp:Content>
