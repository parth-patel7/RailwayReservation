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
<title>Sales Report</title>
</head>
<body>

<div class = "content">
<div class = "title">   <h1 align = "center">Sales Report</h1>    </div>
<%
	try {
		
		String month = request.getParameter("monthSearch");
		String year = request.getParameter("yearSearch");
		
		out.println("<h3>Sales Report For: "+month+", "+year+"</h3>");
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("SELECT res_number,total_fare,date FROM cs336Project.Reservation WHERE MONTH(date)= '"+month+"' AND YEAR(date)= '"+year+"'");
	    if (rs.next()) {
	    	out.println("<table>");
		    out.println("<tr>");
		    out.println("<th>Reservation Number</th>");
		    out.println("<th>Fare amount</th>");
		    out.println("<th>Date</th>");
		    out.println("</tr>");
			out.println("<tr>");
			out.println("<td>"+rs.getInt("res_number")+"</td>");
		    out.println("<td>$"+rs.getInt("total_fare")+"</td>");
		    out.println("<td>"+rs.getString("date")+"</td>");
		    out.println("</tr>");
	    	while(rs.next()){
				int resNum = rs.getInt("res_number");
				int fare = rs.getInt("total_fare");
				String date = rs.getString("date");
				out.println("<tr>");
				out.println("<td>"+resNum+"</td>");
			    out.println("<td>$"+fare+"</td>");
			    out.println("<td>"+date+"</td>");
			    out.println("</tr>");
		    }
	    	out.println("</table>");
	    	out.println("<br>");
	    	out.println("<h4><a href='adminWindow.jsp'>go back to Admin Page</a></h4>");
	    } else {
	    	
	    	out.println("<h5>No Sales for this month.</h5>");
	    	out.println("<br>");
	    	out.println("<h4><a style  = align:center href='adminWindow.jsp'>go back to Admin Page</a></h4>");
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