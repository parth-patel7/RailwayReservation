<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript">
	function logout(){
		window.location = "index.jsp";
	}
	function validate(){
		
	}
</script>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<br>
	<%
	
		String userid = request.getParameter("username");   
    	String pwd = request.getParameter("password");
	
		//out.print("Hello " + userid);
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("select * from Account where username='" + userid + "' and password='" + pwd + "'");
		    if (rs.next()) {
		        session.setAttribute("user", userid); 
		        out.println("Welcome " + userid);
		        
		        out.println("<a href='logout.jsp'>Log out</a>");
		       response.sendRedirect("success.jsp");
		    } else {
		    	
		    	out.println("Invalid username/password <a href='index.jsp'>try again!</a>");
		    	
		    }
			
		}catch (SQLException e) {
	 			out.print(e.getStackTrace());
	 			
		}catch (Exception s){
			out.print(s);
		}
		
	%>
	
	
</body>
</html>