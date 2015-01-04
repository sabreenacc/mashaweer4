<?php 
require 'PHPMailerAutoload.php';
$errors = '';
$myemail = 'onlineorders@mashaweeruae.com';//<-----Put Your email address here.
/*if(empty($_POST['customerName'])  || 
   empty($_POST['contactPerson']) || 
   empty($_POST['emailAddress']) ||
   empty($_POST['phoneNumber']) || 
   empty($_POST['collCustomerName']) || 
   empty($_POST['collContactPerson']) || 
   empty($_POST['collemailAddress']) || 
   empty($_POST['collphoneNumber']) || 
   empty($_POST['collAddress']) || 
   empty($_POST['collLandmark']) || 
	 empty($_POST['collDwnCity']) || 
   //empty($_POST['collDwnArea']) ||
   empty($_POST['collInstruction']) || 
   empty($_POST['collShip']) || 
	empty($_POST['delCustomerName']) || 
   empty($_POST['delContactPerson']) || 
   empty($_POST['delEmailAddress']) || 
   empty($_POST['delPhoneNumber']) || 
    empty($_POST['delAddress']) || 
   empty($_POST['delLandmark']) ||
  empty($_POST['delDwnCity']) ||
  // empty($_POST['delDwnArea']) ||
   empty($_POST['delInstruction']) || 
   empty($_POST['payLoc']))
{
    $errors .= "\n Error: all fields are required";
}
*/
$CustomerName = $_POST['customerName']; 
$ContactPerson = $_POST['contactPerson']; 
$EmailAddress = $_POST['emailAddress'];
$PhoneNumber = $_POST['phoneNumber'];
$CollectionCustomerName = $_POST['collCustomerName'];
$CollectionContactPerson = $_POST['collContactPerson'];
$CollectionEmailAddress = $_POST['collemailAddress'];
$CollectionPhoneNumber = $_POST['collphoneNumber'];
$CollectionAddress = $_POST['collAddress'];
$CollectionLandmark = $_POST['collLandmark'];
$CollectionCity = $_POST['City_From'];
$CollectionArea = $_POST['Area_From'];
$CollectionInstruction = $_POST['collInstruction'];
$CollectionShipmentSize = $_POST['collShip'];
$DeliveryCustomerName = $_POST['delCustomerName'];
$DeliveryContactPerson = $_POST['delContactPerson'];
$DeliveryEmailAddress = $_POST['delEmailAddress'];
$DeliveryPhoneNumber = $_POST['delPhoneNumber'];
$DeliveryAddress = $_POST['delAddress'];
$DeliveryLandmark = $_POST['delLandmark'];
$DeliveryCity = $_POST['City_To'];
$DeliveryArea = $_POST['Area_To'];
$DeliveryInstruction = $_POST['delInstruction'];
$PaymentCollection = $_POST['payLoc'];



if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i", 
$EmailAddress))
{
    $errors .= "\n Error: Invalid email address";
}

if( empty($errors))
{
$to = $myemail; 
	$email_subject = "New Order for Mashaweer";
	
	$email_body = '
<html>
<head>
</head>
<body>
  <div>


   <table border="0" style="width:100%;margin-top:20px">
        <tbody>
            <tr>
                <td height="87" colspan="6" style="color:rgb(141,105,11);min-height:20px;padding-top:6px;font-weight:bold;font-size:16px;padding-left:5px">
                    Customer Details
                </td>
            </tr>
            <tr>
                <td width="230">
                    Customer/Company Name
                </td>
                <td width="6">
                    :
                </td>
                <td width="414">';
		$email_body .= $CustomerName;
		$email_body .=' </td>
                <td width="230">
                    Contact Person
                </td>
                <td width="6">
                    :
                </td>
                <td width="414">';
		$email_body .= $ContactPerson;
		$email_body .= '    </td>
            </tr>
            <tr>
                <td>
                    Email Address
                </td>
                <td>
                    :
                </td>
                <td>
                    <a href="mailto:';	
		$email_body .= $EmailAddress;
		$email_body .='" target="_blank">';
		$email_body .= $EmailAddress;
		$email_body .= '</a>
                </td>
               <td>
                    Phone Number
                </td>
                <td>
                    :
                </td>
                <td>
                    <a href="tel:';	
		$email_body .= $PhoneNumber;
		$email_body .='" target="_blank">';
		$email_body .= $PhoneNumber;
		$email_body .= '</a>
                </td>
            </tr>
			    <tr>
                <td height="87" colspan="3" style="color:rgb(141,105,11);min-height:20px;padding-top:6px;font-weight:bold;font-size:16px;padding-left:5px">
                    Collection Location Details
                </td>
                <td height="87" colspan="3" style="color:rgb(141,105,11);min-height:20px;padding-top:6px;font-weight:bold;font-size:16px;padding-left:5px">
                    Delivery Location Details
                </td>
            </tr>
            <tr>
                <td>
                    Customer/Company Name
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= $CollectionCustomerName;
		$email_body .= '</td>
                <td>
                    Customer/Company Name
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= $DeliveryCustomerName;
		$email_body .= '         </td>
            </tr>
            <tr>
                <td>
                    Contact Person
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= $CollectionContactPerson;
		$email_body .= ' </td>
                <td>
                    Contact Person
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .=$DeliveryContactPerson;
		$email_body .= ' </td>
            </tr>
            <tr>
                <td>
                    Email Address
                </td>
                <td>
                    :
                </td>
                <td>
                    <a href="mailto:';
		$email_body .= $CollectionEmailAddress;
		$email_body .= '" target="_blank">';
		$email_body .= $CollectionEmailAddress;
		$email_body .= '</a>
                </td>
                <td>
                    Email Address
                </td>
                <td>
                    :
                </td>
                <td>
                    <a href="mailto:';	
		$email_body .= $DeliveryEmailAddress;
		$email_body .= '" target="_blank">';
		$email_body .= $DeliveryEmailAddress;
		$email_body .= '</a>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$CollectionPhoneNumber;
		$email_body .= '</td>
                <td>
                    Phone Number
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$DeliveryPhoneNumber;
		$email_body .= '<tr>
                <td>
                    Address
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$CollectionAddress;
		$email_body .= '</td>
                <td>
                    Address
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$DeliveryAddress;
		$email_body .= '</td>
            </tr>
            <tr>
                <td>
                    Nearest Landmark
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$CollectionLandmark;
		$email_body .= '  </td>
                <td>
                    Nearest Landmark
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$DeliveryLandmark;
		$email_body .= '</td>
            </tr>
            <tr>
                <td>
                    City
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$CollectionCity;
		$email_body .= '  </td>
                <td>
                    City
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$DeliveryCity;
		$email_body .= '</td>
            </tr>
            <tr>
                <td>
                    Area
                </td>
                <td>
                    :
                </td>
				<td>';
		$email_body .= 	$CollectionArea;
		$email_body .= '</td>
                <td>
                    Area
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$DeliveryArea;
		$email_body .= '</td>
            </tr>
            <tr>
                <td>
                    Instructions
                </td>
                <td>
                    :
                </td>
                <td>';	
		$email_body .= 	$CollectionInstruction;
		$email_body .= '</td>
                <td>
                    Instructions
                </td>
                <td>
                    :
                </td>
                <td>';	
		$email_body .= 	$DeliveryInstruction;
		$email_body .= '</td>
            </tr>
            <tr>
                <td>
                    Shipment/Parcel weight/size
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$CollectionShipmentSize;	
		$email_body .= '</td>
                <td>
                    Payment Location
                </td>
                <td>
                    :
                </td>
                <td>';
		$email_body .= 	$PaymentCollection;
		$email_body .= '</td>
            </tr>
        </tbody>
    </table>
	<div class="yj6qo"></div><div class="adL">

</div></div>	
</body>
</html>
';
	
	// $headers  = 'MIME-Version: 1.0' . "\r\n";
	// $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	// $headers .= "From: $myemail\n"; 
	// $headers .= "Reply-To: $email_address\n";
	
	

	// if(mail($to,$email_subject,$email_body,$headers))
	// {
           // //mail($to,$email_subject,$email_body,$headers);

	  // //redirect to the 'thank you' page
          
	  // header('Location: thankyouorder.aspx');

	// }
	// else {
         // $errors .= "—FAILED TO SEND EMAIL FROM {".$_SERVER['HTTP_HOST']."}.";
	// }

	
	$mail = new PHPMailer;

	$mail->isSMTP();                                      // Set mailer to use SMTP
	$mail->Host = 'smtp.gmail.com';                       // Specify main and backup server
	$mail->SMTPAuth = true;                               // Enable SMTP authentication
	$mail->Username = 'mashaweeruae@gmail.com';           // SMTP username
	$mail->Password = 'M@sh2012';                         // SMTP password
	$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted
	$mail->Port = 587;                                    //Set the SMTP port number - 587 for authenticated TLS

	$mail->From = $myemail;
	$mail->FromName = 'Mashaweer Order';
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
        
		header('Location: thankyouorder.aspx');
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