<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.servletContext.contextPath}/favicon.ico" rel="icon" type="image/x-icon" />
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
<!--<link href="css/bootstrap.min.css" rel="stylesheet" />-->
<link
	href="${pageContext.servletContext.contextPath}/css/material-kit.css"
	rel="stylesheet" />
<link href="${pageContext.servletContext.contextPath}/css/template.css"
	rel="stylesheet" />
<!--以下請加入各自頁面的css-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>愛客宿-iCastle</title>
</head>
<body>
	<!--開始導覽列-->
	<jsp:include page="../fragment/nav.jsp" />
	<!--結束導覽列-->

	<div class="container" style="margin-top: 56px">
		<h1>業者資料審核</h1>

		<form action="CheckHotel.do" method="post">
		<!-- tab標籤頁 -->
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">所有飯店</a></li>
				<li><a href="#tabs-2">未通過審核的飯店</a></li>
				<li><a href="#tabs-3">已通過審核的飯店</a></li>
			</ul>
			<div id="tabs-1">
				<div class="accordion">
					<!-- 開始一家飯店 -->
					<c:forEach var="hotelandInfo" items="${hotelandInfos}">
						<h3>${hotelandInfo.hotelId} ${hotelandInfo.hotelName}</h3>
						<div>
							<table>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>飯店編號</td>
										<td>${hotelandInfo.hotelId}</td>
										<td>飯店名稱</td>
										<td>${hotelandInfo.hotelName}</td>
									</tr>
							   		<tr>
										<td>E-mail</td>
										<td>${hotelandInfo.email}</td>
										<td>密碼</td>
										<td>${hotelandInfo.pw}</td>
									</tr>
									<tr>
										<td>地址</td>
										<td>${hotelandInfo.addr}</td>
										<td>區域</td>
										<td>${hotelandInfo.zone}</td>
									</tr>
									<tr>
										<td>評分</td>
										<td>${hotelandInfo.point}</td>
										<td>熱門度</td>
										<td>${hotelandInfo.hot}</td>
									</tr>
									<tr> 
										<td>星級</td>
										<td>${hotelandInfo.star}</td>
										
									</tr>
									<tr>
										<td>登記證號</td>
										<td>${hotelandInfo.registerId}</td>
										<td>登記人姓名</td>
										<td>${hotelandInfo.registerName}</td>
									</tr>
									<tr>
										<td>電話</td>
										<td>${hotelandInfo.tel}</td>
										<td>官方網站</td>
										<td>${hotelandInfo.website}</td>
									</tr>
									<tr>
										<td>checkin時間</td>
										<td>${hotelandInfo.checkin}</td>
										<td>checkout時間</td>
										<td>${hotelandInfo.checkout}</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td style="width:100px">交通方式</td>
										<td>${hotelandInfo.transport}</td>
									</tr>
									<tr>
										<td>飯店介紹</td>
										<td>${hotelandInfo.hotelProfile}</td>
									</tr>
									
									<tr>
										<td>入住須知</td>
										<td>${hotelandInfo.guestPolicies}</td>
									</tr>
									<tr>
										<td>取消規定</td>
										<td>${hotelandInfo.cancelPolicies}</td>
									</tr>
									<tr>
										<td>設施</td>
										<td>
											<input type="checkbox" name="roomWifi" disabled 
												<c:if test="${hotelandInfo.roomWifi == true}">
													checked
												</c:if>
											/>室內wifi
											<input type="checkbox" name="hallWifi" disabled
												<c:if test="${hotelandInfo.hallWifi == true}">
													checked
												</c:if>
											/>大廳wifi
											<input type="checkbox" name="internet" disabled
												<c:if test="${hotelandInfo.internet == true}">
													checked
												</c:if>
											/>網際網路
											<input type="checkbox" name="mineralWater" disabled
												<c:if test="${hotelandInfo.mineralWater == true}">
													checked
												</c:if> 
											/>礦泉水
											<input type="checkbox" name="toiletUtensils" disabled
												<c:if test="${hotelandInfo.toiletUtensils == true}">
													checked
												</c:if>
											/>盥洗用具
											<input type="checkbox" name="hairDryer" disabled
												<c:if test="${hotelandInfo.hairDryer == true}">
													checked
												</c:if>
											/>吹風機
											<input type="checkbox" name="tv" disabled
												<c:if test="${hotelandInfo.tv == true}">
													checked
												</c:if>
											/>電視
											<input type="checkbox" name="gameRoom" disabled
												<c:if test="${hotelandInfo.gameRoom == true}">
													checked
												</c:if>
											/>遊戲室
											<input type="checkbox" name="gym" disabled
												<c:if test="${hotelandInfo.gym == true}">
													checked
												</c:if>
											/>健身房
											<input type="checkbox" name="spa" disabled
												<c:if test="${hotelandInfo.spa == true}">
													checked
												</c:if>
											/>溫泉
											<input type="checkbox" name="swimPool" disabled
												<c:if test="${hotelandInfo.swimPool == true}">
													checked
												</c:if>
											/>游泳池
										</td>
									</tr>
								</tbody>
							</table> 
							<table>
								<tbody>
									<tr>
										<td>審核狀態 </td>
										<c:choose>
											<c:when test="${hotelandInfo.hotelState == 0}">
												<td>
													未通過審核
												</td>
											</c:when>
											<c:otherwise>
												<td>
													已通過審核
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</tbody>
							</table> 
							
						</div>
					</c:forEach>
					<!-- 結束一家飯店 -->
				</div>
			</div><!--tabs-1結束 -->
			<div id="tabs-2">
			 	<div class="accordion">
			 		<c:set var="count" value="0"/>
					<!-- 開始一家飯店 -->
					<c:forEach var="hotelandInfo" items="${hotelandInfos}">
					<c:if test="${hotelandInfo.hotelState == 0}">
						<c:set var="count" value="${count = count+1}"/>
						<h3>${hotelandInfo.hotelId} ${hotelandInfo.hotelName}</h3>
						<div>
							<table>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>飯店編號</td>
										<td>${hotelandInfo.hotelId}</td>
										<td>飯店名稱</td>
										<td>${hotelandInfo.hotelName}</td>
									</tr>
							   		<tr>
										<td>E-mail</td>
										<td>${hotelandInfo.email}</td>
										<td>密碼</td>
										<td>${hotelandInfo.pw}</td>
									</tr>
									<tr>
										<td>地址</td>
										<td>${hotelandInfo.addr}</td>
										<td>區域</td>
										<td>${hotelandInfo.zone}</td>
									</tr>
									<tr>
										<td>評分</td>
										<td>${hotelandInfo.point}</td>
										<td>熱門度</td>
										<td>${hotelandInfo.hot}</td>
									</tr>
									<tr> 
										<td>星級</td>
										<td>${hotelandInfo.star}</td>
										
									</tr>
									<tr>
										<td>登記證號</td>
										<td>${hotelandInfo.registerId}</td>
										<td>登記人姓名</td>
										<td>${hotelandInfo.registerName}</td>
									</tr>
									<tr>
										<td>電話</td>
										<td>${hotelandInfo.tel}</td>
										<td>官方網站</td>
										<td>${hotelandInfo.website}</td>
									</tr>
									<tr>
										<td>checkin時間</td>
										<td>${hotelandInfo.checkin}</td>
										<td>checkout時間</td>
										<td>${hotelandInfo.checkout}</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td style="width:100px">交通方式</td>
										<td>${hotelandInfo.transport}</td>
									</tr>
									<tr>
										<td>飯店介紹</td>
										<td>${hotelandInfo.hotelProfile}</td>
									</tr>
									
									<tr>
										<td>入住須知</td>
										<td>${hotelandInfo.guestPolicies}</td>
									</tr>
									<tr>
										<td>取消規定</td>
										<td>${hotelandInfo.cancelPolicies}</td>
									</tr>
									<tr>
										<td>設施</td>
										<td>
											<input type="checkbox" name="roomWifi" disabled 
												<c:if test="${hotelandInfo.roomWifi == true}">
													checked
												</c:if>
											/>室內wifi
											<input type="checkbox" name="hallWifi" disabled
												<c:if test="${hotelandInfo.hallWifi == true}">
													checked
												</c:if>
											/>大廳wifi
											<input type="checkbox" name="internet" disabled
												<c:if test="${hotelandInfo.internet == true}">
													checked
												</c:if>
											/>網際網路
											<input type="checkbox" name="mineralWater" disabled
												<c:if test="${hotelandInfo.mineralWater == true}">
													checked
												</c:if> 
											/>礦泉水
											<input type="checkbox" name="toiletUtensils" disabled
												<c:if test="${hotelandInfo.toiletUtensils == true}">
													checked
												</c:if>
											/>盥洗用具
											<input type="checkbox" name="hairDryer" disabled
												<c:if test="${hotelandInfo.hairDryer == true}">
													checked
												</c:if>
											/>吹風機
											<input type="checkbox" name="tv" disabled
												<c:if test="${hotelandInfo.tv == true}">
													checked
												</c:if>
											/>電視
											<input type="checkbox" name="gameRoom" disabled
												<c:if test="${hotelandInfo.gameRoom == true}">
													checked
												</c:if>
											/>遊戲室
											<input type="checkbox" name="gym" disabled
												<c:if test="${hotelandInfo.gym == true}">
													checked
												</c:if>
											/>健身房
											<input type="checkbox" name="spa" disabled
												<c:if test="${hotelandInfo.spa == true}">
													checked
												</c:if>
											/>溫泉
											<input type="checkbox" name="swimPool" disabled
												<c:if test="${hotelandInfo.swimPool == true}">
													checked
												</c:if>
											/>游泳池
										</td>
									</tr>
								</tbody>
							</table> 
							<table>
								<tbody>
									<tr>
										<td>審核狀態 </td>
											<td>
												未通過審核
											</td>
											<td> 
											    <label for="pass${hotelandInfo.hotelId}">審核通過</label>
	  											<input type="checkbox" class="checkbox" name="pass" id="pass${hotelandInfo.hotelId}" value="${hotelandInfo.hotelId}">
											</td>
									</tr>
								</tbody>
							</table> 
						</div>
					</c:if>
					</c:forEach>
					<!-- 結束一家飯店 -->
					<c:if test="${count == 0}">
						無搜尋結果
					</c:if>
				</div>

			</div>
			<div id="tabs-3">
				<div class="accordion">
			 		<c:set var="count" value="0"/>
					<!-- 開始一家飯店 -->
					<c:forEach var="hotelandInfo" items="${hotelandInfos}">
					<c:if test="${hotelandInfo.hotelState == 1}">
						<c:set var="count" value="${count = count+1}"/>
						<h3>${hotelandInfo.hotelId} ${hotelandInfo.hotelName}</h3>
						<div>
							<table>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>飯店編號</td>
										<td>${hotelandInfo.hotelId}</td>
										<td>飯店名稱</td>
										<td>${hotelandInfo.hotelName}</td>
									</tr>
							   		<tr>
										<td>E-mail</td>
										<td>${hotelandInfo.email}</td>
										<td>密碼</td>
										<td>${hotelandInfo.pw}</td>
									</tr>
									<tr>
										<td>地址</td>
										<td>${hotelandInfo.addr}</td>
										<td>區域</td>
										<td>${hotelandInfo.zone}</td>
									</tr>
									<tr>
										<td>評分</td>
										<td>${hotelandInfo.point}</td>
										<td>熱門度</td>
										<td>${hotelandInfo.hot}</td>
									</tr>
									<tr> 
										<td>星級</td>
										<td>${hotelandInfo.star}</td>
										
									</tr>
									<tr>
										<td>登記證號</td>
										<td>${hotelandInfo.registerId}</td>
										<td>登記人姓名</td>
										<td>${hotelandInfo.registerName}</td>
									</tr>
									<tr>
										<td>電話</td>
										<td>${hotelandInfo.tel}</td>
										<td>官方網站</td>
										<td>${hotelandInfo.website}</td>
									</tr>
									<tr>
										<td>checkin時間</td>
										<td>${hotelandInfo.checkin}</td>
										<td>checkout時間</td>
										<td>${hotelandInfo.checkout}</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td style="width:100px">交通方式</td>
										<td>${hotelandInfo.transport}</td>
									</tr>
									<tr>
										<td>飯店介紹</td>
										<td>${hotelandInfo.hotelProfile}</td>
									</tr>
									
									<tr>
										<td>入住須知</td>
										<td>${hotelandInfo.guestPolicies}</td>
									</tr>
									<tr>
										<td>取消規定</td>
										<td>${hotelandInfo.cancelPolicies}</td>
									</tr>
									<tr>
										<td>設施</td>
										<td>
											<input type="checkbox" name="roomWifi" disabled 
												<c:if test="${hotelandInfo.roomWifi == true}">
													checked
												</c:if>
											/>室內wifi
											<input type="checkbox" name="hallWifi" disabled
												<c:if test="${hotelandInfo.hallWifi == true}">
													checked
												</c:if>
											/>大廳wifi
											<input type="checkbox" name="internet" disabled
												<c:if test="${hotelandInfo.internet == true}">
													checked
												</c:if>
											/>網際網路
											<input type="checkbox" name="mineralWater" disabled
												<c:if test="${hotelandInfo.mineralWater == true}">
													checked
												</c:if> 
											/>礦泉水
											<input type="checkbox" name="toiletUtensils" disabled
												<c:if test="${hotelandInfo.toiletUtensils == true}">
													checked
												</c:if>
											/>盥洗用具
											<input type="checkbox" name="hairDryer" disabled
												<c:if test="${hotelandInfo.hairDryer == true}">
													checked
												</c:if>
											/>吹風機
											<input type="checkbox" name="tv" disabled
												<c:if test="${hotelandInfo.tv == true}">
													checked
												</c:if>
											/>電視
											<input type="checkbox" name="gameRoom" disabled
												<c:if test="${hotelandInfo.gameRoom == true}">
													checked
												</c:if>
											/>遊戲室
											<input type="checkbox" name="gym" disabled
												<c:if test="${hotelandInfo.gym == true}">
													checked
												</c:if>
											/>健身房
											<input type="checkbox" name="spa" disabled
												<c:if test="${hotelandInfo.spa == true}">
													checked
												</c:if>
											/>溫泉
											<input type="checkbox" name="swimPool" disabled
												<c:if test="${hotelandInfo.swimPool == true}">
													checked
												</c:if>
											/>游泳池
										</td>
									</tr>
								</tbody>
							</table> 
							<table>
								<tbody>
									<tr>
										<td>審核狀態 </td>
											<td>
												已通過審核
											</td>
											<td> 
											    <label for="suspend${hotelandInfo.hotelId}">停權</label>
	  											<input type="checkbox" class="checkbox" name="suspend" id="suspend${hotelandInfo.hotelId}" value="${hotelandInfo.hotelId}">
											</td>
									</tr>
								</tbody>
							</table> 
						</div>
					</c:if>
					</c:forEach>
					<!-- 結束一家飯店 -->
					<c:if test="${count == 0}">
						無搜尋結果
					</c:if>
				</div>
			</div>
			
		</div>
		<button class="btn btn-default" type="submit">送出修改</button>
		</form>
	</div>

	<!--開始footer-->
	<jsp:include page="../fragment/footer.jsp" />
	<!--結束footer-->
</body>
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/material.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/nouislider.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap-datepicker.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/material-kit.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$( ".checkbox" ).checkboxradio();
		$(".accordion").accordion();
		$("#tabs").tabs();
		$("#tabs").tabs("option", "active", 0);
	});
</script>
</html>