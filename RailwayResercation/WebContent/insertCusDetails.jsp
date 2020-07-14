<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>

<!DOCTYPE html>
<html>
<!-- // Page created by: Smeet Shah (sps224) -->
<head>
<script type = "text/javascript">
	function logout(){
		window.location = "index.jsp";
	}
	function validate(){
		
	}
</script>
<meta charset="UTF-8">
<title>Insert Customer</title>
</head>
<body>
	<br>
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
    	String hidden = request.getParameter("caddOredit");
    	String original = request.getParameter("og_user");
    	//out.println(original);
		
    	String cusSearch = "select * from Customer where email = '" + email + "'";
    	String acSearch = "select * from Account where username = '" + username +"'";
    	String peSearch = "select * from Person where phone = '" + phone + "'";
    	
    	String acAdd = "insert into Account(username,password)value('" + username + "', '" + password + "')";
    	String peAdd = "insert into Person(first,last,phone,city,state,address)value('" + fname + "', '" + lname + "', '" + phone + "', '" + city + "', '" + state + "', '" + address + "')";
    	String cusAdd = "insert into Customer(email,phone,cus_username)value('"+ email +"','"+ phone +"','"+ username +"')";
    	
// 		out.println(" first: "+ fname + "\n last:" + lname + 
// 				"\n email: " + email + 
// 				"\n phone: " + phone +"\n username:" + username +
// 				"\n password:" + password + "\n address: " + address +
// 				"\n city:" + city +"\n state:" + state + "\n hidden:" + hidden);
		 
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    
		    if(hidden.equals("0")){
		    	ResultSet rs;
 		    	rs = st.executeQuery(cusSearch);
	 		    if (rs.next()) {
	 		        out.println("The customer already exists!");
	 		        out.println("<br>");
	 		        out.println("<a href='adminWindow.jsp'>Go back to Admin Page</a>");
	 		    } else {
			    	ResultSet rs1 = st.executeQuery(acSearch);
					if(rs1.next()){
						out.println("This username is taken!");
		 		        out.println("<br>");
		 		        out.println("<a href='adminWindow.jsp'>Try Again</a>");
					}else{
						ResultSet rs2 = st.executeQuery(peSearch);
						if(rs2.next()){
							out.println("This phone number already exist with another user!");
			 		        out.println("<br>");
			 		        out.println("<a href='adminWindow.jsp'>Try Again</a>");
						}else{
							st.executeUpdate(acAdd);
							st.executeUpdate(peAdd);
							st.executeUpdate(cusAdd);
							response.sendRedirect("adminWindow.jsp");
						}
					}
	
		    	}
		    }else if(hidden.equals("1")){
		    	ResultSet sts;
 		    	sts = st.executeQuery(cusSearch);
 		    	if(sts.next()){
 		    		Statement us = con.createStatement();
 		    		ResultSet phoneCS = us.executeQuery("select * from Customer where cus_username = '"+original+"'");
 		    		phoneCS.next();
 		    		String phoneSE = phoneCS.getString("phone");
 		    		if(!phoneCS.getString("email").equals(email)){
 		    			out.println("This email already exist with another customer!");
		 		        out.println("<br>");
		 		        %><a href="editCustomer.jsp?cus_user=<%=original%>" >Try Again</a> <%
 		    		}else if(username.equals(original) && phone.equals(phoneSE)){
 		    			Statement st5 = con.createStatement();
	 	 		    	st5.executeUpdate("Update Account set username = '"+ username +"', password = '"+ password +"' where username = '"+ original +"'");
	 	 		    	st5.executeUpdate("Update Person set first = '" + fname + "', last = '" + lname + "', phone = '"+ phone +"', city ='" + city + "', state ='" + state + "', address ='" + address + "' where phone = '"+ phoneSE +"'");
	 	 		    	response.sendRedirect("adminWindow.jsp");//late
	 	 		    	
 		    		}else if(!username.equals(original) && phone.equals(phoneSE)){
 		    			Statement st3 = con.createStatement();
	 		    		ResultSet sts3 = st3.executeQuery("select * from Account where username = '"+ username +"'");
	 		    		if(sts3.next()){
	 		    			out.println("This username is taken!");
			 		        out.println("<br>");
			 		        %><a href="editCustomer.jsp?cus_user=<%=original%>" >Try Again</a> <%
	 		    		}else{
	 		    			st.executeUpdate("Update Account set username = '"+ username +"', password = '"+ password +"' where username = '"+ original +"'");
		 	 		    	st.executeUpdate("Update Person set first = '" + fname + "', last = '" + lname + "', phone = '"+ phone +"', city ='" + city + "', state ='" + state + "', address ='" + address + "' where phone = '"+ phoneSE +"'");
	 		    			response.sendRedirect("adminWindow.jsp");
	 		    		}
 		    		}else if(!phone.equals("phoneSE")&& username.equals(original)){
 		    			Statement st4 = con.createStatement();
	 		    		ResultSet sts4 = st4.executeQuery("select * from Person where phone = '"+ phone +"'");
	 		    		if(sts4.next()){
	 		    			out.println("This phone number already exist with another user!");
			 		        out.println("<br>");
			 		       %><a href="editCustomer.jsp?cus_user=<%=original%>" >Try Again</a> <% 
	 		    		}else{
	 		    			st.executeUpdate("Update Account set username = '"+ username +"', password = '"+ password +"' where username = '"+ original +"'");
	 		    			st.executeUpdate("Update Person set first = '" + fname + "', last = '" + lname + "', phone = '"+ phone +"', city ='" + city + "', state ='" + state + "', address ='" + address + "' where phone = '"+ phoneSE +"'");
	 		    			response.sendRedirect("adminWindow.jsp");
	 		    		}
 		    		}else{
 		    			Statement st1 = con.createStatement();
	 		    		ResultSet sts1 = st1.executeQuery("select* from Account where username = '"+ username +"'");
	 	 		    	if(sts1.next()){
	 	 		    		out.println("This username is taken!");
			 		        out.println("<br>");
			 		       %><a href="editCustomer.jsp?cus_user=<%=original%>" >Try Again</a> <%
	 	 		    	}else{
	 	 		    		Statement st5 = con.createStatement();
		 		    		ResultSet sts5 = st5.executeQuery("select * from Person where phone = '"+ phone +"'");
	 	 		    		if(sts5.next()){
	 	 		    			out.println("This phone number already exist with another user!");
				 		        out.println("<br>");
				 		       %><a href="editCustomer.jsp?cus_user=<%=original%>" >Try Again</a> <%
	 	 		    		}else{
	 	 		    			st1.executeUpdate("Update Account set username = '"+ username +"', password = '"+ password +"' where username = '"+ original +"'");
		 	 		    		st1.executeUpdate("Update Person set first = '" + fname + "', last = '" + lname + "', phone = '"+ phone +"', city ='" + city + "', state ='" + state + "', address ='" + address + "' where phone = '"+ phoneSE +"'");
		 	 		    		response.sendRedirect("adminWindow.jsp");//late
	 	 		    		}
	 	 		    	}
 		    		}	
 		    	
 	 		    }else{
 	 		    	Statement st2 = con.createStatement();
 		    		ResultSet rss1 = st2.executeQuery("select email,phone from Customer where cus_username = '"+ original +"'");
 		      		if(rss1.next()){
 		    			st2.executeUpdate("Delete from Person where phone = '"+ rss1.getString("phone") +"'");
 		    			st2.executeUpdate("Delete from Account where username = '"+original+"'");
  		    			st.executeUpdate(acAdd);
						st.executeUpdate(peAdd);
						st.executeUpdate(cusAdd);
						response.sendRedirect("adminWindow.jsp");//late
 		    		}
 		    	}
		    	
				//response.sendRedirect("adminWindow.jsp");
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