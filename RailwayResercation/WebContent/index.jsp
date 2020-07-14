<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
      <link rel="stylesheet" href="styles.css">
      <script type = "text/javascript">
      	function validate(){
      		//alert("Validate");
      		var u = document.forms["login"]["username"].value;
      		var p = document.forms["login"]["password"].value;
      		if(u == null || u == "" || p == null || p == ""){
      			alert("Please enter correct Info.");
      			return false;
      		}else{
      			//alert("worked");
      			return true;
      		}
      	}
      </script>
   </head>
   
   
   <body class = "content">
   	 
	 <div class ="container">   
	 <h1 align = "center"><b> Login </b></h1>	 
     <form name = "login" action="displayLoginDetails.jsp" method="POST" onsubmit = "return validate()">
       Username:<input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       
       <input type="submit" value="Login"/>
     </form>
   
     <a href='createAccount.jsp'>Create an Account</a>
     
      </div>
     
   </body>
</html>