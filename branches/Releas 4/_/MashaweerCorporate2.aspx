
<%@ Page Title="" Language="C#" MasterPageFile="~/Site2ForChristmasPage.master" AutoEventWireup="true"
    CodeFile="MashaweerCorporate2.aspx.cs" Inherits="MashaweerCorporate2" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp">
<div class="left">
   
    <img src="App_Themes/MainEn/images/Masha-Corporate-2.png" style="width: 48%;float: right;margin-top: -4%;" />
</div>
    <div class="right">
        <p class="short-desc2" style="color:#FFFDFD;font-size: 156%;">
       Errand running, already a popular service internationally, is becoming increasingly valued by businesses and 
            companies who want to maintain their competitive edge through excellent standards of service to their
             clients and employees.
             <font class="short-desc2" style="color:#000000;font-size: 80%;"> 
                 Mashaweer is one of the very first companies to make this service available to both businesses and individuals
                  alike in UAE. </font> </p>
           <div class="footer" style="width: 51%;margin-top: 1%;"></div>
    </div>
    <div >
        <span class="short-desc"  style="color:#000;font-size: 87%;margin-left: -2%;">
      We can run all of your Business/office errands for you reliably and professionally, saving you time, effort, and valuable business resources. We are your multiple office messengers running around the city for you. Mashaweer provides businesses with professional same day turnaround on all errands.
            </span><br /><br />
        <span class="short-desc" style="color:#000;font-size: 87%;margin-left: -2%;">
By delegating everyday, mundane & time-consuming tasks to Mashaweer, your employees can concentrate on their own core skills & on driving the business forward, reducing costs while saving on valuable resources.
            </span><br /><br />
        <span class="short-desc" style="color:#000;font-size: 87%;margin-left: -2%;">
Busy professionals can relax knowing there is someone to help reduce the tasks on their business agendas, giving them back valuable time to be more productive. 

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
    <div class="contact-arrow" style="transform: rotate(180deg);margin-top: -5%;">
        </div>
    <div class="clear">
        </div>
</div>
</asp:Content>
