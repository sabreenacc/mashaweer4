<?php
$to = "kimo27eg@gmail.com";
$subject = "Email test from {$_SERVER['HTTP_HOST']}";
$body = "The email test script was successful. Mail is being sent from {$_SERVER['HTTP_HOST']} with no issue.";
$headers = "From: onlineorders@mashaweeruae.com";

if (mail($to,$subject,$body,$headers))
{
   echo "An e-mail was sent to ".$to." with the subject: ".$subject;
}
else
echo "—FAILED TO SEND EMAIL FROM {onlineorders@mashaweeruae.com}.";
?>