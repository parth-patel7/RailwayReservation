

<script>
      	function delete(resNum){
      		out.print("CLICKED");
      		Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://cs336group30.ckz1eq8dzegk.us-east-2.rds.amazonaws.com:3306/cs336Project","admin30","Cs3362020$");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery("DELETE FROM Reservation WHERE res_number = " + resNum);
      		
      	}
      </script>

<form name = "login" action="displayLoginDetails.jsp" method="POST" onsubmit = "return delete()">
       Reservation Number:<input type="text" name="resNum"/> <br/>
       <input type="button" value="Delete" onclick= "return delete(resNum)" /> <br/>
       <a href='manageReservation.jsp'>Back</a> <br/>
</form>