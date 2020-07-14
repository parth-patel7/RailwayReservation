<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"
    %>
 
 
<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		<title>Reservation</title>
	</head>
				 										 <!-- // Page created by: Syed Hussain (sh1189) -->	
	<body>
	<%		  
	    
		String lname = request.getParameter("lname");
	    String fname = request.getParameter("fname");
		String dest = request.getParameter("dest");	
		String origin = request.getParameter("origin");	
		String date = request.getParameter("date");		
		String claSS = request.getParameter("cl");
		String tripType = request.getParameter("trip");
		String transLine = request.getParameter("transLine");
		String dis = request.getParameter("discount");
		String discountYesorNo="Yes";
		String sNum = request.getParameter("seatNum");
		String cost="7";
		
		double reservationNum =Math.round(Math.random()*999+1);
		
		double seatNum;
		
		//checks if price is discounted if its not then cost
		//gets incremented with class price otherwise discounted
		//price $7 is issued and class price is waived
		 if (dis.equals("0") == true){
			 
			//updates input fields
			 discountYesorNo="No";
			 if (claSS.equals("first") == true  ){

				 cost= "30";
					 if(sNum == null || sNum == ""){
					 seatNum=Math.round(Math.random()*4+1);
					 }else{
						 seatNum = Integer.parseInt(sNum);
					 }
			 }
			 if (claSS.equals("business") == true ){
				 cost=  "20";
				 if(sNum == null || sNum == ""){
				 seatNum=Math.round(Math.random()*5+6); 
				 }else{
					 seatNum = Integer.parseInt(sNum);
				 }
			 }
			 if (claSS.equals("economy") == true){
				 cost = "10";
				 if(sNum == null || sNum == ""){
				 seatNum=Math.round(Math.random()*3+12);
				 }else{
					 seatNum = Integer.parseInt(sNum);
				 }
			 }
		 }
		 
	
		try {

			
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    Statement st2 = con.createStatement();
		    ResultSet rs2 =st2.executeQuery("select * from Reservation where res_number='" + reservationNum + "'");
		    

		    		
		    
		   
		    
		    //check reservation number if its unique
			if(rs2.next()){
				reservationNum =Math.round(Math.random()*999+1);
			//check seat number if its not take 
			}

				//reterive fair from their desired route
				Statement getFare = con.createStatement();
				String query = "select fare as fare from Route where originSID = '" +origin+ "' AND destSID = '" +dest+"';";
				ResultSet results = getFare.executeQuery(query);
				results.next();
				try{
					
					
					//check if the routes on the transit line
					Statement c = con.createStatement();
					ResultSet rs3 = c.executeQuery("select t.name, t.TLID from TransitLine t where t.TLID = '"+ transLine +"' and '"+origin+"' between t.originSID and t.destSID and '"+dest+"' between t.originSID and t.destSID");
					
					if(rs3.next()){
					
					//checks if seat number is available / valid on each train
					Statement x = con.createStatement();
					ResultSet rs4 = x.executeQuery("select  t1.num_seats, t1.TID from Train t1 inner join (select t.TID from Takes t inner join (select RID_isOn from isOn where TLID = '"+ rs3.getString("TLID")+"') as t1 on t.RID = t1.RID_isOn group by t.TID) as temp on t1.TID = temp.TID");
					
					int trainNum = 0;
					
					if(rs4.next()){
						if(Integer.parseInt(sNum) > 0 && Integer.parseInt(sNum) < rs4.getInt("num_seats")+1){
							
							trainNum = rs4.getInt("TID");		
						    ResultSet rs = st.executeQuery("select * from Preference where seat_number="+sNum+" and TID ="+trainNum);// also check for particular train
						    if( rs.next() ){
						        out.println("Seat number " +sNum + " is already taken!");
						        out.println("<br>");
						        out.println("<a href='make_Res.jsp'>Try again</a>");
						        out.println("<br>");
						    }else{
								// double cost if its a round trip
								 if(tripType.equals("round") == true){
									 
									 int temp = Integer.parseInt(cost);
									 int temp2 = temp*2;
									 cost = Integer.toString(temp2);
								 }
								
								 // tell use what the cost will be
								Integer fare = Integer.parseInt(results.getString(1));
								cost = ""+ (Integer.parseInt(cost) + fare);
								out.println("Your total cost will be $"+ cost);
						        out.println("<br>");
						        
								//insert all data to preference/reservation/books tables 
						    	st.executeUpdate("insert into Preference value('"+sNum+"','"+claSS+"','"+trainNum+"')");
							   	st.executeUpdate("insert into Reservation(res_number,total_fare,date,seat_number,origin,destination,discount,trip_type,seat_TID)value('" + reservationNum + "','" + cost + "','" + date + "','" + sNum + "','" + origin + "','" + dest + "','" + discountYesorNo + "','" + tripType + "','"+trainNum+"')");
							   	st.executeUpdate("insert into Books(usernameBOOKS,res_numberBOOKS)value('" + session.getAttribute("user") + "','" + reservationNum + "')");
							   
							   	//needed when it comes to cancellations
							   	out.println("You created a reservation for "+ fname + lname +"!");
							    out.println("<br>");
							    out.println("Your seat number is "+sNum+" please keep this number in case of canelations");
							    out.println("<br>");
							    out.println("Your reservation number is "+reservationNum+" please keep this number in case of canelations");
							    out.println("<br>");
							    out.println("<a href='make_Res.jsp'>Make another reservation?</a>");	
							    out.println("<br>");
							    out.println("----OR----");
							    out.println("<br>");
						    }
						}else{
							out.println("Please select valid seat number");
						    out.println("<br>");
						    out.println("<a href='success.jsp'>Go back To Main Page</a>");
							}
						}else{
							out.println("Seat Doesn't Exist");
						    out.println("<br>");
						    out.println("<a href='success.jsp'>Go back To Main Page</a>");
							}
					
					}else{
						out.println("Please enter valid route");
					    out.println("<br>");
					    out.println("<a href='success.jsp'>Go back To Main Page</a>");
						
						}
					
					}catch(Exception e){

				}
				

		    
		    //goes back to reservation page
		   	out.println("<a href='reservation.jsp'>Go Back</a>");

			
		   	
		}catch (SQLException e) {
 			
	}catch (Exception s){
		s.printStackTrace();
	}
	
	
	 %>
	</body>
</html>
