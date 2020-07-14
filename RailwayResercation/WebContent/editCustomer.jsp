<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<!-- // Page created by: Smeet Shah (sps224) -->
<head>
<meta charset="ISO-8859-1">
<style>

body, html {
  	height: 100%;
  	margin: 0;
  	font-family: Arial;
}

.grid {
  	width: auto;
  	max-width: 400px;
  	margin: auto;
 	padding: 16px;
 	clear: both;
}

.grid input[type=text], input[type=password], select, table{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-size: 20px;
}


.grid input[type=submit], button  {
  background-color: #87AFC7;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  font-size: 20px;
}


.grid input[type=submit]:hover , button:hover{
  opacity: 0.8;
}

.title{
	background-color:#87AFC7;
	color:white; 
	float: center;
	clear:none;
	width: 100%;
	margin: auto;
}

.btn:hover{
	opacity: 0.8;
}

h1 {
    padding: 30px;
    margin:0;
}

.required {
	color : red;
}

</style>

<title>Edit Customer</title>
</head>
<body>
<script type = "text/javascript">

function validateCusDetails(){
	var fname = document.getElementById('cfirstName').value;
	var lname = document.getElementById('clastName').value;
	var email = document.getElementById('email').value;
	var phone = document.getElementById('cphone').value;
	var username = document.getElementById('cusername').value;
	var password = document.getElementById('cpassword').value;
	
	if(fname.trim() == "" || lname.trim() == "" || email.trim() == "" || phone.trim() == "" || username.trim() == "" || password.trim() == ""){
		alert("Please fill in the required * fields.");
		return false;
	}
	
	if(username.lastIndexOf(' ') == (username.length - 1)){
		alert("Please remove the last space in username");
		return false;
	}
	
	if(username.indexOf(' ') >= 0 ){
		alert("Please enter in usrname without space");
		return false;
	}
	
	if(phone.length != 10){
		alert("Please insert in 10 digit long Phone number.")
		return false;
	}
	
	if(!isInt(phone)){
		alert("Please use numbers for Phone.")
		return false;
	}
	
	return true;
}

function isInt(s) {
    return !/\D/.test(s);
}
</script>
<div class = "title">   <h1 align = "center">Edit Customer</h1>    </div>
<%

String cusername = request.getParameter("cus_user").trim();
//out.println(cusername);
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	Statement sts = con.createStatement();
    ResultSet rs1;
    rs1 = sts.executeQuery("select c.email as email, p.phone as phone, p.first as first, p.last as last,p.address as address,p.city as city,p.state as state,a.password as pass from Customer c inner join Person p on c.phone = p.phone inner join Account a on c.cus_username = a.username where c.cus_username = '"+ cusername+"'");
    rs1.next();
    %> 
    <div class = "grid">
    <form action = "insertCusDetails.jsp" method = "POST" onsubmit = "return validateCusDetails()" >
	
			First Name:<span class = "required">*</span>
			<input type = "text" id = "cfirstName" name = "cfirstName" value  = "<%= rs1.getString("first") %>"required>
		
			Last Name:<span class = "required">*</span>
			<input type = "text" id = "clastName" name = "clastName" value  = "<%= rs1.getString("last") %>" required><br>
		
			Email:<span class = "required">*</span>
			<input type = "text" id = "email" name = "email" value  = "<%= rs1.getString("email") %>"required>
		
			Address:<input type = "text" name = "caddress" value  = "<%= rs1.getString("address") %>"><br>
		
			City:<input type = "text" id = "ccity" name = "ccity" value  = "<%= rs1.getString("city") %>">
		
			State:<input type = "text" id = "cstate" name = "cstate" value  = "<%= rs1.getString("state") %>"><br>
		
			Phone no:<span class = "required">*</span> +1
			<input type = "text" id = "cphone" name = "cphone" value  = "<%= rs1.getString("phone") %>" required><br>
		
			Username:<span class = "required">*</span>
			<input type = "text" id = "cusername" name = "cusername" value  = "<%= cusername%>" required><br>
		
			Password:<span class = "required">*</span>
			<input type = "text" id = "cpassword" name = "cpassword" value  = "<%= rs1.getString("pass") %>"required><br>
			<input type = hidden id = og_user name = og_user value ="<%= cusername%>">
			<input type = hidden id = caddOredit name = caddOredit value = 1>
			<input type = "submit" value = "Save Changes">
			<h3><a href=adminWindow.jsp>Go back to Admin Page</a></h3>
		</form>
    
    </div>   
<%     

    
}catch (SQLException e) {
e.printStackTrace();
out.print(e.getStackTrace());
}catch (Exception s){
out.print(s);
}




%>


</body>
</html>