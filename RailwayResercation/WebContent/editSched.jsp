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
      	$.urlParam = function(){
  			var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  			return results[1] || 0;
  		}
      	function edit(){
      		alert(window.location.href);
      		//var rid = $.urlParam("rid"); // RID
      		var rid = <%= request.getParameter("rid")%>
      		
      		var arr = document.forms["editSched"]["arr"].value;
      		var dep = document.forms["editSched"]["dep"].value;

      
      		
      		var fare = document.forms["editSched"]["fare"].value;
      		var status = document.forms["editSched"]["status"].value;
      
      		var link = "http://localhost:8080/CS336GP30/Test2.jsp?rid="+rid+"&arr="+arr+"&dep="+dep+"&fare="+fare+"&status="+status+"&op=e";
 
      		window.location.href = link;
      		
      		
      		
      		return true;
      	}
      </script>
   </head>
   
   <body>
  
   <%    	
      		try
      		{
      			
	       		String rid = request.getParameter("rid");
	       		
	      		out.println("Current Reservation");
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
			    Statement st = con.createStatement();
			    ResultSet rs;
			    rs = st.executeQuery("select * from Route where RID = " + rid);
			   
			    out.println("<table>");
		        out.println("	<tr>");
		        out.println("		<th>Route Number</th>");
		        out.println("		<th>Arrival Time</th>");
	            out.println("		<th>Departure Time</th>");
	            out.println("		<th>Origin</th>");             
	            out.println("		<th>Destination</th>");
	            out.println("		<th>Fare</th>");
	            out.println("		<th>Status</th>");
	            out.println("	</tr>");
	            
	            
		        if (rs.next()) {		        	
		        	out.println("<tr>");
		            out.println("<th>"+rs.getInt("RID")+"</th>");
		            out.println("<th>"+rs.getString("arr_time")+"</th>");
		            out.println("<th>"+rs.getString("dep_time")+"</th>");
		            out.println("<th>"+rs.getString("originSID")+"</th>");       
		            out.println("<th>"+rs.getString("destSID")+"</th>");
		            out.println("<th>"+rs.getString("fare")+"</th>");
		            out.println("<th>"+rs.getString("status")+"</th>");
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
		<form name = "editSched" action="" method="POST">			
   		
   <br/>
   		   <label>Arrival Time (hh:mm:00):</label><input type="text" name="arr"/> <br/>
	       <label>Departure Time (hh:mm:00):</label><input type="text" name="dep"/> <br/>
	       
	       <label>Fare:</label><input type="text" name="fare" required/> <br/>
	       <label>Status</label><select name= "status" id = "status" ><option value = "ontime">On Time</option><option value = "delayed">Delayed</option> </select> <br/>
	       
		      	
		      	<input type="button" value="Edit" onclick= "return edit()" /> <br/>
		      	<a href='manageSchedule.jsp'>Back</a> <br/>
			</form>
   </body>
</html>




