<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Support.aspx.cs" Inherits="Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.Support %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="container">
            <div class="content">
                <div style="width: 25%;" class="check-group">
                    <%=Resources.LanguageFile.NABDCHOOSEOPTION %>
                    <!-- Side Support Menu -->
                    <ul class="questions-list" style="padding-top:10%;">
                        <li class="active"><a href="http://mashaweeruae.qa.nabdsys.com/customerportal/CustomerKnowledgeBase/Search"
                            target="portal"><%=Resources.LanguageFile.NABDKNOWLEDGEBASE %></a></li>
                        <li><a href="http://mashaweeruae.qa.nabdsys.com/customerportal/Complaint/ComplaintRequestMember"
                            target="portal"><%=Resources.LanguageFile.NABDSUBMITCASE %></a></li>
                        <li><a href="http://mashaweeruae.qa.nabdsys.com/customerportal/ComplaintTracking/Index"
                            target="portal"><%=Resources.LanguageFile.NABDTRACK %></a></li>
                        <li><a title="Live Chat " href="http://mashaweeruae.qa.nabdsys.com/customerportal/chatcustomerportal/index"
                            target="portal"><%=Resources.LanguageFile.NABDCHAT %></a></li>
                        <li><a href="ContactUs.aspx"><%=Resources.LanguageFile.MENU_Contact %></a></li>
                    </ul>
                    <br>
                </div>
                <div style="width: 75%; min-height:800px" class="check-group">
                <iframe src="http://mashaweeruae.qa.nabdsys.com/customerportal/CustomerKnowledgeBase/Search" name="portal" style="width:100%; height:100%; min-height:800px"
                    allowfullscreen="" frameborder="0"></iframe>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
</asp:Content>
