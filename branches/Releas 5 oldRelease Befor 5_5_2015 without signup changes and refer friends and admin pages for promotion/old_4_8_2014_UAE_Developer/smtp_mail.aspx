<%@ Import Namespace="System.Web.Mail"%>
<html>
	<head>
		<title>SMTP .NET Mail Test Script</title>
	</head>
	<body>
		<form name="smtp_test" id="smtp_test" method="post" action="smtp_mail.aspx">
			<h3>SMTP Test Email Script</h3>
			To:&nbsp;&nbsp;<input type="text" name="to" />
			<br />
			From:&nbsp;&nbsp;<input type="text" name="from" />
			<br />
			Subject:&nbsp;&nbsp;<input type="text" name="subject" />
			<br />
			<input type="reset" name="reset" value="Reset Form" />&nbsp;&nbsp;<input type="submit" name="submit" value="Send Email" />
		</form>
		<%
			Dim MailTo
			Dim MailFrom
			Dim MailSubject
			Dim i
			i = 1
			MailTo = Request.Form("to")
			MailFrom = Request.Form("from")
			MailSubject = Request.Form("subject")
			If MailTo <> "" Then
				Dim objMail As New System.Web.Mail.MailMessage()
				objMail.From = MailFrom
				objMail.To = MailTo
				objMail.Subject = MailSubject
				objMail.BodyFormat = MailFormat.Html
				objMail.Priority = MailPriority.High
				objMail.Body = "SMTP mail works!"
				System.Web.Mail.SmtpMail.SmtpServer = "relay-hosting.secureserver.net"
				System.Web.Mail.SmtpMail.Send(objMail)
				objMail = Nothing
			End If
		%>
	</body>
</html>