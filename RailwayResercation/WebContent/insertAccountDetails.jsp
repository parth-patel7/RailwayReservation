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
<title>Create Account</title>
</head>
<body>
	<%
	
		String fname = request.getParameter("cfirstName");   
    	String lname = request.getParameter("clastName");
    	String email = request.getParameter("email");
    	String phone = request.getParameter("cphone");
    	String username = request.getParameter("cusername");
    	String password = request.getParameter("cpassword");
    	String city = request.getParameter("ccity");
    	String state = request.getParameter("cstate");
    	String address = request.getParameter("caddress");
    			
    	String cusSearch = "select * from Customer where email = '" + email + "'";
    	String acSearch = "select * from Account where username = '" + username +"'";
    	String peSearch = "select * from Person where phone = '" + phone + "'";
    	
    	String acAdd = "insert into Account(username,password)value('" + username + "', '" + password + "')";
    	String peAdd = "insert into Person(first,last,phone,city,state,address)value('" + fname + "', '" + lname + "', '" + phone + "', '" + city + "', '" + state + "', '" + address + "')";
    	String cusAdd = "insert into Customer(email,phone,cus_username)value('"+ email +"','"+ phone +"','"+ username +"')";
    	
		 
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    
		    	ResultSet rs;
 		    	rs = st.executeQuery(cusSearch);
	 		    if (rs.next()) {
	 		        out.println("The customer already exists!");
	 		        out.println("<br>");
	 		        out.println("<a href='index.jsp'>Go back to Admin Page</a>");
	 		    } else {
			    	ResultSet rs1 = st.executeQuery(acSearch);
					if(rs1.next()){
						out.println("This username is taken!");
		 		        out.println("<br>");
		 		        out.println("<a href='index.jsp'>Try Again</a>");
					}else{
						ResultSet rs2 = st.executeQuery(peSearch);
						if(rs2.next()){
							out.println("This phone number already exist with another user!");
			 		        out.println("<br>");
			 		        out.println("<a href='index.jsp'>Try Again</a>");
						}else{
							st.executeUpdate(acAdd);
							st.executeUpdate(peAdd);
							st.executeUpdate(cusAdd);
							response.sendRedirect("index.jsp");
						}
					}
	
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