<%@ Page Title="MashaweerNewP2Driver" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="MashaweerNewP2Driver.aspx.cs" Inherits="MashaweerNewP2Driver" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp">
<div class="left">
    <img src="App_Themes/MainEn/images/MASHA-NEW-P2-DRIVER.png" style="width: 46%;float: right;margin-top: -3%;" />
</div>
    <div class="right">
        <span class="short-desc2" style="color:#FFFDFD;font-size: 320%;">
            ARE YOU SHORT 
         </span><br /><br /><br />
        <span class="short-desc2" style="color:#000;font-size: 320%;">
        ON DRIVERS?
            </span><br /><br /><br />
         <span class="short-desc2" style="color:#000;font-size: 175%;">
        There is no point of hiring…
             </span>
        <br /><br />
    </div>
    <div >
         <span class="short-desc" style="color:#000;margin-left: -2%;font-size: 105%;">
        Maximize your team efﬁciency and let us, at Mashaweer, take care of all your drivers / messengers requirements. No more monthly wages, housing, insurance, salik fees, registrations fees, end of service, vacation salary, vehicle maintenance, etc…. 
             </span><br />
        <span class="short-desc" style="color:#FFFDFD;margin-left: -2%;font-size: 105%;">
       Pay only for the errand you want, when you want it. 
            </span><br /><br />
        <span class="short-desc" style="color:#000;margin-left: -2%;font-size: 105%;">
       MASHAWEER can run all of your Business/ofﬁce errands for you reliably and professionally, saving you time, effort, and valuable business resources. We provide businesses with professional same day turnaround on all errands.
             </span><br /><br />
        <span class="short-desc" style="color:#000;margin-left: -2%;font-size: 105%;">
        By delegating everyday, mundane and time-consuming tasks to Mashaweer, your employees can concentrate on their own core skills and on driving the business forward, and reducing costs while saving on valuable resources.
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
                
            </table>
        <span class="short-desc" style="color:#000;margin-left: -4%;font-size: 89%;">
    Thank you for contacting MashaweerUAE, we will get back within 24hrs.
         Our working hours SAT - THU 9AM-9PM.
        </span>
        </div>
    <div class="contact-arrow" style="transform: rotate(180deg);margin-top: -6%;">
        </div>
    

    <div class="clear">
        </div>
</div>
</asp:Content>
