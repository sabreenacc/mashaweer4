<%@ Page Title="MashaIndividual" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="MashaIndividual.aspx.cs" Inherits="MashaIndividual" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp">
<div class="left">
    <img src="App_Themes/MainEn/images/Masha-Individual.png" style="width: 44%;float: right;margin-top: -8%;" />
</div>
    <div class="right">
        <p class="short-desc2" style="color:#FFFDFD;font-size: 208%;">
            MASHAWEER can run all of your everyday household errands for you, saving you time, effort, and frustration, so you can do more of the things you love.
         </p>
           <div class="footer" style="width: 48%;margin-top: 1%;"></div>
    </div>
    <div >
         <span class="short-desc" style="color:#000;margin-left: -2%;">
        Our personal errands services list is unlimited. Mashaweer delivers a professional personal service with discretion and integrity at all times, giving you peace of mind that those items on your ‘to do list’ that you are simply too busy to do are being attended to.  
             </span><br /><br />
        <span class="short-desc" style="color:#000;margin-left: -2%;">
       When you need a pick up or delivery or your very own personal concierge or extra pair of hands to help, Mashaweer can provide the perfect support. No task is too big or too small. If it isn't listed above, all you need to do is just ask.
            </span>
    </div>
    <div style="margin-top: 2%;width:100%">
        <span class="short-desc2" style="color:#FFFDFD;font-size: 125%;">
         To ﬁnd out more on how we can help
            <asp:Button ID="btnSave" CssClass="normal-btn" runat="server" 
                            Text="Click Here" ValidationGroup="Valid" OnClick="btnSave_Click" />
            </span>
    </div>
    <div class="contact-form" id="contact-form" style="float: left;margin-top: -7%;padding: 0%;">
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
                
                 <tr>
                    <td>
                        <asp:TextBox ID="ContactPerson" CssClass="txt-box" runat="server" TabIndex="1"
                            placeholder="Contact Person"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="ContactPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        <asp:TextBox ID="MobileNumber" CssClass="txt-box" placeholder="Mobile Number"
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
                        <asp:TextBox ID="EmailAddress" CssClass="txt-box" placeholder="Email Address"
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
                        <asp:TextBox ID="HowWeCanHelp" CssClass="txt-area" placeholder="How We Can Help" TextMode="MultiLine" Rows="4"
                            runat="server" TabIndex="1"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                            ErrorMessage="*" ControlToValidate="HowWeCanHelp" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
            </table>
         <span class="short-desc" style="color:#000;margin-left: -4%;font-size: 89%;">
    Thank you for contacting MashaweerUAE, we will get back within 24hrs.
         Our working hours SAT - THU 9AM-9PM.
        </span>
        </div>
    <div class="contact-arrow" style="transform: rotate(180deg);margin-top: -7%;">
        </div>
    <div class="clear">
        </div>
</div>
</asp:Content>
