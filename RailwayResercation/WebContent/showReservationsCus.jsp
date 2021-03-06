<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<!-- // Page created by: Smeet Shah (sps224) -->
<head>
<style>

.title{
	background-color:#87AFC7;
	color:white; 
	float: center;
	clear:none;
	width: 100%;
	margin: auto;
}

.content{
 	width: auto;
  	max-width: 600px;
  	margin: auto;
 	padding: 16px;
 	clear: both;
}

.content {
 	width: auto;
 	border: 1px solid #ccc;
  	padding: 12px 20px;
  	align: center;
 	margin: auto;
 	box-sizing: border-box;
  	font-size: 15px;
  	text-align: center;
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

h4{
	text-align: center;
}

</style>
<meta charset="UTF-8">
<title>Reservation Cus</title>
</head>
<body>
<div class = "content">
<div class = "title">   <h1 align = "center">Reservations by Username</h1>    </div>
<%
	//Doing Just first and last name causes problem when there are multiple people in person table with same name since its not a primary key.
	try {
		
		String user = request.getParameter("cusUName");
		
		out.println("<h3>Reservations For: "+user+"</h3>");
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    
	    Statement check = con.createStatement();
	    ResultSet helpC = check.executeQuery("select * from Customer where cus_username = '"+user+"'");
	    
	    if (helpC.next()) {
	    	Statement st1 = con.createStatement();
		    ResultSet rs1;
		    rs1 = st1.executeQuery("select r.res_number, r.total_fare, r.date from Reservation r, (select res_numberBOOKS from Books where usernameBOOKS = '"+user+"')as t1 where r.res_number = t1.res_numberBOOKS");
	    	if(rs1.next()){
	    		out.println("<table>");
			    out.println("<tr>");
			    out.println("<th>Reservation Number</th>");
			    out.println("<th>Fare amount</th>");
			    out.println("<th>Date</th>");
			    out.println("</tr>");
				out.println("<tr>");
				out.println("<td>"+rs1.getInt("res_number")+"</td>");
			    out.println("<td>$"+rs1.getInt("total_fare")+"</td>");
			    out.println("<td>"+rs1.getString("date")+"</td>");
			    out.println("</tr>");
		    	while(rs1.next()){
					int resNum = rs1.getInt("res_number");
					int fare = rs1.getInt("total_fare");
					String date = rs1.getString("date");
					out.println("<tr>");
					out.println("<td>"+resNum+"</td>");
				    out.println("<td>$"+fare+"</td>");
				    out.println("<td>"+date+"</td>");
				    out.println("</tr>");
			    }
		    	out.println("</table>");
		    	out.println("<br>");
		    	out.println("<h4><a href='adminWindow.jsp'>go back to Admin Page</a></h4>");
	    	}else{
	    		out.println("<h5>No Reservation has been made for the folllowing User </h5>");
		    	out.println("<br>");
		    	out.println("<h4><a style  = align:center href='adminWindow.jsp'>Try Again</a></h4>");
	    	}
	    } else {
	    	
	    	out.println("<h5>Please enter in correct username.</h5>");
	    	out.println("<br>");
	    	out.println("<h4><a style  = align:center href='adminWindow.jsp'>Try Again</a></h4>");
	    }
	}catch (SQLException e) {
				out.print(e.getStackTrace());
				
	}catch (Exception s){
		out.print(s);
	}
%>
</div>
</body>
</html>