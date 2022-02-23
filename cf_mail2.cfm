
<p> 

<form action = "cf_mailsend.cfm" method="POST" enctype="multipart/form-data"> 
<pre> 
TO: <input type = "Text" value="rishiba.pp.niitclt@gmail.com" name = "MailTo"> 
FROM: <input type = "Text" value="jinutomy17@gmail.com" name = "MailFrom"> 
SUBJECT: <input type = "Text" value="testmail" name = "Subject"> 
ATTACHMENT: <input type = "file"  name = "FiletoUpload"> 
<hr> 
MESSAGE BODY: 
<textarea name ="body" cols="40" rows="5" wrap="virtual">test mail coldfusion with attachment</textarea> 
</pre> 
<!--- Establish required fields. ---> 
<input type = "hidden" name = "MailTo_required" value = "You must enter a recipient"> 
<input type = "hidden" name = "MailFrom_required" value = "You must enter a sender"> 
<input type = "hidden" name = "Subject_required" value = "You must enter a subject"> 
<input type = "hidden" name = "Body_required" value = "You must enter some text"> 
<p><input type = "Submit" name = ""></p> 
</p> 
</form>