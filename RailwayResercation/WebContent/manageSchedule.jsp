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
      	function getSched(){

      		var origin = document.getElementById("og_id").value;
      		var dest = document.getElementById("ds_id").value;
      		
      		var link = "http://localhost:8080/CS336GP30/displaySched.jsp?origin="+origin+ "&dest="+dest+"&op=a";
      		 
      		window.location.href = link;
		   
      	}
      </script>
      <script>	
      	function getSched2(){
			var station = document.getElementById("station").value;
      		
      		var link = "http://localhost:8080/CS336GP30/displaySched.jsp?station="+station+"&op=b";
      		window.location.href = link;
      		
      	}
      </script>
<body>
<%
out.println("Display Scehdule given Origin and Destination");
%>
<br/>

<form name = "Display" action="displaySched.jsp" method="POST" onsubmit = "return getSched()">
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
       <input type="button" value="Display" onclick= "return getSched()" /> <br/>
</form>
	<br>
	<%
	out.println("Display Sechdule given Station");
	%>
	<br/>
	
<form>
      <label>Station</label>
   			<%
   			
   		  try {

              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
              Statement st = con.createStatement();
              ResultSet rs;
         	  rs = st.executeQuery("SELECT s.city as name, s.SID as sid FROM Station s");
              if (rs.next()) {
                          out.println("<select name = station id = station>");
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
       <input type="button" id=b2 value="Display" onclick="getSched2()" /> <br/>
</form>	
		
	<a href='addSched.jsp'>Add Schedule</a> <br/>
	<a href='displaySched2.jsp'>Edit or Delete a Schedule</a> <br/>
	<a href='CustomerRep.jsp'>back </a>
	
</body>
</html>





