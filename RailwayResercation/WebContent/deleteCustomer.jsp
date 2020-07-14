<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<!-- // Page created by: Smeet Shah (sps224) -->
<head>
<meta charset="ISO-8859-1">
<title>Delete Customer</title>
</head>
<body>
<%
	
		String cusername = request.getParameter("cus_user");
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("select * from Customer where cus_username = '"+cusername+"'");
		    if(rs.next()){
		    	st.executeUpdate("delete from Person where phone = '" + rs.getString("phone") +"'");
		    	st.executeUpdate("delete from Account where username = '"+ cusername+"'");
			    response.sendRedirect("adminWindow.jsp");	
		    }
		    
		}catch (SQLException e) {
			e.printStackTrace();
	 			out.print(e.getStackTrace());
		}catch (Exception s){
			out.print(s);
		}
		
	%>

</body>
</html>