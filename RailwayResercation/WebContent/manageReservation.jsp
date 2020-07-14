<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	<style>
		.caption{
			border: 1px solid #ddd;
			height: 45px;
			font-size: 31px;
			background: #cbcbdc;
			text-align: center;
		}

		#res {
			border-collapse: collapse;
			width: 75%;
		}

		#res td, #res th {
			border: 1px;
			padding: 1px;
			text-align: center;
		}

		#res tr:nth-child(even){background-color: #f2f2f2;}

		#res tr:hover {background-color: #ddd;}

		#ss th {
			padding-top: 1px;
			padding-bottom: 1px;
			text-align: center;

		}
	</style>
</head>
<body class = "content">
	<div class="caption">Reservations</div>
	<div align="center">
		<table id="res">
			<thead>
				<tr>
					<th>Reservation Number</th>
					<th>Date</th>
					<th>Fare</th>
					<th>Seat Number</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Discount</th>
					<th>Trip Type</th>
					<th>Train</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {

					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
					Statement st = con.createStatement();
					ResultSet rs;
					rs = st.executeQuery("select * from Reservation");

					while(rs.next()){
						String resNum = rs.getString("res_number");
						String seatNum = rs.getString("seat_number");
						String seatTID = rs.getString("seat_TID");

						out.println("<tr>");
						out.println("	<td>"+rs.getInt("res_number")+"</td>");
						out.println("	<td>"+rs.getString("date")+"</td>");
						out.println("	<td>"+rs.getInt("total_fare")+"</td>");
						
						out.println("	<td>"+rs.getString("seat_number")+"</td>");
						out.println("	<td>"+rs.getString("origin")+"</td>");
						out.println("	<td>"+rs.getString("destination")+"</td>");
						out.println("	<td>"+rs.getString("discount")+"</td>");
						out.println("	<td>"+rs.getString("trip_type")+"</td>");
						out.println("	<td>"+rs.getString("seat_TID")+"</td>");
						out.println("	<td><a href=editRes.jsp?resNum="+resNum+"&oldSeat="+seatNum+">Edit</a></td>");
						out.println("	<td><a href=Test.jsp?resNum="+resNum+"&oldSeat="+seatNum+"&seatTID="+seatTID+"&op=d>Delete</a></td>");
						out.println("</tr>");
					}

				}catch (SQLException e) {
						out.println(e.getStackTrace());

				}catch (Exception s){
					out.println(s);
				}
		%>
			</tbody>
		</table>
	</div>
	<a href='addRes.jsp'>Add Reservation</a> <br/>
	<a href='CustomerRep.jsp'>back </a>
	
</body>	
</html>