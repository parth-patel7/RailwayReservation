<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Home Page</title>
      <link rel="stylesheet" href="styles.css">
   </head>
   <body class = "content">
   <%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%}else{
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
	    Statement st = con.createStatement();
	  	
	    ResultSet rs = st.executeQuery("select * from Employee where emp_username = '"+ session.getAttribute("user") + "'");
	    if(rs.next()){
	    	if(rs.getString("position").equals("Manager")){
	    		response.sendRedirect("adminWindow.jsp");
	    	}else{
	    		response.sendRedirect("CustomerRep.jsp");
	    	}
	    }
	    
	}catch (SQLException e) {
				out.print(e.getStackTrace());
				
	}catch (Exception s){
		out.print(s);
	}
%>
   	
<div class ="container">
 <div class ="title"><h1> Train Information Hub</h1>   </div>
   <h4>Welcome <%=session.getAttribute("user")%></h4>
<form>
	<input type = submit value = "Reservation Info" formaction ="reservation.jsp">
	<input type = submit value = "Search" formaction ="search.jsp">
	<input type = submit value = "Message" formaction ="message.jsp">
</form>
<a href='logout.jsp'>Log out</a>
</div>
<%} 
%>

     
   </body>
</html>