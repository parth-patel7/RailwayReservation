<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    
<html>
   <head>
   		
<meta charset="UTF-8">
      <title>Login Form</title>
      <link rel="stylesheet" href="styles.css">
      <script  type = "text/javascript">
      	function add(){
      		
      		var tlid = document.getElementById("tlid").value;
      		var user = document.forms["addRes"]["user"].value;

      		
      		var origin = document.getElementById("og_id").value;
      		var dest = document.getElementById("ds_id").value;
      		
      		var tripType = document.getElementById("tripType").value;
    
      		var date = document.forms["addRes"]["date"].value;
     		var discount = document.getElementById("discount").value;
      
      		
      		var seatNum = document.forms["addRes"]["seatNum"].value;
      		var ctype = document.getElementById("ctype").value;
      
      		var link = "http://localhost:8080/CS336GP30/Test.jsp?resNum=null&date="+date+ "&user="+user+"&seatNum="+seatNum+"&tlid=" +tlid+ "&origin=" +origin+ "&ctype=" +ctype+ "&dest=" +dest+ "&discount=" +discount+ "&tripType="  +tripType+"&op=a";
 
      		window.location.href = link;
      		
      		return true;
      	}
      </script>
   </head>
   
   <body>
   
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
   		   <label>Account Username:</label><input type="text" name="user" required/> <br/>	
   		   <label>Trip Type</label><select name= "tripType" id = "tripType" ><option value = "one way">One Way</option><option value = "round">Round</option> </select> <br/>
   		   <label>Discount</label><select name= "discount" id = "discount" ><option value = "no">None</option><option value = "yes">Handicap</option><option value = "yes">Elderly</option><option value = "yes">Child</option> </select> <br/>
	       <label>Date (yyyy-mm-dd):</label><input type="date" name="date"/> <br/>
	       <label>Seat Number:</label><input type="text" name="seatNum" required/> <br/>
	       <label>Class</label><select name= "ctype" id = "ctype" ><option value = "first">First Class</option><option value = "business">Business</option><option value = "eco">Economy</option> </select> <br/>
	       
	       <input type="button" value="Add" onclick= "return add()" /> <br/>

	       <a href='manageReservation.jsp'>Back</a> <br/>
	</form>
   </body>
</html>