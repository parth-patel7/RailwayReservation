<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Train Schedules</title>
	</head>
	<body>
	<%
	//Variables
	String origin = request.getParameter("origin");
	String destination = request.getParameter("dest");
	String date = request.getParameter("date");
	String sort = request.getParameter("sort");	
	
	try {
		//SQL Connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		
       //FORWARD
       if(Integer.parseInt(origin) < Integer.parseInt(destination)){ 
     	   if (sort.compareTo("fare") == 0){
       			Statement fare = con.createStatement();
       			Statement ft = con.createStatement();
       			ResultSet frs = fare.executeQuery("select * from Route where originSID <='" + origin + "' AND destSID >='" + destination + "' ORDER BY fare ASC" );
       			while (frs.next()){
					
       				int r = frs.getInt("RID");
      	 			int o = frs.getInt("originSID");
      	 			int d = frs.getInt("destSID");
       				int f = frs.getInt("fare");
       				int arrival = frs.getInt("arr_time");
       				int dept = frs.getInt("dep_time");
       				
       				ResultSet tf = ft.executeQuery("select TID from Takes where RID='" + r + "'");
       				tf.next();
       				
       				int t = tf.getInt("TID");
       				
       				out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
  					out.println("<br>");
  					
       			}
       		}
    		if (sort.compareTo("arr_time") == 0){
      	 		Statement arr = con.createStatement();
      	 		Statement at = con.createStatement();
       			ResultSet ars = arr.executeQuery("select * from Route where originSID <='" + origin + "' AND destSID >='" + destination + "' ORDER BY arr_time ASC" );
       			while (ars.next()){
       				int r = ars.getInt("RID");
       				int o = ars.getInt("originSID");
       				int d = ars.getInt("destSID");
       				int f = ars.getInt("fare");
       				int arrival = ars.getInt("arr_time");
       				int dept = ars.getInt("dep_time");
       				
       				ResultSet ta = at.executeQuery("select TID from Takes where RID='" + r + "'");
       				ta.next();
       				
       				int t = ta.getInt("TID");
       				
       				out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
       				//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$" );
  					out.println("<br>");
       			}
    		}
    	   	if (sort.compareTo("dep_time") == 0){
    	  		Statement dept = con.createStatement();
    	  		Statement dt = con.createStatement();
       			ResultSet drs = dept.executeQuery("select * from Route where originSID <='" + origin + "' AND destSID >='" + destination + "' ORDER BY dep_time ASC" );
 	      		while (drs.next()){
 	      			int r = drs.getInt("RID");
 	      			int o = drs.getInt("originSID");
 	      			int d = drs.getInt("destSID");
 	      			int f = drs.getInt("fare");
 	      			int arrival = drs.getInt("arr_time");
       				int dep = drs.getInt("dep_time");
 	      			
 	      			ResultSet td = dt.executeQuery("select TID from Takes where RID='" + r + "'");
 	      			td.next();
 	      			
 	      			int t = td.getInt("TID");
 	      			out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dep + "\t" + "Fare: " + f + "$");
 	      			//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$" );
  					out.println("<br>");
 	      		}
 	      	}
 	      	if (sort.compareTo("none") == 0){
 	      		Statement none = con.createStatement();
 	      		Statement nt = con.createStatement();
 	      		ResultSet nrs = none.executeQuery("select * from Route where originSID <='" + origin + "' AND destSID >='" + destination + "'" );
 	      		while (nrs.next()){
 	      			int r = nrs.getInt("RID");
 	      			int o = nrs.getInt("originSID");
 	      			int d = nrs.getInt("destSID");
 	      			int f = nrs.getInt("fare");
 	      			int arrival = nrs.getInt("arr_time");
       				int dept = nrs.getInt("dep_time");
 	      			
 	      			ResultSet tn = nt.executeQuery("select TID from Takes where RID='" + r + "'");
 	      			tn.next();
 	      			
 	      			int t = tn.getInt("TID");
 	      			
 	      			out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
 	      			//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$" );
  					out.println("<br>");
 	      		}
    	   	}	
       		else{
      			out.println("<br>");
      	  }
 	    
       }
       //BACKWARD
       else{
    	   if (sort.compareTo("fare") == 0){
      			Statement fare = con.createStatement();
      			Statement ft2 = con.createStatement();
      			ResultSet frs = fare.executeQuery("select * from Route where originSID >='" + origin + "' AND destSID <='" + destination + "' ORDER BY fare ASC" );
      			while (frs.next()){
      				int r = frs.getInt("RID");
     	 			int o = frs.getInt("originSID");
     	 			int d = frs.getInt("destSID");
      				int f = frs.getInt("fare");
      				int arrival = frs.getInt("arr_time");
       				int dept = frs.getInt("dep_time");
      				
      				ResultSet tf2 = ft2.executeQuery("select TID from Takes where RID='" + r + "'");
      				tf2.next();
      				
      				int t = tf2.getInt("TID");
      				out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
      				//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$");
  					out.println("<br>");
      			}
      		}
   			if (sort.compareTo("arr_time") == 0){
     		 	Statement arr = con.createStatement();
     		 	Statement at2 = con.createStatement();
      			ResultSet ars = arr.executeQuery("select * from Route where originSID >='" + origin + "' AND destSID <='" + destination + "' ORDER BY arr_time ASC" );
      			while (ars.next()){
      				int r = ars.getInt("RID");
      				int o = ars.getInt("originSID");
      				int d = ars.getInt("destSID");
      				int f = ars.getInt("fare");
      				int arrival = ars.getInt("arr_time");
       				int dept = ars.getInt("dep_time");
      				
      				ResultSet ta2 = at2.executeQuery("select TID from Takes where RID='" + r + "'");
      				ta2.next();
      				
      				int t = ta2.getInt("TID");
      				out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
      				//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$");
  					out.println("<br>");
      			}
   			}
   	  	 	if (sort.compareTo("dep_time") == 0){
   	  			Statement dept = con.createStatement();
   	  			Statement dt2 = con.createStatement();
      			ResultSet drs = dept.executeQuery("select * from Route where originSID >='" + origin + "' AND destSID <='" + destination + "' ORDER BY dep_time ASC" );
	      		while (drs.next()){
	      			int r = drs.getInt("RID");
	      			int o = drs.getInt("originSID");
	      			int d = drs.getInt("destSID");
	      			int f = drs.getInt("fare");
	      			int arrival = drs.getInt("arr_time");
       				int dep = drs.getInt("dep_time");
	      			
	      			ResultSet td2 = dt2.executeQuery("select TID from Takes where RID='" + r + "'");
	      			td2.next();
	      			
	      			int t = td2.getInt("TID");
	      			out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dep + "\t" + "Fare: " + f + "$");
	      			//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$");
  					out.println("<br>");
	      		}
	      	}
	      	if (sort.compareTo("none") == 0){
	      		Statement none = con.createStatement();
	      		Statement nt2 = con.createStatement();
	      		ResultSet nrs = none.executeQuery("select * from Route where originSID >='" + origin + "' AND destSID <='" + destination + "'" );
	      		while (nrs.next()){
	      			int r = nrs.getInt("RID");
	      			int o = nrs.getInt("originSID");
	      			int d = nrs.getInt("destSID");
	      			int f = nrs.getInt("fare");
	      			int arrival = nrs.getInt("arr_time");
       				int dept = nrs.getInt("dep_time");
       				
	      			ResultSet tn2 = nt2.executeQuery("select TID from Takes where RID='" + r + "'");
	      			tn2.next();
	      			
	      			int t = tn2.getInt("TID");
	      			
	      			out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Arrival: " + arrival + "\t" + "Departure: " + "\t" + dept + "\t" + "Fare: " + f + "$");
	      			//out.println("Train Number: " + t + "\t" + "Route: " + r + "\t" + "Origin: " + o + "\t" + "Destination: " +  d + "\t" + "Fare: " + f + "$");
  					out.println("<br>");
	      		}
   	  	 	}	
      		else{ out.println("<br>");
      		}
       	}
       		out.println("<a href='route.jsp'>Route Information</a>");
		    out.println("<br>");
		    out.println("<a href = 'station.jsp'>Station Information</a>");
		    out.println("<br>");
		    out.println("<a href='search.jsp'>Return to Train Scheudle</a>");

    	}catch (SQLException e) {
         	e.printStackTrace();

		}catch (Exception s){
  			s.printStackTrace();
		}
	%>
	
	</body>
</html>