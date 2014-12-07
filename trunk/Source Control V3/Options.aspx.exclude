<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Options.aspx.cs" Inherits="Options" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Choose your option</title>
    <style type="text/css">
        .title-l
{
    font-size: large;
}

        .title2-txt
{
    background-image: url(images/title-bg.png);
    font-family: 'Oswald' , sans-serif;
    color: #B5A15A;
    font-size: 18px;    
    background: #11574B repeat-x;
            text-align: center;
            margin-left: 85px;
        }
        
        .style1
        {
            width: 552px;
        }
        
        .style2
        {
            width: 191px;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-titlebar">
    <div class="title-l">
        </div>
        <div class="title-r">
        </div>
        <div class="title-cntr">
            <div class="title-txt">
                <asp:Literal ID="ltrlServiceTitle" runat="server" Text="<%$ Resources:LanguageFile, OPTIONS_TITLE%>" /></div>
            <%--<a href="#" class="wall-link">
                <asp:Literal ID="ltrlMashaweerWall" runat="server" Text="<%$ Resources:LanguageFile, WRITE_ON_MASHAWEER_WALL%>" /></a>--%>
        </div>
    </div>

    <div class="page-content">

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


        <div class="clear">
                <table>
                <tr>
                <td>   
                <div class="title-r">
                <div class="title-l">
                </div>
                </div> 
                <asp:Button ID="Button1" runat="server" Text="<%$ Resources:LanguageFile, DUBAI %>"  
                    onclick="Button1_Click" Width="186px" class="title2-txt" style="margin-left:0px"/>
                </td>
                <td class="style1"></td>
                <td></td>
                <td class="style2">
                <asp:Button ID="Button2" runat="server" Text="<%$ Resources:LanguageFile, ABUDHABI %>"
                    onclick="Button2_Click" Width="186px" class="title2-txt"/>
                </td>
                </tr>
                <tr>
                <td></td>
                <td colspan = "2">
                <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                    Text="<%$ Resources:LanguageFile, ACROSS_EMIRATES %>" Width="400" class="title2-txt"/>
                </td>
                <td class="style2"></td>
                </tr>
                <tr>
                <td>
                <asp:Button ID="Button3" runat="server" Text="<%$ Resources:LanguageFile, SHARJAH %>"
                    onclick="Button3_Click" Width="186px" class="title2-txt" style="margin-left:0px"/>
                </td>
                <td class="style1"></td>
                <td></td>
                <td class="style2">
                <asp:Button ID="Button4" runat="server" Text="<%$ Resources:LanguageFile, AJMAN %>"
                    onclick="Button4_Click" Width="186px" class="title2-txt"/>
                </td>
                </tr>
                </table>
        </div>


    </div>
</asp:Content>
