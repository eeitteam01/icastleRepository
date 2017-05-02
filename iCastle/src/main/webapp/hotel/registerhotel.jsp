<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!--<link href="../css/bootstrap.min.css" rel="stylesheet" />-->
<link href="../css/material-kit.css" rel="stylesheet" />
<link href="../css/template.css" rel="stylesheet" />
<!--以下請加入各自頁面的css-->
<link href="../css/registerhotel.css" rel="stylesheet" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<title>愛客宿-iCastle</title>
</head>
<body>
	<!--開始導覽列-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"height:55px;">
		<div class="container-fluid">
			<!--logo-->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp"> <img alt="Brand"
					height="30" src="../img/logo.png" />
				</a>
			</div>
			<!--結束logo-->
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="../index.jsp">首頁</a></li>
					<li><a href="#">活動</a></li>
					<li><a href="#">討論區</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-cog"></span>會員中心</a>
					</li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							登入</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							登出</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--結束導覽列-->

<!-- 本頁內容從這裡開始 -->
	<div class="container"
		style="background-color: white; padding-bottom: 100px;">
		<h1>業者註冊</h1>
	
		<form action="Registerhotel.do" method="post">
		<table class="">
			<tbody>
			<tr>
				<td>飯店名稱</td>
				<td><input type="text" name="hotelName"/>${errMap.hotelNameErr}</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email" />${errMap.emailErr}</td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><input type="password" name="pw" />${errMap.pwErr}</td>
			</tr>
			<tr>
				<td>確認密碼</td>
				<td><input type="password" name="pwcheck" />${errMap.pwcheckErr}</td>
			</tr>
			<tr>
				<td>登記人姓名</td>
				<td><input type="text" name="registerName" />${errMap.registerNameErr}</td>
			</tr>
			<tr>
				<td>登記證號</td>
				<td><input type="text" name="registerId" />${errMap.registerIdErr}</td>
			</tr>
			<tr>
				<td>連絡電話</td>
				<td><input type="text" name="tel" />${errMap.telErr}</td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="addr"/>${errMap.addrErr}</td>
			</tr>
			<tr>
				<td>地區</td>
				<td><input type="text" name="zone"/>${errMap.zoneErr}</td>
			</tr>
			<tr>
				<td>交通方式</td>
				<td><textarea name="transport"></textarea>${errMap.transportErr}</td>
			</tr>
			<tr>
				<td>官方網站</td>
				<td><input type="text" name="website"/>${errMap.websiteErr}</td>
			</tr>
			<tr>
				<td>上傳照片</td>
				<td><input type="file" name="photo"/></td>
			</tr>
			<tr>
				<td>飯店介紹</td>
				<td><textarea name="hotelProfile"></textarea>${errMap.hotelProfileErr}</td>
			</tr>
			<tr>
				<td>Check-in時間</td>
				<td><input type="text" class="timepicker1" name="checkin"/>${errMap.checkinErr}</td>
			</tr>
			<tr>
				<td>Check-out時間</td>
				<td><input type="text" class="timepicker2" name="checkout"/>${errMap.checkoutErr}</td>
			</tr>
			<tr>
				<td>入住須知</td>
				<td><textarea name="guestPolicies"></textarea>${errMap.guestPoliciesErr}</td>
			</tr>
			<tr>
				<td>取消規定</td> 
				<td><textarea name="cancelPolicies"></textarea>${errMap.cancelPoliciesErr}</td>
			</tr>
			<tr>
				<td>設施</td>
				<td>
					<input type="checkbox" name="roomWifi"/>室內wifi
					<input type="checkbox" name="hallWifi"/>大廳wifi
					<input type="checkbox" name="internet"/>網際網路
					<input type="checkbox" name="mineralWater"/>礦泉水
					<input type="checkbox" name="toiletUtensils"/>盥洗用具
					<input type="checkbox" name="hairDryer"/>吹風機
					<input type="checkbox" name="tv"/>電視
					<input type="checkbox" name="gameRoom"/>遊戲室
					<input type="checkbox" name="gym"/>健身房
					<input type="checkbox" name="spa"/>溫泉
					<input type="checkbox" name="swimPool"/>游泳池
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="送出"></td>
				<td><input type="submit" value="清除"></td>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
<!-- 本頁內容結束 -->

	<!--footer-->
	<div class="footer">
		<img src="../img/logo.png" width="100" />
		<h6>版權所有©2005 – 2017, iCastle Company Pte. Ltd.保留所有權利</h6>
		<h6>iCastle.com隸屬於Priceline集團—線上旅遊業及相關服務的全球領導品牌。</h6>
	</div>
	<!--結束footer-->

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/material.min.js"></script>

	<script src="../js/material-kit.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script>
		$('.timepicker1').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 60,
		    minTime: '1:00pm',
		    maxTime: '11:00pm',
		    defaultTime: '6:00pm',
		    startTime: '0:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
		$('.timepicker2').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 60,
		    minTime: '6',
		    maxTime: '12',
		    defaultTime: '10',
		    startTime: '0:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	</script>
</body>
</html>