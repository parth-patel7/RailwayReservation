<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form name = "Message" action="sendMessage.jsp" method="POST">
       Message to Customer Representative:<input type="text" name="Message"/> 
       <input type="submit" value="send" />
   </form>
   <br />

   
    <form name = "SearchMessage" action="searchMessages.jsp" method="POST">
       Search Previous Messages:<input type="text" name="search"/> 
       <input type="submit" value="search"/>
   </form>
   
   <br />
    <a href='listMessages.jsp'>See Message History</a>
 	<br/>
 	

<%
	String userid = session.getAttribute("user").toString();
int reservation_id = -1;

try {

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project", "admin30",
	"Cs3362020$");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from Books where usernameBOOKS ='" + userid + "'");

	while (rs.next()) {
		reservation_id = rs.getInt("res_numberBOOKS");
		int origin = -1;
		int destination = -1;
		String status = "null";

		if (reservation_id != -1) {
	Statement st2 = con.createStatement();
	ResultSet rs2 = st2.executeQuery("select * from Reservation where res_number ='" + reservation_id + "'");
	if (rs2.next()) {
		origin = rs2.getInt("origin");
		destination = rs2.getInt("destination");
	}
		}

		if (origin != -1 && destination != -1) {
	Statement st3 = con.createStatement();
	ResultSet rs3 = st3.executeQuery(
			"select * from Route where originSID ='" + origin + "'" + "and destSID ='" + destination + "'");
	if (rs3.next()) {
		status = rs3.getString("status");
	}
		}

		if (!status.equals("null")) {
	Statement st4 = con.createStatement();
	ResultSet rs4;
	String alert = "Alert! Your route from " + origin + " to " + destination + " has been delayed";
	rs4 = st4.executeQuery(
			"select * from Message where username_MG = '" + userid + "' and answer like '" + alert + "'");

	if (rs4.next()) {

	} else if (!rs4.next()) {

		try {
			Statement st5 = con.createStatement();
			String question = "";
			String repid = "admin";
			st5.executeUpdate("INSERT INTO Message(question,answer,username_MG,username_CR)value('" + question
					+ "' , '" + alert + "', '" + userid + "','" + repid + "')");
		} catch (SQLException e) {
			out.print(e.getStackTrace());
			e.printStackTrace();

		} catch (Exception s) {
			out.print(s);
		}
	}
		}
	}
} catch (SQLException e) {
	out.print(e.getStackTrace());
	e.printStackTrace();

} catch (Exception s) {
	out.print(s);
}
%>
	    
<h3 align = "center"><a href = 'success.jsp'>Go Back to Home Page</a></h3>	


</body>
</html>