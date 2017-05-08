<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>會員中心</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!--<link href="css/bootstrap.min.css" rel="stylesheet" />-->
<link
	href="${pageContext.servletContext.contextPath}/css/paper-dashboard.css"
	rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->

<link
	href="${pageContext.servletContext.contextPath}/css/animate.min.css"
	rel="stylesheet" />
<!-- Animation library for notifications   -->

<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Bootstrap core CSS     -->


<!--  Fonts and icons     -->
<!--     <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"> -->
<!--     <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'> -->
<link
	href="${pageContext.servletContext.contextPath}/css/themify-icons.css"
	rel="stylesheet">
<style>
.ti-text {
	
}

.box{
background:green;
margin:10px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- ====	下方為左側菜單 -->
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">
			<!-- 菜單文字符合邊界 -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="http://www.creative-tim.com" class="simple-text">
						Creative Tim </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="dashboard.html"> <i
							class="ti-panel"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="user.html"> <i class="ti-user"></i>
							<p>User Profile</p>
					</a></li>
					<li><a href="table.html"> <i class="ti-view-list-alt"></i>
							<p>Table List</p>
					</a></li>
					<li><a href="typography.html"> <i class="ti-text"></i>
							<p>Typography</p>
					</a></li>
					<li><a href="icons.html"> <i class="ti-pencil-alt2"></i>
							<p>Icons</p>
					</a></li>
					<li><a href="maps.html"> <i class="ti-map"></i>
							<p>Maps</p>
					</a></li>
					<li><a href="notifications.html"> <i class="ti-bell"></i>
							<p>Notifications</p>
					</a></li>
					<li class="active-pro"><a href="upgrade.html"> <i
							class="ti-export"></i>
							<p>Upgrade to PRO</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="#"></a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="ti-panel"></i>
								<p>Stats</p>
						</a></li>
						<li><a href="#"> <i class="ti-settings"></i>
								<p>Settings</p>
						</a></li>
					</ul>

				</div>
			</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card" style="height: 500pt">
								<div class="header">
									<h4 class="title">帝王飯店</h4>
									<p class="category">新北市</p>
								</div>
								<div class="content">
									<div id="chartHours" class="ct-chart">
									
									<div class="box" >
									00
									</div>
										<!-- 	插入圖片 -->

									</div>
									<div class="footer">
										<div class="stats">Updated 3 minutes ago</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>

					<li><a href="oooooo"> 關於 </a></li>
					<li><a href="oooooo"> 評論 </a></li>
					<li><a href="http://www.creative-tim.com/license">Licenses
					</a></li>
				</ul>
				</nav>
				<div class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					, made with <i class="fa fa-heart heart"></i> by <a href="oooooo">愛客宿
						iCastle</a>
				</div>
			</div>
			</footer>

		</div>
	</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>
</body>
<!--   Core JS Files   -->
<script
	src="${pageContext.servletContext.contextPath}/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
</html>