<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<script>
      	function getRes(){

      		var trainNum = document.getElementById("trainNum").value;
      		var tlid = document.getElementById("tlid").value;
      		
      		var link = "http://localhost:8080/CS336GP30/displaySched3.jsp?trainNum="+trainNum+ "&tlid="+tlid;
      		 
      		window.location.href = link;
		   
      	}
      </script>
 
<body>
<%
out.println("Display Customers that have Reservations given Transit Line and Train Number");
%>
<br/>

<form name = "Display" action="displaySched.jsp" method="POST" onsubmit = "return getSched()">
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
   <label>Train</label>
   			<%
   			
   		  try {

              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
              Statement st = con.createStatement();
              ResultSet rs;
         	  rs = st.executeQuery("SELECT * FROM Train");
              if (rs.next()) {
                          out.println("<select name = trainNum id = trainNum>");
                  out.println("<option value = " + rs.getString("TID")+">"+ rs.getString("TID")+"</option>");
                  while(rs.next()){
                      out.println("<option value = " + rs.getString("TID")+">"+ rs.getString("TID")+"</option>");
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
   <input type="button" value="Display" onclick= "return getRes()" /> <br/>
   <br/>
   </form>
   Browse through Customer Questions
   <form name = "Reply" action="repMessage.jsp" method="POST"> 
       <input type="submit" value="Reply Customer Messages"/>
   </form>

	<a href='CustomerRep.jsp'>back </a>
	
</body>
</html>





