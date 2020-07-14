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
   			String rid = request.getParameter("rid");
			String tlid = request.getParameter("tlid");
   			String dest = request.getParameter("dest");
   			String origin = request.getParameter("origin");
      		String arr = request.getParameter("arr");
      		String dep = request.getParameter("dep");
      		String operation = request.getParameter("op");
      		String fare = request.getParameter("fare");
      		String status = request.getParameter("status");
      		
      		
      		
      		Connection con = null;
      		Class.forName("com.mysql.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
    	   	Statement st = con.createStatement();
      		try
      		{
      			
      			
      			ResultSet rm,rs;
      			//FOR ADD
      			if(operation.compareTo("a") == 0){
      				rs = st.executeQuery("SELECT RID FROM Route WHERE arr_time = '"+arr+"' and dep_time = '"+dep+"' and originSID = "+origin+" and destSID = "+dest);
					if(rs.next()){
						//ROUTE ALREADY EXISTS
						System.out.println("Route already exists!");
					}
					else{
      	            rm = st.executeQuery("select t.TLID from TransitLine t where t.TLID = "+ tlid +" and "+origin+" between t.originSID and t.destSID and "+dest+" between t.originSID and t.destSID");
      	            

      	            //SEE IF ROUTE EXISTS ON TRANSITLINE
      	            if(rm.next()){	
      	            		
      	            		st.executeUpdate("INSERT INTO Route(RID, arr_time, dep_time, originSID, destSID, fare, status) VALUES ("+rid+", '"+arr+"', '"+dep+"', "+origin+", "+dest+", "+fare+", '"+status+"')");
      						st.executeUpdate("INSERT INTO isOn(TLID, RID_isOn) VALUES ("+tlid+", "+rid+")");
      	        			
      	            
      	         		
      	            	}else{System.out.println("Route Does not exist");}
      	           
      	     
      	            
      			}
      			
      			}
      			//FOR EDIT
      			else if(operation.compareTo("e") == 0){
      				
       				st.executeUpdate("UPDATE Route SET arr_time = '"+arr+"' , dep_time = '"+dep+"' , fare = "+fare+" , status = '"+status+"' WHERE RID = "+rid);
					
       	           
	      		}
      			
      			
      			//FOR DELETE
	      		else if(operation.compareTo("d") == 0){
					
	      			st.executeUpdate("DELETE FROM  Takes WHERE RID =" +rid);
	      			st.executeUpdate("DELETE FROM isOn WHERE RID_isOn =" +rid);
	      			st.executeUpdate("DELETE FROM Route WHERE RID = " +rid);
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
      			var link = "http://localhost:8080/CS336GP30/manageSchedule.jsp";
      			window.location.href = link;
      		</script>
   </body>
</html>