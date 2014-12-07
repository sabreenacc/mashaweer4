<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Admin_userControl_Menu" %>
 <div id="menubar">
    <div class="menubar-l">
    </div>
    <div class="menubar-r">
    </div>
    <div class="menubar-m">
        <div id="menu">
            <div id="dolphincontainer">
                <div id="dolphinnav" class="dolphinnav">
                    <ul>
                        <%foreach (MenuItem item in Items)
              { %>
                        <li>
                            <%if (item.ChildItems.Count == 0)
                  { %>
                            <a href="<%=item.NavigateUrl %>" rel="<%=item.Text %>">
                                <%}
                  else
                  { %>
                                <a href="javascript:doNothing();" rel="<%=item.Text %>">
                                    <%} %>
                                    <span>
                                        <%=item.Text %></span></a></li>
                            <% if (item != Items[Items.Count - 1])
                               {
                            %>

                            <div class="fr">
                            <img src="<%=item.SeparatorImageUrl%>" width="1" height="38" /></div>
                            <%
                               }
                            %>

                        <%} %>
                    </ul>
                </div>
                <!-- Sub Menus container. Do not remove -->
                <div id="dolphin_inner" style="height: 25px;">
                    <%for (int i = 0; i < Items.Count; i++)
          { %>
                    <div id="<%=Items[i].Text %>" class="innercontent " style="float: right; height: 25px;">
                        <table style="height: 25px;">
                            <tr  >
                                <%for (int x = 0; x < i; x++)
                      { %>
                                <td   style="padding-left: 20px; padding-right: 20px;">
                                    <a href="javascript:doNothing();" style="visibility: hidden; letter-spacing: 0px;">
                                        <%=Items[x].Text %></a>
                                </td>
                                <%} %>
                                <%for (int j = 0; j < Items[i].ChildItems.Count; j++)
                      {%>
                                <%if (j == Items[i].ChildItems.Count - 1)
                      {%>
                                <td  class="DivSubmenu" style="padding: 2px 10px 2px 10px;">
                                    <%}
                      else
                      { %>
                                    <td  class="DivSubmenu" style="padding: 2px 10px 2px 10px; border-left: solid 1px white;">
                                        <%} %>
                                         
                                        <a href="<%=Items[i].ChildItems[j].NavigateUrl %>"><span>
                                            <%if (selectedItem == i && selectedSubItem == j)
                              {%>
                                            <b>
                                                <%=Items[i].ChildItems[j].Text%>
                                            </b>
                                            <%}
                              else
                              { %>
                                            <%=Items[i].ChildItems[j].Text%>
                                            <%} %>
                                        </span></a>
                                       
                                    </td>
                                    <%} %>
                            </tr>
                        </table>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</div> 
 

 
<script type="text/javascript">
    var onMenu = false;
    //dolphintabs.init("ID_OF_TAB_MENU_ITSELF", SELECTED_INDEX)
    dolphintabs.init("dolphinnav",<%=selectedItem %> )
</script>
