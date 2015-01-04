<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="thankyou.aspx.cs" Inherits="thankyou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <%=Resources.LanguageFile.ThankYou %></title>
    <script type="text/javascript">
        $(window).load(function () {
            setTimeout('delayer()', 4000);
        });

        function delayer() {
            window.location = "default.aspx";
        }
    </script>
	
	<% if(Request.QueryString["order"] != null) { %>
	<!-- Facebook Conversion Code for Order Lead -->
	<script>(function() {
	  var _fbq = window._fbq || (window._fbq = []);
	  if (!_fbq.loaded) {
		var fbds = document.createElement('script');
		fbds.async = true;
		fbds.src = '//connect.facebook.net/en_US/fbds.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(fbds, s);
		_fbq.loaded = true;
	  }
	})();
	window._fbq = window._fbq || [];
	window._fbq.push(['track', '6026275505620', {'value':'0.00','currency':'USD'}]);
	</script>
	<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6026275505620&amp;cd[value]=0.00&amp;cd[currency]=USD&amp;noscript=1" /></noscript>
	<!-- Google Code for Order Page Conversion Page -->
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 967140200;
		var google_conversion_language = "en";
		var google_conversion_format = "3";
		var google_conversion_color = "ffffff";
		var google_conversion_label = "-ZaLCNPxs1YQ6MaVzQM";
		var google_remarketing_only = false;
		/* ]]> */	
	</script>
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
	</script>
	<noscript>
		<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/967140200/?label=-ZaLCNPxs1YQ6MaVzQM&amp;guid=ON&amp;script=0"/>
		</div>
	</noscript>
	
	<%  } else { %>
	<!-- Facebook Conversion Code for Contact  Lead -->
	<script>(function() {
	  var _fbq = window._fbq || (window._fbq = []);
	  if (!_fbq.loaded) {
		var fbds = document.createElement('script');
		fbds.async = true;
		fbds.src = '//connect.facebook.net/en_US/fbds.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(fbds, s);
		_fbq.loaded = true;
	  }
	})();
	window._fbq = window._fbq || [];
	window._fbq.push(['track', '6026275171420', {'value':'0.00','currency':'USD'}]);
	</script>
	<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6026275171420&amp;cd[value]=0.00&amp;cd[currency]=USD&amp;noscript=1" /></noscript>
	<!-- Google Code for Contact Us Form Conversion Page -->
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 967140200;
		var google_conversion_language = "en";
		var google_conversion_format = "3";
		var google_conversion_color = "ff9900";
		var google_conversion_label = "1nlNCIuUs1YQ6MaVzQM";
		var google_remarketing_only = false;
		/* ]]> */
	</script>
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
	</script>
	<noscript>
		<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/967140200/?label=1nlNCIuUs1YQ6MaVzQM&amp;guid=ON&amp;script=0"/>
		</div>
	</noscript>
	
	<% } %>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="page-warp">
        <div class="container">
            <div class="content">
                <h3 style="padding-left: 20px; font-family: 'helvetica-regular', sans-serif; font-weight: bold;
                    font-size: x-large;">
                    <%= (Request.QueryString["order"] != null) ? Resources.LanguageFile.THANKYOUORDERMESSAGE : Resources.LanguageFile.THANKYOUCONTACTUSMESSAGE %>
                    <br>
                    <br>
                    <h5 style="padding-left: 20px; font-family: 'helvetica-regular', sans-serif; font-size: large;">
                        *<%=Resources.LanguageFile.REDIRECTMSG %>*</h5>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
