<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
   <head>
   		
<meta charset="UTF-8">
      <title>Login Form</title>
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
      <link rel="stylesheet" href="styles.css">
   </head>
   
   <body>
   		<%
      		
      		Connection con = null;
      		Class.forName("com.mysql.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
    	   	Statement st = con.createStatement();
    	   	ResultSet rs;
      		try
      		{
      				out.println("<table id='res'>");
      		        out.println("	<tr>");
      		        out.println("		<th>Route ID</th>");
      		        out.println("		<th>Arrival Time</th>");
      	            out.println("		<th>Departure Time</th>");
      	            out.println("		<th>Origin</th>");             
      	            out.println("		<th>Destination</th>");
      	            out.println("		<th>Fare</th>");
      	            out.println("		<th>Status</th>");
      	            out.println("	</tr>");
      			   rs = st.executeQuery("select * from Route");
      			   while(rs.next()){
      				 	String rid = rs.getString("RID");

     	        		out.println("<tr>");
     	           		out.println("<th>"+rs.getInt("RID")+"</th>");
     	            	out.println("<th>"+rs.getString("arr_time")+"</th>");
     	         	    out.println("<th>"+rs.getString("dep_time")+"</th>");
     	          		out.println("<th>"+rs.getString("originSID")+"</th>");       
     	            	out.println("<th>"+rs.getString("destSID")+"</th>");
     	          	  	out.println("<th>"+rs.getString("fare")+"</th>");
     	            	out.println("<th>"+rs.getString("status")+"</th>");
     	            	out.println("<th><a href=editSched.jsp?rid="+rid+"&op=e>Edit</a></th>");
     	            	out.println("<th>|</th>");
     	            	out.println("<th><a href=Test2.jsp?rid="+rid+"&op=d>Delete</a></th>");
     	            	out.println("</tr>");		    
      			   }
      			con.close();
      			out.println("</table>");
      			
      		}
      		catch(Exception e)
      		{
      			System.out.print(e);
      			e.printStackTrace();
      		}
			
   	%>
   
   <a href='manageSchedule.jsp'>back </a><br/>
     
   
   </body>
   <a href='addSched.jsp'>Add Schedule </a>
   
   
</html>