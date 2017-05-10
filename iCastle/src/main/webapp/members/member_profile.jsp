<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
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
<!--<link href="css/bootstrap.min.css" rel="stylesheet" />-->
<link
	href="${pageContext.servletContext.contextPath}/css/material-kit.css"
	rel="stylesheet" />
<link href="${pageContext.servletContext.contextPath}/css/template.css"
	rel="stylesheet" />
<!--以下請加入各自頁面的css-->
<style>
.container {
	width: 1400px;
}
</style>

<title>愛客宿-iCastle</title>
</head>
<body>
	<!--開始導覽列-->
	<jsp:include page="../fragment/nav.jsp" />
	<!--結束導覽列-->

	<!--content here!!!!!!!!!!!!~~~~~~~~~~-->
	<div class="container" style="margin-top: 100px;">
		<div role="tabpanel">

			<!-- Nav tabs -->
<!-- 			<ul class="nav nav-tabs nav-justified" role="tablist"> -->
<!-- 				<li role="presentation" class="active"> -->
<!-- 					<a href="#home" aria-controls="home" role="tab" data-toggle="tab">會員資料</a></li> -->
<!-- 				<li role="presentation"> -->
<!-- 					<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">歷史訂單</a></li> -->
<!-- 			</ul> -->
			<ul class="nav nav-tabs  nav-justified" role="tablist" >
				<li role="presentation" class="active">
					<a href="#home" aria-controls="home" role="tab" data-toggle="tab">會員資料</a></li>
				<li role="presentation">
					<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">歷史訂單</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 會員資料頁籤 -->
				<div role="tabpanel" class="tab-pane active" id="home">
					<form
						action="${pageContext.servletContext.contextPath}/MemberInformationCentre.do"
						method="POST">
						<div class="form">
							<p>姓名:</p>
							<input class="form-control" placeholder="輸入姓名" name="nameId"
								value="${MemberLoginOK.name}" />
							<p>性別:</p>
							<div class="radio">
								<label><input type="radio" name="gender" value="男">男生</label>
								<label><input type="radio" name="gender" value="女">女生</label>
							</div>
							<p>生日:</p>
							<input class="form-control" placeholder="輸入生日" name="bdateId"
								value="${MemberLoginOK.bdate}" />
							<p>電話:</p>
							<input class="form-control" placeholder="輸入電話" name="telId"
								value="${MemberLoginOK.tel}" />
							<p>身分證號碼:</p>
							<input class="form-control" placeholder="輸入身分證" name="personId"
								value="${MemberLoginOK.personId}" />
							<p>護照號碼:</p>
							<input class="form-control" placeholder="輸入護照號碼"
								name="passportId" value="${MemberLoginOK.passport}" />
							<p>email:</p>
							<input class="form-control" placeholder="輸入email" name="email"
								value="${MemberLoginOK.email}" />
							<p>密碼:</p>
							<input class="form-control" placeholder="輸入密碼" name="pw"
								value="${MemberLoginOK.pw}" />
							<p>國家:</p>
							<input class="form-control" placeholder="輸入國家" name="country"
								value="${MemberLoginOK.country}" />
							<p>地址:</p>
							<input class="form-control" placeholder="輸入地址" name="addr"
								value="${MemberLoginOK.addr}" /> <input type="submit"
								class="btn btn-success" value="確定" />
						</div>
					</form>
				</div>
				<!-- 歷史訂單頁籤 -->
				<div role="tabpanel" class="tab-pane" id="profile">
					<table class="table" align="center">
						<!--標題列 -->
						<thead>
							<tr>
								<th>飯店名稱</th>
								<th>房間數</th>
								<th>價錢</th>
								<th>加床</th>
								<th>加床價格</th>
								<th>房型</th>
								<th>訂購人</th>
								<th>電話</th>
								<th>地址</th>
								<th>下單日期</th>
								<th>訂單狀態</th>
								<th>取消訂單時間</th>
								<th class="text-right">Actions</th>
								<!--評論 -->
							</tr>
						</thead>
						<c:forEach var="myData" items="${ordersKey}">
							<!--取出VO裡的List 此orderKey相當於List概念-->
							<%-- 						${myData.orderId} ${myData.orderedDate} ${myData.memberId} ${myData.roomId} ${myData.hotelId} ${myData.hotelName} --%>
							<%-- 						${myData.roomTypeId} ${myData.roomTypeName} ${myData.checkinDay} ${myData.checkoutDay} ${myData.roomCount} --%>
							<%-- 						${myData.peopleNum} ${myData.breakfast} ${myData.dinner} ${myData.afternoonTea} ${myData.price}${myData.roomNo} --%>
							<%-- 						${myData.reservationer} ${myData.bdate} ${myData.tel} ${myData.email} ${myData.addr} ${myData.personId} ${myData.country} --%>
							<%-- 						${myData.passport} ${myData.bedAdding} ${myData.pricePerPerson}${myData.customerRemark} ${myData.hotelRemark} ${myData.memo}  --%>
							<%-- 						${myData.orderState} ${myData.cancelDate}		 --%>
							<tbody>
								<tr>
									<td>${myData.hotelName}</td>
									<td>${myData.roomCount}</td>
									<td>${myData.price}</td>
									<td><c:choose>
											<%--orderState布林值判斷改顯示字串--%>
											<c:when test="${myData.bedAdding == true}">有</c:when>
											<c:otherwise>無</c:otherwise>
										</c:choose></td>
									<td>${myData.pricePerPerson}</td>
									<td>${myData.roomTypeName}</td>
									<td>${myData.reservationer}</td>
									<td>${myData.tel}</td>
									<td>${myData.addr}</td>
									<td><c:choose>
											<%--判斷下單日期--%>
											<c:when test="${myData.orderedDate == null}"> - </c:when>
											<c:otherwise> ${myData.orderedDate} </c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<%--orderState布林值判斷改顯示字串 --%>
											<c:when test="${myData.orderState == true}">訂單成立</c:when>
											<c:otherwise>取消訂單</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${myData.cancelDate == null}">-</c:when>
											<c:otherwise>${myData.cancelDate}</c:otherwise>
										</c:choose></td>

									<!--評論 -->
									<td class="td-actions text-right">
										<button type="button" rel="tooltip" title="評論"
											class="btn btn-success btn-simple btn-xs">
											<i class="fa fa-edit"></i>
										</button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>

		</div>

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

</html>