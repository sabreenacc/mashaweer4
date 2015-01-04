<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Service.aspx.cs" Inherits="_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    
    <title><%=Resources.LanguageFile.SiteServices %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  
             



    
<div class="page-warp">
<div class="services-right">
<h2>
    <%=Resources.LanguageFile.PageServices %>
</h2>


</div>

    
            <% var lst = new DBDataContext().Services.Where(s => s.Language == ((Globals.MashaweerLanguage == "en") ? 2 : 1)).ToList();
               foreach (Service ser in lst)
               { %>
          
                <%=ser.Description %> 
    
<div class="clear"></div>

            <%} %>

 
</div>






</asp:Content>
