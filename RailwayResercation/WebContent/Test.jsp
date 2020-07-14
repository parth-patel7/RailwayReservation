<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
   <head>
   		
<meta charset="UTF-8">
      <title>Login Form</title>
      <link rel="stylesheet" href="styles.css">
   </head>
   
   <body>
   		<%
      		
   		String operation = request.getParameter("op");




      		Connection con = null;
      		Class.forName("com.mysql.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
    	   	Statement st = con.createStatement();
    	   	int totFare = 0;
    	   	

      		try
      		{
      			
      			
      			ResultSet rm,rs;
      			//FOR ADD
      			if(operation.compareTo("a") == 0){
      			
      				String user = request.getParameter("user");
      				String tlid = request.getParameter("tlid");
      				String tripType = request.getParameter("tripType");
      	   			String dest = request.getParameter("dest");
      	   			String origin = request.getParameter("origin");
      	      		String date = request.getParameter("date");
      	      		String seatNum = request.getParameter("seatNum");
      	      		String discount = request.getParameter("discount");
      	      		String ctype = request.getParameter("ctype");
      	      	
      				System.out.println(tlid);
					
      	            rm = st.executeQuery("select * from isOn, (select RID from Route where originSID = " +origin+ " and destSID = " +dest+ ") t1 where TLID = " +tlid+ " and isOn.RID_isOn = t1.RID");
					
      	            //SEE IF ROUTE EXISTS ON TRANSITLINE
      	            if(rm.next()){	
      	            		
      	            		
      	            		//GET FARE
      	            		rs = st.executeQuery("SELECT fare FROM Route where originSID = " +origin+ " and destSID = " +dest);
      	            		if(rs.next()){
      	            			totFare = rs.getInt("fare");
      	            			if(discount.compareTo("yes")==0){
          	            			totFare = totFare + 7;
          	            		}
          	            		else{
          	            			
          	            			if(ctype.compareTo("first")== 0){
          	            				totFare = totFare + 30;
          	            			}
          	            			else if(ctype.compareTo("eco")== 0){
          	            				totFare = totFare + 10;
          	            			}
          	            			if(ctype.compareTo("business")== 0){
          	            				totFare = totFare + 20;
          	            			}
          	            			
          	            			
          	            		}
      
      	            		}
      	            		if(tripType.compareTo("round") == 0){
      	            			totFare = totFare * 2;
      	            		}

      	        			//CHECK FOR SEATNUM AVAILABILITY
      	        			Statement x = con.createStatement();
      	        			ResultSet rs4 = x.executeQuery("select  t1.num_seats, t1.TID from Train t1 inner join (select t.TID from Takes t inner join (select RID_isOn from isOn where TLID = '"+tlid+"') as t1 on t.RID = t1.RID_isOn group by t.TID) as temp on t1.TID = temp.TID");
      	        			int trainNum = 0;
      	        			if(rs4.next()){
      	        				if(Integer.parseInt(seatNum) > 0 && Integer.parseInt(seatNum) < rs4.getInt("num_seats")+1 ){
      	        					trainNum = rs4.getInt("TID");
      	                            ResultSet rq = st.executeQuery("select * from Preference where seat_number="+seatNum+" and TID ="+trainNum);// also check for particular train
      	                           
      	                            if(rq.next()){
      	                            	out.println("Seat number " +seatNum + " is already taken!");
      	                                out.println("<br>");
      	                                out.println("<a href='CustomerRep.jsp'>Try again</a>");
      	                                out.println("<br>");
      	                            }
      	                          else{
      	      	            		//INSERT INTO TABLE
      	      	            		st.executeUpdate("INSERT INTO Preference(seat_number, class, TID) VALUES (" +seatNum+ ", '"+ctype+"', "+trainNum+")");
      	      	            		st.executeUpdate("INSERT INTO Reservation(res_number, total_fare, date, seat_number, origin, destination, discount, trip_type, seat_TID) VALUES (null, " +totFare+ ",  '"+date+ "', " +seatNum+ ", " +origin+ ", " +dest+ ", '" +discount+ "' , '" +tripType+"' , "+trainNum+")");
      			      				rs = st.executeQuery("SELECT * FROM Reservation WHERE total_fare = "+totFare+" and date = '"+date+"' and seat_number = "+seatNum+" and origin = "+origin+" and destination = "+dest+" and discount = '"+discount+"' and trip_type = '"+tripType+"'");
      	      	            		rs.next();
      			      				String resNum = rs.getString("res_number");
      			      				st.executeUpdate("INSERT INTO Books(usernameBOOKS, res_numberBOOKS) VALUES ('" +user+ "' , " +resNum+")");

      	      	            		System.out.println("Data is successfully inserted!");
      	      	        			}
      	        				}
      	        				else{
      	        				out.print("Invalid Seat Number");
      	        				}
      	        			}
      	        			
      	        			
      	        			
      	        			
      	       	
      	            	}else{System.out.println("Route Does not exist");}
      	           
      	     
      	            
      			}
      			
      			
      			//FOR EDIT
      			else if(operation.compareTo("e") == 0){

      				String tlid = request.getParameter("tlid");
      				String tripType = request.getParameter("tripType");
      	   			String dest = request.getParameter("dest");
      	   			String origin = request.getParameter("origin");
      	      		String date = request.getParameter("date");
      	      		String seatNum = request.getParameter("seatNum");
      	      		String discount = request.getParameter("discount");
      	      		String ctype = request.getParameter("ctype");
      	      		String oldSeat = request.getParameter("oldSeat");
      				String resNum = request.getParameter("resNum");

       				System.out.println(resNum);
       				System.out.println(seatNum);
       				System.out.println(origin);


      				 rm = st.executeQuery("select * from isOn, (select RID from Route where originSID = " +origin+ " and destSID = " +dest+ ") t1 where TLID = " +tlid+ " and isOn.RID_isOn = t1.RID");

       	            //SEE IF ROUTE EXISTS ON TRANSITLINE
       	            if(rm.next()){	

       	            		
       	            		//GET FARE
       	            		rs = st.executeQuery("SELECT fare FROM Route where originSID = " +origin+ " and destSID = " +dest);
       	            		if(rs.next()){
       	            			totFare = rs.getInt("fare");
       	            			if(discount.compareTo("yes")==0){
           	            			totFare = totFare + 7;
           	            		}
           	            		else{
           	            			
           	            			if(ctype.compareTo("first")== 0){
           	            				totFare = totFare + 30;
           	            			}
           	            			else if(ctype.compareTo("eco")== 0){
           	            				totFare = totFare + 10;
           	            			}
           	            			if(ctype.compareTo("business")== 0){
           	            				totFare = totFare + 20;
           	            			}
           	            			
           	            			
           	            		}
       
       	            		}
       	            		if(tripType.compareTo("round") == 0){
       	            			totFare = totFare * 2;
       	            		}
       	        			


       	        			//CHECK FOR SEATNUM AVAILABILITY
       	        			Statement x = con.createStatement();
      	        			ResultSet rs4 = x.executeQuery("select  t1.num_seats, t1.TID from Train t1 inner join (select t.TID from Takes t inner join (select RID_isOn from isOn where TLID = '"+tlid+"') as t1 on t.RID = t1.RID_isOn group by t.TID) as temp on t1.TID = temp.TID");
      	        			int trainNum = 0;
      	        			if(rs4.next()){
                              	System.out.println("here");

      	        				if(Integer.parseInt(seatNum) > 0 && Integer.parseInt(seatNum) < rs4.getInt("num_seats")+1 ){
      	        					trainNum = rs4.getInt("TID");
      	                            ResultSet rq = st.executeQuery("select * from Preference where seat_number="+seatNum+" and TID ="+trainNum);// also check for particular train
  	                            	System.out.println("here1");

      	                           
      	                            if(rq.next() && oldSeat.compareTo(seatNum) != 0){
      	                            	System.out.println("here");
      	                            	out.println("Seat number " +seatNum + " is already taken!");
      	                                out.println("<br>");
      	                                out.println("<a href='CustomerRep.jsp'>Try again</a>");
      	                                out.println("<br>");
      	                            }
      	                          else{
      	       	            		//INSERT INTO TABLE
      	       	        				st.executeUpdate("UPDATE Preference SET seat_number = " +seatNum+ ",  class = '"+ctype+"' , TID = "+trainNum+ " WHERE seat_number = " +oldSeat+ " and TID = "+trainNum);
      	       	            		
      	       	            			st.executeUpdate("UPDATE Reservation SET total_fare = " +totFare +", date = '" +date+ "', origin = "+origin+", destination = "+dest+", discount = '"+discount+"', trip_type = '"+tripType+"'  WHERE res_number = " +resNum);
      	 		      				
      	       	            			System.out.println("Data is successfully Updated!");
      	       	        			}
      	        				
      	        		
      	        				}else{
      	        					System.out.println("Seat Does not exist");
      	        				}
      	        			}
       	            		
       	            	}else{System.out.println("Route Does not exist");}
       	           
       	     
	      		}
      			
      			
      			//FOR DELETE
	      		else if(operation.compareTo("d") == 0){
      	       		
	      			String resNum = request.getParameter("resNum");
	          		String oldSeat = request.getParameter("oldSeat");
	          		String tNum = request.getParameter("seatTID");
	          		
	          		
	      			st.executeUpdate("DELETE FROM Preference WHERE (seat_number,TID) in (("+oldSeat+","+tNum+"))");
	      			st.executeUpdate("DELETE FROM Reservation WHERE res_number =" +resNum);
	      			
    	      		System.out.println("Data is successfully Deleted!");
      			}
	      		
      			}
      		
      		catch(Exception e)
      		{
      			System.out.print(e);
      			e.printStackTrace();
      		}
			
      		%>
      		<script>
      			var link = "http://localhost:8080/CS336GP30/manageReservation.jsp";
      			window.location.href = link;
      		</script>
   </body>
</html>