<!DOCTYPE html>
<html>
	<body>
	<h3>Train Information</h3>
	<form action = "searchresult.jsp" method = "POST">
	
	<div>
         <label for="date">Date of Travel</label><br/>
         <input type="date" name="date" id="date" placeholder= "yyyy-mm-dd"required ><br/>
    </div><br/>
	<div>
         <label for="origin">Enter Origin</label>
              <select name = "origin" id = "origin" >
                     <option label="Nutley" value="1" ></option>
                     <option label="Brooklyn" value="2"></option>
                     <option label="Hartford" value="3"></option>
                     <option label="Boston" value="6"></option>
                     <option label="Jersey City" value="4" ></option>
                     <option label="Edison" value="5"></option>
                     <option label="Trenton" value="9" ></option>
                     <option label="Bronx" value="8"></option>
                     <option label="Manhatten" value="7"></option>
                     <option label="Pittsburg" value="10"></option>
                     <option label="Cleveland" value="11"></option>
                     <option label="LosAngeles" value="12"></option>
                     <option label="SanDiego" value="13"></option>
                     <option label="Fresno" value="14"></option>
                     <option label="LasVegas" value="15"></option>
					 <option label="Houston" value="16"></option>
                     <option label="Austin" value="17"></option>
                     <option label="Dallas" value="18"></option>
                     <option label="Miami" value="19"></option>
                     <option label="Orlando" value="20"></option>
                     <option label="Tampa" value="21"></option>
                     <option label="Naples" value="22"></option>
                     <option label="Destin" value="23"></option>
                     <option label="Detroit" value="24"></option>
                     <option label="Lansing" value="25"></option>
                     <option label="AnnArbor" value="26"></option>
                     <option label="Flint" value="27"></option>
                     <option label="Alepna" value="28"></option>
                     <option label="RoyalOak" value="29"></option>
              </select>
      </div><br/>
      <div>
             <label for="dest">Enter Destination</label>
                 <select name = "dest" id = "dest" >
                     <option label="Nutley" value="1" ></option>
                     <option label="Brooklyn" value="2"></option>
                     <option label="Hartford" value="3"></option>
                     <option label="Boston" value="6"></option>
                     <option label="Jersey City" value="4" ></option>
                     <option label="Edison" value="5"></option>
                     <option label="Trenton" value="9" ></option>
                     <option label="Bronx" value="8"></option>
                     <option label="Manhatten" value="7"></option>
                     <option label="Pittsburg" value="10"></option>
                     <option label="Cleveland" value="11"></option>
                     <option label="LosAngeles" value="12"></option>
                     <option label="SanDiego" value="13"></option>
                     <option label="Fresno" value="14"></option>
                     <option label="LasVegas" value="15"></option>
					 <option label="Houston" value="16"></option>
                     <option label="Austin" value="17"></option>
                     <option label="Dallas" value="18"></option>
                     <option label="Miami" value="19"></option>
                     <option label="Orlando" value="20"></option>
                     <option label="Tampa" value="21"></option>
                     <option label="Naples" value="22"></option>
                     <option label="Destin" value="23"></option>
                     <option label="Detroit" value="24"></option>
                     <option label="Lansing" value="25"></option>
                     <option label="AnnArbor" value="26"></option>
                     <option label="Flint" value="27"></option>
                     <option label="Alepna" value="28"></option>
                     <option label="RoyalOak" value="29"></option>
                 </select>
    </div><br/>
    <div>
           <label for="sort">Sort By</label>
               <select name = "sort" id = "sort" >
                   <option label="Departure Time" value="dep_time"></option>
                   <option label="Arrival Time" value="arr_time"></option>
                   <option label="Fare" value="fare" ></option>
                   <option label="None" value = "none"></option>
               </select>
    </div><br/>
	<input type = "submit" value = "SEARCH"/>
	</form>
	<a href = 'route.jsp'>Route Information</a>
	<br/>
	<a href = 'station.jsp'>Station Information</a>
	<br/>
	<a href = 'success.jsp'>Return to Main Page</a>
	
	</body>
</html>

