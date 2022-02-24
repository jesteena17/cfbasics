<html>
<head>
<title>Sending a simple e-mail</title>
</head>
<body>
<head>
    <title>Sending a simple e-mail</title>
    </head>
    <body>
    
    <h1>Sample e-mail</h1>
    <cfmail
    from="jinutomy17@gmail.com"
    to="rishiba.pp.niitclt@gmail.com"
    subject="Sample e-mail from ColdFusion">

    This is a sample e-mail message to show basic e-mail capability.

    </cfmail>
    The e-mail was sent.
    


<cfscript>

cfmail( 
  subject="Your Order", 
  from="jinutomy17@gmail.com", 
  to="rishiba.pp.niitclt@gmail.com",

  type="HTML"
){
  // body of the email.
  writeOutput( 'Hi there,' );
  writeOutput( 'This mail is sent to confirm that we have received your order.' );
};

</cfscript>
    </body>
    </html> 
