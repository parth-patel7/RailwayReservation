<!DOCTYPE html>
<html>
<head>
	<style>
		.title {
			background-color: #da7878;
			border: 1px solid #ffffff;
			border-radius: 1px;
			padding: 16px 10px;
			display: inline-block;
			margin-top: 10px;
			color: white;
			text-decoration:none;
			width:90%;
		}

		body {
			background: #c0c0d6;
			font-weight: 300;
			line-height: 1.5em;
			font-size: 16px;
			margin:0;
			display:block;
		}
		div {
			align: center            ;
		}

		a.res {
			border: 1px solid #ffffff;
			border-radius: 5px;
			padding: 16px 10px;
			display: inline-block;
			margin-top: 10px;
			color: white;
			text-decoration:none;
			background: #0868af;
			width:90%;
		}
		.content {
			padding: 100px 100px 100px 100px;
			max-width: 600px;
			margin:auto;
		}

		.logout{
			padding: 10px;
		}

	</style>
	<script type = "text/javascript">
		function logout(){
			window.location = "index.jsp";
		}
		function validate(){

		}
	</script>
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body class="content">
<div align="center">
	<div class ="title"><h1> Welcome Customer Rep</h1></div>
	<div class="a">
		<a class = "res" href='manageReservation.jsp'>Manage Reservations</a>
	</div>
	<div>
		<a class="res" href='manageSchedule.jsp'>Manage Train Schedules</a>
	</div>
	<div>
		<a class="res" href='manageCustomer.jsp'>Manage Customers</a>
	</div>
</div>

<div class="logout">
	<a href='logout.jsp'>Log out</a>
</div>

</body>
</html>