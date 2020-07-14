<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
   <head>
   		
<meta charset="UTF-8">
      <title>Login Form</title>
      <link rel="stylesheet" href="styles.css">
       <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
      <script  type = "text/javascript">
      $.urlParam = function(name){
    		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    		return results[1] || 0;
    	}
      
      	function edit(){
      		
      		var resNum = $.urlParam('resNum'); // name
            var oldSeat = $.urlParam('oldSeat');
      		
			var tlid = document.getElementById("tlid").value;
      		
      		var origin = document.getElementById("og_id").value;
      		var dest = document.getElementById("ds_id").value;
      		
      		var tripType = document.getElementById("tripType").value;
    
      		var date = document.forms["addRes"]["date"].value;
     		var discount = document.getElementById("discount").value;
      
      		
      		var seatNum = document.forms["addRes"]["seatNum"].value;
      		var ctype = document.getElementById("ctype").value;
      
      		var link = "http://localhost:8080/CS336GP30/Test.jsp?resNum="+resNum+"&date="+date+ "&seatNum="+seatNum+"&tlid=" +tlid+ "&origin=" +origin+ "&ctype=" +ctype+ "&dest=" +dest+ "&oldSeat=" +oldSeat+ "&tripType=" +tripType+ "&discount="  +discount+"&op=e";
 
      		window.location.href = link;
      		
      		
      		
      		return true;
      	}
      </script>
   </head>
   
   
   <body>
  
   <%    	
      		try
      		{
      			
	       		String resNum = request.getParameter("resNum");
	       		String oldSeat = request.getParameter("oldSeat");
		
	      		out.println("Current Reservation");
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
			    Statement st = con.createStatement();
			    ResultSet rs;
			    rs = st.executeQuery("select * from Reservation where res_number = " + resNum);
			   
			    out.println("<table>");
		        out.println("	<tr>");
		        out.println("		<th>Reservation Number</th>");
		        out.println("		<th>Fare amount</th>");
	            out.println("		<th>Date</th>");
	            out.println("		<th>Seat Number</th>");             
	            out.println("		<th>Origin</th>");
	            out.println("		<th>Destination</th>");
	            out.println("		<th>Discount</th>");
	            out.println("		<th>Trip Type</th>");
	            out.println("		<th>Train</th>");

	            out.println("	</tr>");
	            
	            
		        if (rs.next()) {		        	
		        	out.println("<tr>");
		            out.println("<th>"+rs.getInt("res_number")+"</th>");
		            out.println("<th>"+rs.getInt("total_fare")+"</th>");
		            out.println("<th>"+rs.getString("date")+"</th>");
		            out.println("<th>"+rs.getString("seat_number")+"</th>");       
		            out.println("<th>"+rs.getString("origin")+"</th>");
		            out.println("<th>"+rs.getString("destination")+"</th>");
		            out.println("<th>"+rs.getString("discount")+"</th>");
		            out.println("<th>"+rs.getString("trip_type")+"</th>");
		            out.println("<th>"+rs.getString("seat_TID")+"</th>");


		            out.println("</tr>");	
		            
		            
		        }
		        con.close();
      		}
      		catch(Exception e)
      		{
	      		System.out.print(e);
	      		e.printStackTrace();
      		}

   
      		%>
      		
      		<br/>
      		Please Input Updated Fields
			<br/>	
		<form name = "addRes" action="" method="POST">			
   		<label>Transit Line</label>
   			<%
      try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from TransitLine");
            if (rs.next()) {
                out.println("<select name = tlid id = tlid>");
                out.println("<option value = " + rs.getString("TLID")+">"+ rs.getString("name")+"</option>");
                while(rs.next()){
                    out.println("<option value = " + rs.getString("TLID")+">"+ rs.getString("name")+"</option>");
                }
                out.println("</select>");
            } 
        }catch (SQLException e) {
                out.print(e.getStackTrace());

        }catch (Exception s){
        out.print(s);
        }
   %>
   <br/>
   
   <label>Origin</label>
   			<%
   			
   		  try {

              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
              Statement st = con.createStatement();
              ResultSet rs;
         	  rs = st.executeQuery("SELECT s.city as name, s.SID as sid FROM Station s");
              if (rs.next()) {
                          out.println("<select name = og_id id = og_id>");
                  out.println("<option value = " + rs.getString("SID")+">"+ rs.getString("name")+"</option>");
                  while(rs.next()){
                      out.println("<option value = " + rs.getString("SID")+">"+ rs.getString("name")+"</option>");
                  }
                  out.println("</select>");
              } 
          }catch (SQLException e) {
                  out.print(e.getStackTrace());

          }catch (Exception s){
          out.print(s);
          }

   %>
   <br/>
   <label>Destination</label>
   			<%
   			
   		  try {

              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
              Statement st = con.createStatement();
              ResultSet rs;
         	  rs = st.executeQuery("SELECT s.city as name, s.SID as sid FROM Station s");
              if (rs.next()) {
                          out.println("<select name = ds_id id = ds_id>");
                  out.println("<option value = " + rs.getString("SID")+">"+ rs.getString("name")+"</option>");
                  while(rs.next()){
                      out.println("<option value = " + rs.getString("SID")+">"+ rs.getString("name")+"</option>");
                  }
                  out.println("</select>");
              } 
          }catch (SQLException e) {
                  out.print(e.getStackTrace());

          }catch (Exception s){
          out.print(s);
          }

   %>
   <br/>
   		   <label>Trip Type</label><select name= "tripType" id = "tripType" ><option value = "one way">One Way</option><option value = "round">Round</option> </select> <br/>
   		   <label>Discount</label><select name= "discount" id = "discount" ><option value = "no">None</option><option value = "yes">Handicap</option><option value = "yes">Elderly</option><option value = "yes">Child</option> </select> <br/>
	       <label>Date (yyyy-mm-dd):</label><input type="date" name="date"/> <br/>
	       <label>Seat Number:</label><input type="text" name="seatNum" required/> <br/>
	       <label>Class</label><select name= "ctype" id = "ctype" ><option value = "first">First Class</option><option value = "business">Business</option><option value = "eco">Economical</option> </select> <br/>
	       
		      	
		      	<input type="button" value="Edit" onclick= "return edit()" /> <br/>
		      	<a href='manageReservation.jsp'>Back</a> <br/>
			</form>
   </body>
   
</html>