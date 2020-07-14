<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>

	<title>Cancellation</title>
	</head>
											  <!-- // Page created by: Syed Hussain (sh1189) -->	
	<body>
	<%
		String date = request.getParameter("cancel_date");
		String seatNum = request.getParameter("seatNum");
		String resNum = request.getParameter("rNum");
		String tNum = request.getParameter("tNum");
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    Statement st = con.createStatement();
	    Statement st2 = con.createStatement();
	    Statement st3 = con.createStatement();
	    

	    ResultSet rs;
	    ResultSet rs2;
	    ResultSet rs3;
	    //take in and check user inputs
	    rs = st.executeQuery("select * from Reservation where res_number='" + resNum + "'");
	    rs2 = st2.executeQuery("select * from Reservation where seat_number='" + seatNum + "'");
	    rs3 = st3.executeQuery("select * from Reservation where date='" + date + "'");

	    // check all statements and delete from all the tables
	    if(rs.next() && rs2.next() && rs3.next()){
	    	st3.executeUpdate("delete from Preference where (seat_number,TID) in (("+seatNum+","+tNum+"))");
		    out.println("<br>");
	    	out.println("Cancellation Successful");
		    out.println("<br>");
		    out.println("<a href='success.jsp'>Go back To Main Page</a>");	
	    }else{
			out.println("Please enter valid number");
		    out.println("<br>");
		    out.println("<a href='cencelRes.jsp'>Go back</a>");
	    }
	    
	}catch (SQLException e) {
 			out.print(e);
 			
	}catch (Exception s){
		out.print(s);
	}
	
	
	
	
	
	
	
	%>

	</body>
</html>