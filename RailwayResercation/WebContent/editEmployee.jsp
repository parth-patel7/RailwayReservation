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

<script type = "text/javascript">
function validateEmpDetails(){
	var fname = document.getElementById('firstName').value;
	var lname = document.getElementById('lastName').value;
	var ssn = document.getElementById('ssn').value;
	var position = document.getElementById('position').value;
	var phone = document.getElementById('phone').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	
	if(fname.trim() == "" || lname.trim() == "" || ssn.trim() == "" || phone.trim() == "" || username.trim() == "" || password.trim() == ""){
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
	
	if(ssn.length != 9){
		alert("Please insert in 9 digit long ssn.")
		return false;
	}
	
	
	if(!isInt(ssn)){
		alert("Please user number for SSN.")
		return false;
	}
	if(!isInt(phone)){
		alert("Please user number for Phone.")
		return false;
	}
	
	return true;
	
}

function isInt(s) {
    return !/\D/.test(s);
}

</script>

<title>Edit Employee</title>
</head>
<body>
<div class = "title">   <h1 align = "center">Edit Employee</h1>    </div>
<%
	
		String username = request.getParameter("emp_user").trim();
		String cr = "Customer Rep";
		//out.print(username);
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("select e.ssn as ssn, p.phone as phone, p.first as first, p.last as last,p.address as address,p.city as city,p.state as state,a.password as pass from Employee e inner join Person p on e.phoneEM = p.phone inner join Account a on e.emp_username = a.username where e.emp_username = '"+ username+"'");
		    rs.next();
		    out.println("<div class = grid>");
		        %> 
    <div class = "grid">
    <form action = "insertEmpDetails.jsp" method = "POST" onsubmit = "return validateCusDetails()" >
	
			First Name:<span class = "required">*</span>
			<input type = "text" id = "firstName" name = "firstName" value  = "<%= rs.getString("first") %>"required>
		
			Last Name:<span class = "required">*</span>
			<input type = "text" id = "lastName" name = "lastName" value  = "<%= rs.getString("last") %>" required><br>
		
			SSN:<span class = "required">*</span>
			<input type = "text" id = "ssn" name = "ssn" value  = "<%= rs.getString("ssn") %>"required>
		
			Address:<input type = "text" name = "address" value  = "<%= rs.getString("address") %>"><br>
		
			City:<input type = "text" id = "city" name = "city" value  = "<%= rs.getString("city") %>">
		
			State:<input type = "text" id = "state" name = "state" value  = "<%= rs.getString("state") %>"><br>
		
			Phone no:<span class = "required">*</span> +1
			<input type = "text" id = "phone" name = "phone" value  = "<%= rs.getString("phone") %>" required><br>
		
			Username:<span class = "required">*</span>
			<input type = "text" id = "username" name = "username" value  = "<%= username%>" required><br>
		
			Password:<span class = "required">*</span>
			<input type = "text" id = "password" name = "password" value  = "<%= rs.getString("pass") %>"required><br>
			<input type = hidden id = og_username name = og_username value ="<%= username%>">
			<input type = hidden id = addOredit name = addOredit value = 1>
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