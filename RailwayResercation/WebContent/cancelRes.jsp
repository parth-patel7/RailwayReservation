<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>

		<title>Cancel Reservation</title>
 		<link rel="stylesheet" href="styles.css">	
 		
 		
	</head>
	  														<!-- // Page created by: Syed Hussain (sh1189) -->	
	<body class = "content">
	<div class ="container"> 
	<h1 align = "center"><b> Cancel Your Reservation </b></h1>
	
	<form action="cancelRes_action.jsp" method=POST>
		
		
		<div>
			<label for="cancel_date" >Date reserved</label><br/>
 		 	<input type="text" name = "cancel_date" id="cancel_date" placeholder="YYYY-MM-DD" required >
		</div>
		<div>
			<label for="seatNum" >Enter Seat Number:</label><br/>
 		 	<input type="text" name = "seatNum" id="seatNum" placeholder="#####"  required >
		</div>
		<div>
			<label for="rNum" >Enter Reservation Number:</label><br/>
 		 	<input type="text" name = "rNum" id="rNum" placeholder="#####"  required >
		</div>
		<div>
			<label for="tNum" >Enter Train Number:</label><br/>
 		 	<input type="text" name = "tNum" id="tNum" placeholder="#####"  required >
		</div>
	
	
	
	<input type="submit" value="Cancel Reservation">
	
	</form>
		<a href='reservation.jsp'>Go back</a>
		
	
	</div>	
</body>
</html>