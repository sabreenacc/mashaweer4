<%@ control language="C#" autoeventwireup="true" inherits="Controls_UserView, App_Web_kkqtmzb0" %>
<%if (SoftCube.Profile.IsAuthenticated)
  { %>
 
            مرحبـــاً بك /
            <%=SoftCube.Profile.UserName%>
       
 
                 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:LinkButton ID="btnSignOut" runat="server" OnClick="btnSignout_Click" style="color:White;">خروج</asp:LinkButton>
<% 
                 
    }  %>

