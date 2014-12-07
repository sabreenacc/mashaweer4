<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserView.ascx.cs" Inherits="Controls_UserView" %>
<%if (SoftCube.Profile.IsAuthenticated)
  { %>
 
            مرحبـــاً بك /
            <%=SoftCube.Profile.UserName%>
       
 
                 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:LinkButton ID="btnSignOut" runat="server" OnClick="btnSignout_Click" style="color:White;">خروج</asp:LinkButton>
<% 
                 
    }  %>

