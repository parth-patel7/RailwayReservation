<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<!-- // Page created by: Smeet Shah (sps224) -->
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>
<%
	
		String username = request.getParameter("emp_user");
		//out.print(username);
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("select * from Employee where emp_username = '"+username+"'");
		    if(rs.next()){
		    	Statement sts = con.createStatement();
		    	sts.executeUpdate("delete from Person where phone = '" + rs.getString("phoneEM") +"'");
		    	sts.executeUpdate("delete from Account where username = '"+ username+"'");
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