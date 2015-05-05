<%@ Page Title="MashaweerCorporate1" Language="C#" MasterPageFile="~/Site2ForLandingPages2.master" AutoEventWireup="true"
    CodeFile="express-UAE.aspx.cs" Inherits="MashaweerCorporate1" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="page-warp" style="margin-top: -4%;">
<div class="left">
    <img src="App_Themes/MainEn/images/Masha-Corporate-11%20(2).png" style="width: 32%;float: right;margin-top: -2%;" />
</div>
    <div id="titlelbl" class="right" style="width: 54%;">
        <p class="short-desc2" style="margin-bottom: 5%;color: #FFFDFD;font-size: 250%;line-height: 1em;font-weight: bold;">
         Mashaweer runs all kinds of business-related errands, deliveries and pick-ups across the City in just<font style="color:#000000;"> 90 minutes !</font> </p>
           <div class="footer" style="width: 100%;margin-top: .5%;"></div>
    </div>
   
    <div> 
        
             
        <div style="  margin-top: 1.1%;">
         <span class="short-desc" style="color:#000;margin-left: -2%;font-size:187%;font-weight: bold;">
       You can relax & let's do it for you!!!!</span>
        </div>
    <br />  
             <div style="float: left;margin-left: 2%;margin-right: 3%;font-family: 'Helvetica';font-size: 145%;  line-height: 1.2em;">                 
                 <ul style="list-style-type:disc">
                 <li>Cheque Collection</li>
                 <li>Bank Deposit</li>
                 <li>Bill Payment</li>                                  
                 </ul>                  
             </div>
             <div id="dvLeftList" style="float: left;margin-left: 6%;margin-right: 3%;font-family: 'Helvetica';font-size: 145%;  line-height: 1.2em;">               
                 <ul style="list-style-type:disc">
                 <li>Gift Distribution</li>
                 <li>Hampers Deliveries</li>
                 <li>Business Errands </li>
                 </ul>
             </div>
        <div><br />
         <span class="short-desc" style="clear:both;margin-top: 0%;display: inline-block;color:#000;margin-left: -2%;font-size:187%;font-weight: bold;">
             You name it...
            </span>   
       </div>       
    </div>
    
            
    
    
</div>
    <div id="DvIncreaseHeight">
    <div class="clear">
        </div><br />
    <div style="height: 60px;" >
        </div>
        </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="FooterContent">
     <form runat="server">
          

         <div class="container_" style="background-color:black;">
                         
                         <div id="footer_" style="background-color: black;padding: 1%;width: 100%;bottom: 0px;right: 0px;
                               left: 0px;margin-left: auto;margin-right: auto;position:fixed;">

                             <div id="footer2_" style="width:69%;right: 0px;   left: 0px;margin-left: auto;margin-right: auto;">
                             <div class="login" style="left: 22%;">                              
                                <div class="formholder">
                                    <div id="popupheader" style="color:white;background-color:black;border: 3px solid black;margin-top: -1%;border-top-radius: 4px;border-top-left-radius: 16px;border-top-right-radius: 16px;">
                                        <img style="vertical-align: middle;padding:1%;" src="App_Themes/_Main/images/FAQIcon.png" />
                                        <span id="spntxtpopUp" style="font-family:'Helvetica';color:white;font-size:100%;font-weight: bold;">
                                        Tell us more so we can help you
                                        </span>
                                        <img id="closeicon" style="vertical-align: middle;float: right;margin-right: 2%;width: 28px;margin-top: 1%;" src="App_Themes/_Main/images/closePopup.png" />
                                    </div>
                                    <div class="randompad" style="background-color: white;border-radius: 17px;">
                                        <fieldset>
                                            <div id="txtboxesDv" style="float:left;width: 55%;">
                                              <table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                         
                        <asp:TextBox ID="CompanyName" CssClass="txt-box" runat="server" TabIndex="1" style="background-color: #ecf0f1;margin-top: 1%;margin-left: 3%;"
                            placeholder="Company Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ControlToValidate="CompanyName" style="color: Red; font-size: 50%;margin-left: -1%;" ForeColor="Red" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="ContactPerson" CssClass="txt-box" runat="server" TabIndex="1" style="background-color: #ecf0f1;margin-top: 1%;margin-left: 3%;"
                            placeholder="Contact Person"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="*" style="color: Red; font-size: 50%;margin-left: -1%;" ControlToValidate="ContactPerson" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        <asp:TextBox ID="MobileNumber" CssClass="txt-box" placeholder="Mobile Number" style="background-color: #ecf0f1;margin-top: 1%;margin-left: 3%;"
                            runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red"
                            ValidationExpression="(\+?[0-9]\-?){7,20}" ControlToValidate="MobileNumber"
                            Display="Dynamic" style="color: Red; font-size: 50%;margin-left: -1%;" ErrorMessage="*" ValidationGroup="Valid" ></asp:RegularExpressionValidator>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                            ErrorMessage="*" style="color: Red; font-size: 50%;margin-left: -1%;" ControlToValidate="MobileNumber" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               <tr>
                    <td>
                        <asp:TextBox ID="EmailAddress" CssClass="txt-box" placeholder="Email Address" style="background-color: #ecf0f1;margin-top: 1%;margin-left: 3%;"
                            runat="server" TabIndex="1"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="EmailAddress"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="Valid"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="*" style="color: Red; font-size: 50%;margin-left: -1%;" ControlToValidate="EmailAddress" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                    </td>
                </tr>
              
                
                
                
            </table>           
                                             </div>
                                            <div id="txtcommnt" style="float:left;width: 45%;">
                                                <asp:TextBox ID="HowWeCanHelp" style="padding: 0%;background-color: #ecf0f1;margin-top: 1%;margin-left: 3%;" CssClass="txt-area" placeholder="Comments:" TextMode="MultiLine" Rows="4"
                            runat="server" TabIndex="1"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ClientValidationFunction="Validate"
                            ErrorMessage="*" style="color: Red; font-size: 50%;margin-left: -1%;" ControlToValidate="HowWeCanHelp" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
                                                 <asp:Button  ID="btnsend" Text="Submit"  style="margin-left: 63%;font-size: 15px;width:88px;margin-top: 3%;background-color: black;" runat="server" OnClick="btnsend_Click" CssClass="normal-btn" ValidationGroup="Valid"/>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="arrow-up" style="left: 93%;position: relative;top: 0px;border-bottom: 15px solid black;border-left: 10px solid transparent;border-right: 10px solid transparent;"></div>
                                </div>
                                
                            </div>
                <div id="dvfootertitle" style="color:white;float: left;">
                    <span id="spntxtfooter" style="vertical-align: middle;">
                    Click to find out more on how we can help  &nbsp; &nbsp; &nbsp;
                        <img id="arrowfooter" style="vertical-align: middle;" src="App_Themes/_Main/images/arrow.png" />
                        </span>
                    
                </div>
               
               <div id="btnsfooter">
                <map name="contactmap">
                <a id="contactbtn" coords="315,175,552,464" alt="إتصل بمشاوير" href="tel:800900900" style="  width: 155px;
  margin-left: 25%;
  border: 3px #FDFCFC solid;
  background-color: rgb(0, 0, 0);
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 10px;
  color: white;
  padding-left: 9.5px;
  padding-right: 9.5px;
  padding-bottom: 1%;
  padding-top: .5%;
  text-decoration: blink;">
                    <img src="App_Themes/_Main/images/phoneIcon.png" style="vertical-align: middle;" />
                    <span id="spnContact" style="font-size: 16px;vertical-align: middle;"><strong>800 900 900</strong></span>
                </a>
                 </map>

                <button onclick="clk(this);" type="button" id="loginform" style="  margin-left: 1%;width: 120px;border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px;
                 -moz-border-radius: 40px;border-radius: 10px;color: white;padding-left: 9.5px;padding-right: 9.5px;padding-bottom: .3%;padding-top: .3%;">
                    <img src="App_Themes/_Main/images/FAQIcon.png" style="vertical-align: middle;" />
                    <span id="spnAsk" style="font-size: 16px;vertical-align: middle;margin-left: 2%;"><strong>Ask Us</strong></span>
                </button>
                   </div>  
                 <%--//==
                 <%--//============= Login popup / refer to friend popup =====================--%>

                               

                            <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
                            <script src="scripts/LoginPopUp/js/index.js"></script>

                           <script>

                               var wdth = $(window).width();
                              // alert(wdth);
                               //(wdth);
                               var popupWdth = wdth * .5;
                               var popupleft = wdth - $("#loginform").offset().left;
                               if ($(window).width() <= 364 || screen.width <= 364) {
                                   $("#footer_").attr("style", "background-color: black;padding: 1%;width: 100%;bottom: 0px;right: 0px;left: 0px;margin-left: auto;margin-right: auto;position:fixed;");
                                   $("#footer2_").attr("style", "background-color: black;width: 100%;bottom: 0px;right: 0px;left: 0px;margin-left: auto;margin-right: auto;");
                                   $("#arrowfooter").attr("style", "width:7%;vertical-align: middle;");
                                   $("#dvfootertitle").attr("style", "margin-top: 1%;font-size:91%;color:white;float: left;");
                                 //  $("#contactbtn").attr("style", "width: 20%;border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px; -moz-border-radius: 40px;border-radius: 10px;color: white;padding-bottom: .3%;padding-top: .3%;");
                                   $("#contactbtn").attr("style", "vertical-align: middle;width: 155px;margin-left: 0%;border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px; -moz-border-radius: 40px; border-radius: 10px;color: white;padding-left: 4.5px;padding-bottom: 1%;padding-top: 1%;text-decoration: blink;");
                                   $("#loginform").attr("style", "  vertical-align: middle; border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px;-moz-border-radius: 40px;border-radius: 10px; color: white;width: 139px;padding-bottom: 1.5%;padding-top: 1.5%;margin-left: 1%;");
                                   $("#spnAsk").attr("style", "font-size: 25px;vertical-align: middle;margin-left: 2%; ");
                                   $("#spnContact").attr("style", " font-size: 24px;vertical-align: middle;");

                                   $("#btnsfooter").attr("style", "margin-top:5%;  margin-top: .5%;vertical-align: middle;");
                                   $(".formholder").attr("style", "width: 674.5px;margin-top: -77.3%;position:fixed;border: 2px solid black;border-radius: 17px;background-color:white;");
                                   $("#txtcommnt").attr("style", "");
                                   $("#txtboxesDv").attr("style", "");
                                   $(".login").attr("style", "left: 15%;");
                                   $("#<%=HowWeCanHelp.ClientID%>").attr("style", "background-color: white;background-color: #ecf0f1; margin-top: 4.5%;margin-left: 3%;")
                                  

                                   $(".arrow-up").attr("style", "left: 83%;position: relative;top: 0px;border-bottom: 15px solid black;border-left: 10px solid transparent;border-right: 10px solid transparent;");
                                   $("#popupheader").attr("style", "color:white;background-color:black;border: 3px solid black;margin-top: -2%;border-top-radius: 4px;border-top-left-radius: 16px;border-top-right-radius: 16px;");
                                   $("#titlelbl").attr("style", "");
                                   $("#dvLeftList").attr("style", "float: left;margin-left: 2%;margin-right: 3%;font-family: 'Helvetica';font-size: 145%;  line-height: 1.2em;");
                               }
                               if ($(window).width() <= 463|| screen.width <=463)
                               {
                                   
                                   $("#footer_").attr("style", "background-color: black;padding: 1%;width: 100%;bottom: 0px;right: 0px;left: 0px;margin-left: auto;margin-right: auto;position:fixed;");
                                   $("#footer2_").attr("style", "background-color: black;width: 100%;bottom: 0px;right: 0px;left: 0px;margin-left: auto;margin-right: auto;");                                  
                                   $("#dvfootertitle").attr("style", "margin-top: 1%;font-size:83%;color:white;float: left;");
                                   //  $("#contactbtn").attr("style", "width: 20%;border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px; -moz-border-radius: 40px;border-radius: 10px;color: white;padding-bottom: .3%;padding-top: .3%;");
                                   $("#contactbtn").attr("style", "vertical-align: middle;width: 155px;margin-left: 0%;border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px; -moz-border-radius: 40px; border-radius: 10px;color: white;padding-left: 4.5px;padding-bottom: 1%;padding-top: 1%;text-decoration: blink;");
                                   $("#loginform").attr("style", "vertical-align: middle; border: 3px #FDFCFC solid;background-color: rgb(0, 0, 0);-webkit-border-radius: 40px;-moz-border-radius: 40px;border-radius: 10px; color: white;width: 143px;padding-bottom: 1.5%;padding-top: 1.5%;margin-left: .5%;");
                                   $("#spnAsk").attr("style", "font-size: 24px;vertical-align: middle;margin-left: 0%; ");
                                   $("#spnContact").attr("style", " font-size: 24px;vertical-align: middle;");
                                   $("#spntxtfooter").html('Click to find out more on how we can help<img id="arrowfooter" style="vertical-align: middle;" src="App_Themes/_Main/images/arrow.png" />');
                                   $("#arrowfooter").attr("style", "width:7%;vertical-align: middle;");
                                   $("#spntxtpopUp").attr("style", "font-family:'Helvetica';color:white;font-size:90%;font-weight: bold;")

                                   $("#btnsfooter").attr("style", "margin-top:5%;  margin-top: .5%;vertical-align: middle;");
                                   $(".formholder").attr("style", "width: 674.5px;margin-top: -73.3%;position:fixed;border: 2px solid black;border-radius: 17px;background-color:white;");
                                   $("#txtcommnt").attr("style", "");
                                   $("#txtboxesDv").attr("style", "");
                                   $(".login").attr("style", "left: 24%;");
                                   $("#<%=HowWeCanHelp.ClientID%>").attr("style", "background-color: white;background-color: #ecf0f1; margin-top: 4.5%;margin-left: 3%;")


                                   $(".arrow-up").attr("style", "left: 83%;position: relative;top: 0px;border-bottom: 15px solid black;border-left: 10px solid transparent;border-right: 10px solid transparent;");
                                   $("#popupheader").attr("style", "color:white;background-color:black;border: 3px solid black;margin-top: -2%;border-top-radius: 4px;border-top-left-radius: 16px;border-top-right-radius: 16px;");
                                   $("#titlelbl").attr("style", "");
                                   $("#dvLeftList").attr("style", "float: left;margin-left: 2%;margin-right: 3%;font-family: 'Helvetica';font-size: 145%;  line-height: 1.2em;");
                               }
                                                           else {
                                                               $(".formholder").attr("style", "margin-top: -20%;position:fixed;background-color: white;width: 674.5px;border: 2px solid black;border-radius: 17px;");
                                                           }
                           function clk(e) {
                               e.preventDefault();
                           }
                           $("#closeicon").click(function (e) {

                               var container = $(".login");
                               container.hide();
                               $('#loginform').removeClass('green');
                           });
                           var originHeight = $(window).height();
                           var height2 = originHeight;
                           $(window).resize(function () {
                               if ($(window).width() <= 463 || screen.width <= 463)
                               {
                                   var currentHeight = $(window).height();

                                   if (currentHeight < height2) {
                                       $("#footer_").attr("style", "background-color: black;padding: 1%;width: 100%;right: 0px;left: 0px;margin-left: auto;margin-right: auto;position:absolute;");
                                       $(".formholder").attr("style", "width: 674.5px;margin-top: -400%;position:absolute;border: 2px solid black;border-radius: 17px;background-color:white;");
                                       //alert("abs");
                                       height2 = currentHeight;
                                   }
                                   else {
                                       $("#footer_").attr("style", "background-color: black;padding: 1%;width: 100%;bottom: 0px;right: 0px;left: 0px;margin-left: auto;margin-right: auto;position:fixed;");
                                       $(".formholder").attr("style", "width: 674.5px;margin-top: -77.3%;position:fixed;border: 2px solid black;border-radius: 17px;background-color:white;");
                                       height2 = originHeight;
                                       // alert("fx");
                                   }
                               }
                           });
                           </script>
        <%--//=========================================--%>
                                 </div>
            </div>
             </div>
          </form>
</asp:Content>