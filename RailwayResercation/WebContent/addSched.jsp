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
      		
      		var origin = document.getElementById("og_id").value;
      		var dest = document.getElementById("ds_id").value;
      		
      		var arr = document.forms["addSched"]["arrive"].value;
    
      		var dep = document.forms["addSched"]["depart"].value;
     		var fare = document.forms["addSched"]["fare"].value;
      
      		
      		var status = document.forms["addSched"]["status"].value;
      		
      		var rid = Math.floor((Math.random() * 100000) + 1);

      
      		var link = "http://localhost:8080/CS336GP30/Test2.jsp?rid="+rid+"&arr="+arr+"&tlid="+tlid+"&dep="+dep+"&fare=" +fare+ "&origin=" +origin+ "&status=" +status+ "&dest=" +dest+ "&op=a";
 			alert(link);
      		window.location.href = link;
      		
      		

      		return true;
      	}
      </script>
   </head>
   
   <body>
   
   		<form name = "addSched" action="" method="POST">
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
	       <label>Arrival Time(hh:mm:00):</label><input type="text" name="arrive"/> <br/>
	       <label>Departure Time(hh:mm:00)::</label><input type="text" name="depart"/> <br/>
	       
	       <label>Fare:</label><input type="text" name="fare" required/> <br/>
	       
	       <label>Status</label><select name= "status" id = "status" ><option value = "ontime">On Time</option><option value = "delayed">Delayed</option></select> <br/>
	       
	       <input type="button" value="Add" onclick= "return add()" /> <br/>

	       <a href='manageSchedule.jsp'>Back</a> <br/>
	</form>
   </body>
</html>