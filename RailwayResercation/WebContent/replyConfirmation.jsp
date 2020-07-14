<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
</head>
<body>


<%
	out.print("Your reply has been sent, Thank You!");
	

	try {


		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project", "admin30","Cs3362020$");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Message where question like'" + request.getParameter("ques") + "'");
		
		
		if (rs.next()) {
			
			st.executeUpdate("UPDATE Message SET ANSWER = '" + request.getParameter("reply") + "'" +"," +"username_CR = '" + session.getAttribute("user").toString() + "'" +  "WHERE QUESTION = '" + request.getParameter("ques") + "'");
			out.println("<br>");
		}

	} catch (SQLException e) {
		out.print(e.getStackTrace());
		e.printStackTrace();

	} catch (Exception s) {
		out.print(s);
	}
	
	%>
	</br>
	<a href='repMessage.jsp'>Back</a>
</body>
