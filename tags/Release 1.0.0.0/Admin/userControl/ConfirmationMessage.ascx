<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConfirmationMessage.ascx.cs"
    Inherits="ConfirmationMessage" %>
<div id="<%=hfID.ClientID %>block" style="cursor:wait; display: none; width: 100%; height: 70%; z-index: 10000; position: absolute;
    left: 0px; top: 0px; background-image: url('/App_Themes/Admin/images/win-bg.png');
    background-repeat: repeat; text-align: center; margin: auto; padding-top: 15%;
    overflow: hidden;">
    <table   id="<%=hfID.ClientID %>tplComFirmDelete" cellspacing="0" cellpadding="0" style="width:300px; display: none;
        margin: 0 auto;">
        <tr>
            <td class="top-right">
            </td>
            <td class="top-mid" align="right">
                تاكيد الحذف
            </td>
            <td class="top-left">
            </td>
        </tr>
        
       
        <tr>
            <td class="mid-right">
            </td>
            <td class="mid" >
                <div class="box2">
                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
                        <tr>
                            
                            <td>
                                هل تريد الحذف ؟
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 25px; padding-bottom: 10px">
                            <input id="<%=hfID.ClientID %>btnOk" type="button" onclick="<%=ClientID%>_Delete();" value="نعم" />
                            <input id="<%=hfID.ClientID %>btnNo" type="button" onclick="<%=ClientID%>_CleanCom();"  value="لا" />
                               
                            
                            </td>
                        </tr>
                         
                    </table>
                </div>
            </td>
            <td class="mid-left">
            </td>
        </tr>
        <tr>
            <td class="bottom-right">
            </td>
            <td class="bottom-mid">
            </td>
            <td class="bottom-left">
            </td>
        </tr>
    </table>
    <table   id="<%=hfID.ClientID %>tplDone" cellspacing="0" cellpadding="0" style="width: 300px;
        display: none; margin: 0 auto;">
        <tr>
            <td class="top-right">
            </td>
            <td class="top-mid" align="right">
                 الحذف
            </td>
            <td class="top-left">
            </td>
        </tr>
    
        <tr>
            <td class="mid-right">
            </td>
            <td class="mid" >
                <div class="box2">
                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
                        <tr>
                            
                            <td>
                                لقد تمت عملية الحذف
                            </td>
                           
                        </tr>
                        <tr>
                            <td style="padding-top: 25px; padding-bottom: 10px">
                       

                                  <input type="button" onclick="<%=ClientID%>_CloseDone();" value="غلق" />
 
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="mid-left">
            </td>
        </tr>
        <tr>
            <td class="bottom-right">
            </td>
            <td class="bottom-mid">
            </td>
            <td class="bottom-left">
            </td>
        </tr>
       
    </table>
    <table  id="<%=hfID.ClientID %>tpFail" cellspacing="0" cellpadding="0" style="width: 300px;
        display: none; margin: 0 auto;">
        <tr>
            <td class="top-right">
            </td>
            <td class="top-mid" align="right">
                الحذف
            </td>
            <td class="top-left">
            </td>
        </tr>
                <tr>
            <td class="mid-right">
            </td>
            <td class="mid">
                <div class="box2">
                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="5px">
                        <tr>
                            
                            <td>
                                لم تتم عملية الحذف من فضلك اعد المحاوله ؟
                            </td>
                           
                           
                        </tr>
                        
                        <tr>
                            <td style="padding-top: 25px; padding-bottom: 10px">
                                
                                   
                                <input type="button" onclick="<%=ClientID%>_CloseDone();" value="غلق" />
                                
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="mid-left">
            </td>
        </tr>
        <tr>
            <td class="bottom-right">
            </td>
            <td class="bottom-mid">
            </td>
            <td class="bottom-left">
            </td>
        </tr>
       
    </table>
</div>


<script type="text/javascript">

    function <%=ClientID%>_ShowCom(obj) {
            $('#<%=hfID.ClientID %>').val(obj);
            $('#<%=hfID.ClientID %>tpFail').hide();
            $('#<%=hfID.ClientID %>tplDone').hide();
            $('#<%=hfID.ClientID %>block').show();
            $('#<%=hfID.ClientID %>tplComFirmDelete').show();
  
     }
    function <%=ClientID%>_Delete() {
      
     $('#<%=hfID.ClientID %>btnOk').attr("disabled", "disabled");
     $('#<%=hfID.ClientID %>btnNo').attr("disabled", "disabled");
        var id = $('#<%=hfID.ClientID %>').val();
        $.ajax({ url: "/Admin/userControl/Command.ashx?Command=<%=Command%>(" + id + ")", cache: false,
         error: function(data){ 
             $('#<%=hfID.ClientID %>tplComFirmDelete').hide();
             $('#<%=hfID.ClientID %>tpFail').show();
         },
          success: function (data) {
             $('#LvRow_'+id).hide();
             $('#<%=hfID.ClientID %>tplComFirmDelete').hide();
             $('#<%=hfID.ClientID %>tplDone').show();
       }
        });
          $('#<%=hfID.ClientID %>btnOk').removeAttr("disabled" );
           $('#<%=hfID.ClientID %>btnNo').removeAttr("disabled");
    }
    function <%=ClientID%>_CleanCom() {
        $('#<%=hfID.ClientID %>tplComFirmDelete').hide();
        $('#<%=hfID.ClientID %>block').hide();
    }
    function <%=ClientID%>_CloseDone() {
        $('#<%=hfID.ClientID %>tplDone').hide();
        $('#<%=hfID.ClientID %>block').hide();
        //location.reload();
    }
</script>
<asp:HiddenField ID="hfID" runat="server" />
