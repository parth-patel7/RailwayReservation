<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
<!-- // Page created by: Smeet Shah (sps224) -->	
<head>
<style>

body, html {
  	height: 100%;
  	max-width: 600px;
  	margin: auto;
  	font-family: Arial;
}

.grid {
	display: grid;
  	grid-template-columns: 1fr;
  	width: auto;
  	max-width: 540px;
  	margin: auto;
 	padding: 16px;
 	clear: both;
 	border: 1px solid;
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

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2;}

tr:hover {background-color:#ddd;}

th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #87AFC7;
  color: white;
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

h3{
	text-align: center;
}

.required {
	color : red;
}

</style>

<script type = "text/javascript">
	
	function validateDate(month, year){
		if(month > 0 && month < 13){
			if(year > 0 && year < 10000){
				return true;
			}
		}
		alert("Please enter in correct month/year!");
		return false;
	}
	
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
<title>Admin Window</title>
</head>
<body>

<div class = "grid">
	<div class = "title">   <h1 align = "center">ADMIN WINDOW</h1>    </div>
	<div id = "salesReport"> 
	
		<h3> Sales Report</h3>
	
		<form  action ="salesReport.jsp" method = "POST" onsubmit= "return validateDate(document.getElementById('monthSearch').value, document.getElementById('yearSearch').value)">
			<label for ="monthSearch">Enter Month:</label>
			<input type ="text" id = "monthSearch" name ="monthSearch" placeholder ="MM">
			<label for ="yearSearch">Enter Year:</label>
			<input type ="text" id ="yearSearch" name ="yearSearch" placeholder ="YYYY">
			<input type ="submit" value ="Submit">
		</form>
		<br>
	
		<h3 id = "totalSale"></h3>
	</div>
	
	
	<div id = "addEmployee" > 
	<h3>Add Employee</h3>
	
	<form action = "insertEmpDetails.jsp" method = "POST" onsubmit = "return validateEmpDetails()">
	
		First Name:<span class = "required">*</span>
		<input type = "text" id = "firstName" name = "firstName" required>
	
		Last Name:<span class = "required">*</span>
		<input type = "text" id = "lastName" name = "lastName" required><br>
	
		SSN:<span class = "required">*</span>
		<input type = "text" id = "ssn" name = "ssn" required>
	
		Address:<input type = "text" name = "address"><br>
	
		City:<input type = "text" id = "city" name = "city">
	
		State:<input type = "text" id = "state" name = "state"><br>
	
		Phone no:<span class = "required">*</span> +1
		<input type = "text" id = "phone" name = "phone" required><br>
	
		Username:<span class = "required">*</span>
		<input type = "text" id = "username" name = "username" required><br>
	
		Password:<span class = "required">*</span>
		<input type = "text" id = "password" name = "password" required><br>
		<input type = hidden id = addOredit name = addOredit value = 0>
		<input type = "submit" value = "Add Employee">
	</form>
	
	</div>
	
	<div id = "addEditEmployee" >    
	<h3>Edit Employee</h3>
		<%
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select emp_username from Employee where position = 'CustomerRep'");
	    	if (rs.next()) {
	    		out.println("<form >");
	    		out.println("<select name = "+ "emp_user" +" id = "+"emp_user"+">");
				out.println("<option value = " + rs.getString("emp_username")+">"+ rs.getString("emp_username")+"</option>");
	    		while(rs.next()){
	    			out.println("<option value = " + rs.getString("emp_username")+">"+ rs.getString("emp_username")+"</option>");
		    	}
	    		out.println("</select>");
	    		//.out.println("<input type = hidden id = empOrcus name = empOrCus value = 0>");
	    		out.println("<input type = submit value = Edit formaction = editEmployee.jsp>");
	    		out.println("<input type = submit value = Delete formaction = deleteEmployee.jsp>");
		    	out.println("</form>");
	    	}else{
	    		out.println("<h5>*No employees*</h5>");
	    	}
		}catch (SQLException e) {
				out.print(e.getStackTrace());
				
		}catch (Exception s){
		out.print(s);
		}
		
		%>
	
	</div>
	
	<div id = "addCustomer" >    
	<h3>Add Customer</h3>
		<form action = "insertCusDetails.jsp" method = "POST" onsubmit = "return validateCusDetails()">
	
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
			<input type = hidden id = caddOredit name = caddOredit value = 0>
			<input type = "submit" value = "Add Customer">
		</form>
	
	</div>
	
	<div id = "addEditCustomer" >    
	<h3>Edit Customer</h3>
		<%
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select c.cus_username as user from Customer c");
	    	if (rs.next()) {
	    		out.println("<form >");
	    		out.println("<select name = cus_user id = cus_user>");
				out.println("<option value = " + rs.getString("user")+">"+ rs.getString("user")+"</option>");
	    		while(rs.next()){
	    			out.println("<option value = " + rs.getString("user")+">"+ rs.getString("user")+"</option>");
		    	}
	    		out.println("</select>");
	    		//out.println("<input type = hidden id = empOrcus name = empOrCus value = 1>");
	    		out.println("<input type = submit value = Edit formaction = editCustomer.jsp>");
	    		out.println("<input type = submit value = Delete formaction = deleteCustomer.jsp>");
		    	out.println("</form>");
	    	}else{
	    		out.println("<h5>*No Customers*</h5>");
	    	}
		}catch (SQLException e) {
				out.print(e.getStackTrace());
				
		}catch (Exception s){
		out.print(s);
		}
		%>
	
	</div>
	
	<div id = "reservations" >    
		<h3>Reservations</h3>
		<h5>By Transit Line and Train No</h5>
		<%
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select * from TransitLine");
	    	out.println("<form action= showReservations.jsp method = POST>");
	    	if (rs.next()) {
	    		out.println("Transit Line:<select name = transitLine id = transitLine>");
				out.println("<option value = " + rs.getString("TLID")+">"+ rs.getString("name")+"</option>");
	    		while(rs.next()){
	    			out.println("<option value = " + rs.getString("TLID")+">"+ rs.getString("name")+"</option>");
		    	}
	    		out.println("</select>");
	    		
	    		Statement st1 = con.createStatement();
		    	ResultSet rs1;
		    	rs1 = st1.executeQuery("select * from Train");
		    	if(rs1.next()){
		    		out.println("Train No:<select name = train id = train>");
					out.println("<option value = " + rs1.getString("TID")+">#"+ rs1.getString("TID")+", "+rs1.getString("status")+"</option>");
		    		while(rs1.next()){
		    			out.println("<option value = " + rs1.getString("TID")+">#"+ rs1.getString("TID")+", "+rs1.getString("status")+"</option>");
			    	}
		    		out.println("</select>");
		    	}else{
		    		out.println("<h5>*No Trains*</h5>");
		    	}

	    	}else{
	    		out.println("<h5>*No TransitLines*</h5>");
	    	}
	    	out.println("<input type = submit value = Search>");
	    	out.println("</form>");
		}catch (SQLException e) {
				out.print(e.getStackTrace());
				
		}catch (Exception s){
		out.print(s);
		}
		
		%>
		<h5>By Customer</h5>
		<form action = "showReservationsCus.jsp" method = POST>
			Customer Username:
			<input type = text name = cusUName id = cusUName placeholder = "Enter in username" required><br>
			<input type=submit value=Search>
		</form>
	
	</div>
	
	<div id = "bestCustomer" >    
		<h3>Best Customer</h3>
		<%
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select p.first, p.last, c.email, c.cus_username as user, t1.spent from (select b.usernameBOOKS as user, count(b.res_numberBOOKS) as c, sum(r.total_fare) as spent From Books b, Reservation r where r.res_number = b.res_numberBOOKS group by usernameBOOKS order by spent DESC)as t1 inner join Customer c on c.cus_username = t1.user inner join Person p on p.phone = c.phone where t1.c = (select max(t2.c) from (select count(res_numberBOOKS) as c From Books group by usernameBOOKS) as t2)");
	    	out.println("<div>");
	    	out.println("<h4>By Most Reservations</h4>");
	    	if (rs.next()) {
	    		out.println("Name: "+ rs.getString("first")+", "+rs.getString("last")+"<br>");
	    		out.println("Email: "+ rs.getString("email")+"<br>");
	    		out.println("Username: "+ rs.getString("user")+"<br>");
	    		out.println("Total Money Spent: $"+ rs.getString("spent")+"<br>");
	    	}else{
	    		out.println("<h5>*No Reservation*</h5>");
	    	}
	    	out.println("</div>");
	    	
		}catch (SQLException e) {
				out.print(e.getStackTrace());
				
		}catch (Exception s){
		out.print(s);
		}
		
		%>	
	</div>
	
	<div id = "bestTransitLine" >    
		<h3>Top 5 TransitLine</h3>
		<%
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select t.TLID, t.name, count(t.TLID) as total from Reservation r, TransitLine t where r.origin between t.originSID and t.destSID group by t.TLID order by total DESC");
	    	out.println("<div>");
	    	out.println("<h4>By Reservations</h4>");
	    	if (rs.next()) {
	    		out.println("<table>");
	    		int i = 1;
			    out.println("<tr>");
			    out.println("<th>Rank</th>");
			    out.println("<th>Transit Line No.</th>");
			    out.println("<th>Transit Line Name</th>");
			    out.println("</tr>");
				out.println("<tr>");
				out.println("<td>"+i+".</td>");
				out.println("<td> #"+rs.getInt("TLID")+"</td>");
			    out.println("<td>"+rs.getString("name")+"</td>");
			    out.println("</tr>");
			    i++;
			    int count = 0;
		    	while(rs.next() && count <4){
					int tlid = rs.getInt("TLID");
					String name = rs.getString("name");
					out.println("<tr>");
					out.println("<td>"+i+".</td>");
					out.println("<td>#"+tlid+"</td>");
				    out.println("<td>"+name+"</td>");
				    out.println("</tr>");
				    i++;
				    count++;
			    }
		    	out.println("</table>");
	    	}else{
	    		out.println("<h5>*No Transit Line in database*</h5>");
	    	}
	    	out.println("</div>");
	    	con.close();
		}catch (SQLException e) {
				out.print(e.getStackTrace());
				
		}catch (Exception s){
		out.print(s);
		}
		
		%>	
	</div>
	
	<div id = "revenue" >    
		<h3>Revenue</h3>
		<form method = get>
			<select name = "revBy" id = "revBy">
				<option value = ""> None</option>
				<option value = "TransitLine">Transit Line</option>
				<option value = "DestinationCity">Destination City</option>
				<option value = "CustomerName">Customer Name</option>
			</select>
			<input type=submit value = "Search">
		</form>
		<%
		try {
			String what = request.getParameter("revBy");
			if (what != null){
				Class.forName("com.mysql.jdbc.Driver");
		    	Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    	
		    	
		    	
		    	if(what.equals("TransitLine")){
		    		Statement st = con.createStatement();
		    		ResultSet rs;
		    		rs = st.executeQuery("select t.TLID, t.name, sum(r.total_fare) as total from Reservation r, TransitLine t where r.origin between t.originSID and t.destSID group by t.TLID order by total DESC");   		
		    		if(rs.next()){
		    	    	out.println("<h4>By Transit Line</h4>");
		    	    	out.println("<table>");
			    		
					    out.println("<tr>");
					    out.println("<th>Transit Line No.</th>");
					    out.println("<th>Transit Line Name</th>");
					    out.println("<th>Revenue</th>");
					    out.println("</tr>");
						out.println("<tr>");
						out.println("<td> #"+rs.getInt("TLID")+"</td>");
					    out.println("<td>"+rs.getString("name")+"</td>");
					    out.println("<td>$"+rs.getString("total")+".</td>");
					    out.println("</tr>");
				    	while(rs.next()){
							out.println("<tr>");
							out.println("<td> #"+rs.getInt("TLID")+"</td>");
						    out.println("<td>"+rs.getString("name")+"</td>");
						    out.println("<td>$"+rs.getString("total")+".</td>");
						    out.println("</tr>");
					    }
				    	out.println("</table>");
		    		}else{
		    			out.println("*No revenue exist in database*");
		    		}
		    		rs.close();
		    		st.close();
		    	}else if(what.equals("DestinationCity")){
		    		Statement st1 = con.createStatement();
		    		ResultSet rs1;
		    		rs1 = st1.executeQuery("select s.city, s.state, sum(r.total_fare) as total from Reservation r left outer join Station s on r.destination = s.SID group by r.destination order by total DESC");
		    		if(rs1.next()){
		    	    	out.println("<h4>By Destination City</h4>");
		    	    	out.println("<table>");
					    out.println("<tr>");
					    out.println("<th>City</th>");
					    out.println("<th>State</th>");
					    out.println("<th>Revenue</th>");
					    out.println("</tr>");
						out.println("<tr>");
						out.println("<td> "+rs1.getString("city")+"</td>");
					    out.println("<td>"+rs1.getString("state")+"</td>");
					    out.println("<td>$"+rs1.getString("total")+"</td>");
					    out.println("</tr>");
				    	while(rs1.next()){
							out.println("<tr>");
							out.println("<td> "+rs1.getString("city")+"</td>");
						    out.println("<td>"+rs1.getString("state")+"</td>");
						    out.println("<td>$"+rs1.getString("total")+"</td>");
						    out.println("</tr>");
					    }
				    	out.println("</table>");
		    		}else{
		    			out.println("*No revenue exists in the database*");
		    		}
		    	}else if(what.equals("CustomerName")){
		    		Statement st2 = con.createStatement();
		    		ResultSet rs2;
		    		rs2 = st2.executeQuery("select p.first, p.last, t1.spent from (select b.usernameBOOKS as user, count(b.res_numberBOOKS) as c, sum(r.total_fare) as spent From Books b, Reservation r where r.res_number = b.res_numberBOOKS group by usernameBOOKS order by spent DESC)as t1 inner join Customer c on c.cus_username = t1.user inner join Person p on p.phone = c.phone");
		    		if(rs2.next()){
		    	    	out.println("<h4>By Customer</h4>");
		    	    	out.println("<table>");
					    out.println("<tr>");
					    out.println("<th>First Name</th>");
					    out.println("<th>Last Name</th>");
					    out.println("<th>Revenue</th>");
					    out.println("</tr>");
						out.println("<tr>");
						out.println("<td> "+rs2.getString("first")+"</td>");
					    out.println("<td>"+rs2.getString("last")+"</td>");
					    out.println("<td>$"+rs2.getString("spent")+"</td>");
					    out.println("</tr>");
				    	while(rs2.next()){
							out.println("<tr>");
							out.println("<td> "+rs2.getString("first")+"</td>");
						    out.println("<td>"+rs2.getString("last")+"</td>");
						    out.println("<td>$"+rs2.getString("spent")+"</td>");
						    out.println("</tr>");
					    }
				    	out.println("</table>");
		    		}else{
		    			out.println("*No revenue exists in the database*");
		    		}
		    	}
			}
		}catch (SQLException e) {
				e.printStackTrace();
				out.print(e.getStackTrace());
					
		}catch (Exception s){
				s.printStackTrace();
				out.print(s);
		}
		
		%>	
	</div>
	
	<h4><a style  = align:center href='logout.jsp'>Log out</a></h4>
</div>

</body>
</html>