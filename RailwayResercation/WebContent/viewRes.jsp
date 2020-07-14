<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>

	<title>View</title>
	</head>
									 <!-- // Page created by: Syed Hussain (sh1189) -->	
	<body>
	<%
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    Statement st = con.createStatement();
	    Statement st2 = con.createStatement();
	    ResultSet rs;
	    ResultSet rs2;
	    
	    //find the table of all reservation for user
	   	rs = st.executeQuery("select res_numberBooks from Books where usernameBOOKS='" + session.getAttribute("user") + "'");
	   	
	    
	    while(rs.next() ){
	    	
	    	//finds each reservation number
	    	int resNum = rs.getInt("res_numberBOOKS");
	    	
	    	//find the reservation from reservation table
	    	rs2 = st2.executeQuery("select * from Reservation where res_number='" + resNum + "'");
	    	
	    	//get table information
	    	ResultSetMetaData rsmd = rs2.getMetaData();
	    	int columnNum = rsmd.getColumnCount();
	    	int diffRes =1;
		    out.println("RESERVATION");
		    out.println("<br>");
		    out.println("---------------------");
		    out.println("<br>");

	    	while(rs2.next()){
	    		//table for each column information
	    		// Reservation Number / Fare / Date / Seat Number / Origin / Destination / Discount / Trip Type
	    		
	    		for (int i = 1; i<=columnNum;i++){
	    			if(i==1){
	    				out.print("Reservation Number: ");
	    				}
	    			if(i==2){
	    				out.print("Total fare: $");
	    				}
	    			if(i==3){
	    				out.print("Date: ");
	    				}
	    			if(i==4){
	    				out.print("Seat Number: ");
	    				}
	    			if(i==5){
	    				out.print("Origin Station Number: ");
	    				}
	    			if(i==6){
	    				out.print("Destination Station Number: ");
	    				}
	    			if(i==7){
	    				out.print("Discount Applied: ");
	    				}
	    			if(i==8){
	    				out.print("Trip Type: ");
	    				}
	    			if(i==9){
	    				out.print("Train Number: ");
	    				}
	    			diffRes++;
	    			out.print(rs2.getString(i));
	    		    out.println("<br>");

	    		}
    		    out.println("<br>");
    		    out.println("<br>");

	    	}
	    						    
	    }
	    out.println("<a href='reservation.jsp'>Go back</a>");
	   
		
	}catch (SQLException e) {
 			out.print(e.getStackTrace());
 			
	}catch (Exception s){
		out.print(s);
	}
	
	
	
	
	
	
	
	%>

	</body>
</html>