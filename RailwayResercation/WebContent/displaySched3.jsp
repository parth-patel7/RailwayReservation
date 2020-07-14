<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
   <head>
   		
<meta charset="UTF-8">
      <title>Customer List</title>
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
      		String tlid = request.getParameter("tlid");
   			String trainNum = request.getParameter("trainNum");
   		
      		Connection con = null;
      		Class.forName("com.mysql.jdbc.Driver");
          	con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
    	   	Statement st = con.createStatement();
    	   	ResultSet rs;
      		try
      		{
      				out.println("<table id = 'res'>");
      		        out.println("	<tr>");
      		        out.println("		<th>Account Username ID</th>");
      		        out.println("		<th>Reservation Number</th>");

      	            out.println("	</tr>");
      			   rs = st.executeQuery("select b.usernameBooks, b.res_numberBOOKS from Books b join Reservation res on b.res_numberBOOKS = res.res_number join Route r on r.originSID = res.origin and r.destSID = res.destination join isOn i on i.RID_isOn = r.RID where i.TLID = "+tlid+" and res.seat_TID = "+trainNum);
      			  
      			   if(rs.next()){
      					 out.println("<tr>");
	           			out.println("<th>"+rs.getString("usernameBOOKS")+"</th>");
	           			out.println("<th>"+rs.getString("res_numberBOOKS")+"</th>");
	            		out.println("</tr>");	
      				   
      			   		while(rs.next()){
   
     	        			out.println("<tr>");
     	           			out.println("<th>"+rs.getString("usernameBOOKS")+"</th>");
    	           			out.println("<th>"+rs.getString("res_numberBOOKS")+"</th>");
     	            		out.println("</tr>");		    
      			   		}
      			   }
      			   else{
      				   out.println("No such entries exist!");
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
   <br/>

   
   <a href='manageCustomer.jsp'>back </a><br/>
     
   
   </body>   
   
</html>