<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
</head>
<body>

<a href='manageCustomer.jsp'>Go Back</a>
	<%
		String answer = "null";
		String question = "";
		String q = "";

	try {

		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project", "admin30","Cs3362020$");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Message where answer like'" + answer + "'");
		%>
		<FORM NAME="action" action="replyConfirmation.jsp" method='post'>
	    <table border="2" align="center">
	    <tr>
	     	<th>From</th>
	        <th>Question</th>
	        <th>Reply</th>
	    </tr>
	 <%
	 
		while (rs.next()) {
			q = rs.getString("question");
			if(!rs.getString("question").equals("") && !rs.getString("question").equals("null")){
			 %>
			<tr>
			<td> <%=rs.getString("username_MG") %> </td>
		    <td> <%=rs.getString("question") %> </td>
		    <td> 
			    Reply:<input type="text"  name="reply"/> 
      			<input type="hidden" name="ques" value="<%= rs.getString("question") %>">
      			<input type="submit" value="reply"/>
		    </td>
			</tr>
			<%
			}
		}

	} catch (SQLException e) {
		out.print(e.getStackTrace());
		e.printStackTrace();

	} catch (Exception s) {
		out.print(s);
	}
	%>
	</table>
	</FORM>  
	<%
	%>

	

</body>
</html>