<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Registration</title>
      
      <link rel="stylesheet" href="styles.css">     
      
      <script type = "text/javascript">
      function validateCusDetails(){
  		var fname = document.getElementById('cfirstName').value;
  		var lname = document.getElementById('clastName').value;
  		var email = document.getElementById('email').value;
  		var phone = document.getElementById('cphone').value;
  		var username = document.getElementById('cusername').value;
  		var password = document.getElementById('cpassword').value;
  		
  		if(fname == " " || lname == " " || email == "" || phone == "" || phone.length != 10 || username == "" || password == ""){
  			alert("Please fill in the required * fields.");
  			return false;
  		}
  		
  		if(isInt(phone)){
  			return true;
  		}
  		alert("Please insert in correct number for Phone.")
  		return false;
  		
  		}
      </script>
   </head>
   <body class = "content">		
 	 
   	 <div class = "container">
   	 <h1 align = "center"><b> Create an Account </b></h1>
     <form action = "insertAccountDetails.jsp" method = "POST" onsubmit = "return validateCusDetails()">
	
			First Name:<span class = "required">*</span>
			<input type = "text" id = "cfirstName" name = "cfirstName" required>
		
			Last Name:<span class = "required">*</span>
			<input type = "text" id = "clastName" name = "clastName" required><br>
		
			Email:<span class = "required">*</span>
			<input type = "text" id = "email" name = "email" required>
		
			Address:<input type = "text" name = "caddress"><br>
		
			City:<input type = "text" id = "ccity" name = "ccity">
		
			State:<input type = "text" id = "cstate" name = "cstate"><br>
		
			Phone no:<span class = "required">*</span> +1
			<input type = "text" id = "cphone" name = "cphone" required><br>
		
			Username:<span class = "required">*</span>
			<input type = "text" id = "cusername" name = "cusername" required><br>
		
			Password:<span class = "required">*</span>
			<input type = "text" id = "cpassword" name = "cpassword" required><br>
			<input type = "submit" value = "Create Account">
		</form>
     <a href='index.jsp'>Go back to Login</a>
     </div>
   </body>
</html>