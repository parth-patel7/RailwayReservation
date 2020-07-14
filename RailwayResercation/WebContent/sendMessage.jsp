<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Confirmation</title>
</head>
<body>

	<%
	String Message = request.getParameter("Message");
	String userid = session.getAttribute("user").toString();
	String reply = "null";
	String repId = "null";
	
	
	out.print("Hello: " + userid + ", your message has been received and a representative will get back to you as soon as possible.");
	out.println("<br>");
	if(Message != ""){
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project", "admin30", "Cs3362020$");
		
		Statement st = con.createStatement();
 
		st.executeUpdate("INSERT INTO Message(question,answer,username_MG,username_CR)value('" + Message + "' , '" + reply + "', '" + userid + "','" + repId + "')");
		out.println("<br>");

	} catch (SQLException e) {
		out.print(e.getStackTrace());
		e.printStackTrace();

	} catch (Exception s) {
		out.print(s);
	}
	}
	%>
	<a href='message.jsp'>Back</a>
</body>
</html>