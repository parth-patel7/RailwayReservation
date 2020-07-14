<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Messages</title>
</head>
<body>


	<%
		String search = request.getParameter("search");
	String userid = session.getAttribute("user").toString();

	
	out.println("<br>");

	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project", "admin30","Cs3362020$");
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select * from Message where username_MG ='" + userid + "' and question like '%" + search + "%'");

		
		%>
		<FORM NAME="action" >
	    <table border="2" align="center">
	    <tr>
	     	<th>  </th>
	        <th>Message</th>
	      
	    </tr>
	 <%
	 
		while (rs.next()) {
			
			if(!rs.getString("username_MG").equals("") && !rs.getString("username_MG").equals("null") && !rs.getString("question").equals("null") && !rs.getString("question").equals("")){
			  %>
				<tr>
				<td> <%=rs.getString("username_MG") %> </td>
				 <td> <%=rs.getString("question") %> </td>
				</tr>
				<%
				if(!rs.getString("username_CR").equals("null") && !rs.getString("answer").equals("null") && !rs.getString("username_CR").equals("") && !rs.getString("answer").equals("")){ 
				 %>
				<tr>
				<td> Representative (<%=rs.getString("username_CR") %>):</td>
			    <td> <%=rs.getString("answer") %> </td>
			    
				</tr>
				<%
				}}
		}
	 
	 %>
	 </table>
	 </FORM> 
	 <% 
	} catch (SQLException e) {
		out.print(e.getStackTrace());
		e.printStackTrace();

	} catch (Exception s) {
		out.print(s);
	}
	%>

	<a href='message.jsp'> Go Back</a>


</body>
</html>