<?php 
require 'PHPMailerAutoload.php';
$errors = '';
$myemail = 'info@mashaweeruae.com';//<-----Put Your email address here.
if(empty($_POST['name'])  || 
   empty($_POST['email']) || 
   empty($_POST['message']))
{
    $errors .= "\n Error: all fields are required";
}

$name = $_POST['name']; 
$email_address = $_POST['email']; 
$message = $_POST['message']; 

if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i", 
$email_address))
{
    $errors .= "\n Error: Invalid email address";
}

if( empty($errors))
{
	$to = $myemail; 
	$email_subject = "Contact form submission: $name";
	
	$email_body = '
<html>
<head>
</head>
<body>
  <p>You have received a new message. Here are the details:</p><br>
  <strong>Name:</strong> ';
  $email_body .= $name;
  $email_body .= '<br>
  <strong>Email Address:</strong> ';
  $email_body .= $email_address;
  $email_body .='<br>
  <strong>Message:</strong> ';
  $email_body .= $message;
  '<br>
</body>
</html>
';
	
	// $headers  = 'MIME-Version: 1.0' . "\r\n";
	// $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	// $headers .= "From: $myemail\n"; 
	// $headers .= "Reply-To: $email_address";
	
	// mail($to,$email_subject,$email_body,$headers);
	// //redirect to the 'thank you' page

	// header('Location: thankyou.aspx');


	$mail = new PHPMailer;

	$mail->isSMTP();                                      // Set mailer to use SMTP
	$mail->Host = 'smtp.gmail.com';                       // Specify main and backup server
	$mail->SMTPAuth = true;                               // Enable SMTP authentication
	$mail->Username = 'mashaweeruae@gmail.com';           // SMTP username
	$mail->Password = 'M@sh2012';                         // SMTP password
	$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted
	$mail->Port = 587;                                    //Set the SMTP port number - 587 for authenticated TLS

	$mail->From = $myemail;
	$mail->FromName = 'Mashaweer Contact Us';
	$mail->addReplyTo($email_address);  //Set an alternative reply-to address
	$mail->addAddress($to);                               // Name is optional

	$mail->isHTML(true);                                  // Set email format to HTML

	$mail->Subject = $email_subject;
	$mail->Body    = $email_body;
	$mail->AltBody = $email_body;

	if(!$mail->send()) {
        $errors .= "—FAILED TO SEND EMAIL FROM {".$_SERVER['HTTP_HOST']."}.";
        $errors .= '/n With Mailer Error: ' . $mail->ErrorInfo;
	}
	else {
		
		//mail($to,$email_subject,$email_body,$headers);

		//redirect to the 'thank you' page
        
		header('Location: thankyou.aspx');
	}

} 

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
	<title>Contact form handler</title>
</head>

<body>
<!-- This page is displayed only if there is some error -->
<?php
echo nl2br($errors);
?>


</body>
</html>

