<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title> Reservation Page </title>
		 <link rel="stylesheet" href="styles.css">
		 
	</head>	
									<!-- // Page created by: Syed Hussain (sh1189) -->	
	<body class = "content">
	<div class ="container"> 
	<h1 align = "center"><b> Reservation Form </b></h1>
	  Ticket rates: <br/>
	  __________________<br/><br/>
	  
	  First Class: $30/ticket<br/>
	  Business: $20/ticket<br/>
	  Economy: $10/ticket<br/>
	  __________________<br/>
	  <br/>
	  
 	<form name="resForm" action = "makeRes_action.jsp" method="POST">
 		<div>
 			<label for="fName" >Enter First Name: </label><br/>
 				 <input type="text" name = "fname" id="fname" placeholder= "First"required >
 				
 		
 		</div><br/>
 		<div>
 			<label for="lName" >Enter Last Name:</label><br/>
 				 <input type="text" name = "lname" id="lname" placeholder= "Last" required >
 				
 		
 		</div><br/>
 		
 		<div>
 			<label for=discount>This ticket is for child/disabled/elderly</label>
 				<select name = "discount" id = "discount" >
 					<option label="Yes" value="7" ></option>
 				    <option label="No" value="0"></option>    
 				</select>
 		</div><br/>		
 		
 		
 		<div>
 			<label for="date">Enter Todays Date:</label><br/>
 				<input type="date" name="date" id="date" placeholder= "YYYY-MM-DD"required ><br/>
 		
 		</div><br/>
 		
 		<div>
 			<label for="origin">Enter Origin</label>
 				<select name = "origin" id = "origin" >
 					<option label="Nutley" value="1" ></option>
 				    <option label="Brooklyn" value="2"></option>
 				    <option label="Hartford" value="3"></option>
 				    <option label="Boston" value="6"></option>
 				    <option label="Jersey City" value="4" ></option>
 				    <option label="Edison" value="5"></option>
 				     <option label="Trenton" value="9" ></option>
 				    <option label="Bronx" value="8"></option>
 				    <option label="Manhatten" value="7"></option>
 				    <option label="Pittsburg" value="10"></option>
 				    <option label="Cleveland" value="11"></option>
 				    <option label="LosAngeles" value="12"></option>
 				    <option label="SanDiego" value="13"></option>
 				    <option label="Fresno" value="14"></option>
 				    <option label="LasVegas" value="15"></option>
 				    <option label="Houston" value="16"></option>
 				    <option label="Austin" value="17"></option>
 				    <option label="Dallas" value="18"></option>
 				    <option label="Miami" value="19"></option>
 				    <option label="Orlando" value="20"></option>
 				    <option label="Tampa" value="21"></option>
 				    <option label="Naples" value="22"></option>
 				    <option label="Destin" value="23"></option>
 				    <option label="Detroit" value="24"></option>
 				    <option label="Lansing" value="25"></option>
 				    <option label="AnnArbor" value="26"></option>
 				    <option label="Flint" value="27"></option>
 				    <option label="Alepna" value="28"></option>
 				    <option label="RoyalOak" value="29"></option>
 				    
 				    
 				</select>
 		
 		</div><br/>
 		
 		<div>
 			<label for="dest">Enter Destination</label>
 				<select name = "dest" id = "dest" >
 					<option label="Nutley" value="1" ></option>
 				    <option label="Brooklyn" value="2"></option>
 				    <option label="Hartford" value="3"></option>
 				    <option label="Boston" value="6"></option>
 				    <option label="Jersey City" value="4" ></option>
 				    <option label="Edison" value="5"></option>
 				     <option label="Trenton" value="9" ></option>
 				    <option label="Bronx" value="8"></option>
 				    <option label="Manhatten" value="7"></option>
 				    <option label="Pittsburg" value="10"></option>
 				    <option label="Cleveland" value="11"></option>
 				    <option label="LosAngeles" value="12"></option>
 				    <option label="SanDiego" value="13"></option>
 				    <option label="Fresno" value="14"></option>
 				    <option label="LasVegas" value="15"></option>
 				    <option label="Houston" value="16"></option>
 				    <option label="Austin" value="17"></option>
 				    <option label="Dallas" value="18"></option>
 				    <option label="Miami" value="19"></option>
 				    <option label="Orlando" value="20"></option>
 				    <option label="Tampa" value="21"></option>
 				    <option label="Naples" value="22"></option>
 				    <option label="Destin" value="23"></option>
 				    <option label="Detroit" value="24"></option>
 				    <option label="Lansing" value="25"></option>
 				    <option label="AnnArbor" value="26"></option>
 				    <option label="Flint" value="27"></option>
 				    <option label="Alepna" value="28"></option>
 				    <option label="RoyalOak" value="29"></option>
 				    
 				</select> 				
 		</div><br/>
 		
 		
 		<div>
 			<label for=cl>Enter Class</label>
 				<select name = "cl" id = "cl" >
 					<option label="First" value="first" ></option>
 				    <option label="Business" value="business"></option>
 				    <option label="Economy" value="economy"></option>
 				</select>
 				<br/>
 				<br/>
 				
 			 <label for=trip>Trip Type:</label>
 				<select name = "trip" id = "trip" >
 					<option label="Round Trip" value="round" ></option>
 				    <option label="One Way" value="oneWay"></option>
 				</select><br/>
 				<br>
 				
 				Transit Line : Stops
 				<br/>
 				~~~~~~~~~~~~~~~
 				<br>
 				<br/>
 				~ Nutley-Hartford ~
 				<br/>
 				Nutley | Brooklyn | Hartford
 				<br/>
 				<br/>
 				~ Jersey City - Boston ~ 
 				<br/>
 				Jersey City| Edison | Boston
 				<br/>
 				<br/>
 				~ Manhatten - Trenton ~  
 				<br/>
 				Manhattan | Bronx | Trenton
 				<br/>
 				<br/>
 				~ Pittsburg - Cleveland ~ 
 				<br/>
 				Pittsburg | Cleveland
 				 <br/>
 				 <br/>
 				~ Los Angeles - Las Vegas ~ 
 				<br/> 
 				Los Angeles | Fresno | San Diego | Las Vegas
 				 <br/>
 				 <br/>
 				~ Houston - Dallas~  
 				<br/>
 				Houston | Austin | Dallas
 				 <br/>
 				 <br/>
 				~ Miami - Tampa ~  
 				<br/>
 				Miami | Orlando | Tampa
 				 <br/>
 				 <br/>
 				~ Napes - Destin ~ 
 				<br/>
 				Naples | Destin
 				<br/>
 				<br/>
 				~ Detroit - Ann Arbor ~ 
 				<br/>
 				 Detroit | Lansing | Ann Arbor
 				 <br/>
 				 <br/>
 				~ Flint - Royal Oak ~ 
 				<br/>
 				Flint | Alpena | Royal Oak
 				<br/>
 				<br/>			
 			    <br/><label for=tansLine>Select a transit line:</label>
 				<select name = "transLine" id = "transLine" required>
 				 	<option label="Nutely-Hartford" value="3"></option>
 				 	<option label="Jersey City-Boston" value="2"></option>
 					<option label="Manhattan-Trenton" value="1" ></option>
 					<option label="Pittsburg-Cleveland" value="4" ></option>
 					<option label="Los Angeles-Las Vegas" value="5" ></option>
					<option label="Houston-Dallas" value="6" ></option>
					<option label="Miami-Tampa" value="7" ></option>
 					<option label="Naples-Destin" value="8" ></option>
 					<option label="Detroit-Ann Arbor" value="9" ></option>
 					<option label="Flint-Royal Oak" value="10" ></option>
 				</select>
 			</div>	
 			
 	
 		 <div><br>
 			<label for="seatNum">Enter a Desired Seat Number:</label>
 				<input type=text name="seatNum" id="seatNum" required>
 		
 		</div><br/>
 		<br/>
 		<input type="submit" value="MAKE RESERVATION" />
 	</form>
 		<a href='reservation.jsp'>Go back</a>
    </div>
    
   </body>
 

</html>
		
		
		
