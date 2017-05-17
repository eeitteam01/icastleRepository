<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.servletContext.contextPath}/css/material-dashboard.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.servletContext.contextPath}/css/manager_template.css"
	rel="stylesheet" />
<title>iCastle管理者中心</title>
</head>
<body>
	<!--開始左側及上方導覽列-->
	<jsp:include page="../fragment/iCastleManagement.jsp" />
	<!--開始左側及上方導覽列-->

	<!--內容區塊-->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<table class="table">
					<thead>
						<tr><th>管理員編號</th><th>姓名</th><th>生日</th><th>E-mail</th><th>電話</th><th>管理員</th></tr>
					</thead>
					<tbody id="tb">
						<c:forEach var="member" items="${members}">
							<tr>
								<td>${member.memberId}</td>
								<td>${member.name}</td>
								<td>${member.bdate}</td>
								<td>${member.email}</td>
								<td>${member.tel}</td>
								<td>
								<c:choose>
									<c:when test="${member.memberId == ManagerLoginOK.memberId}">
										<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="man${member.memberId}">
											<input type="checkbox" id="man${member.memberId}" name="manager" class="mdl-switch__input" checked="${member.manager}" disabled>
											<span class="mdl-switch__label"></span>
										</label>
									</c:when>
									<c:otherwise>
										<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="man${member.memberId}">
											<input type="checkbox" id="man${member.memberId}" name="manager" class="mdl-switch__input" checked="${member.manager}">
											<span class="mdl-switch__label"></span>
										</label>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--內容區塊-->

	<!--開始footer-->
	<jsp:include page="../fragment/hotelManagementFooter.jsp" />
	<!--結束footer-->
</body>

<script
	src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/material.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/chartist.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap-notify.js"></script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/material-dashboard.js"></script>
	
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<script>
	$(function(){
		
		console.log(${ManagerLoginOK.memberId});
		var loginmember = man${ManagerLoginOK.memberId};
		
		$('#tb').on('click', 'input[name="manager"]', function(){
			
			var memberId = $(this).attr('id');
			var manager = $(this).prop('checked');
			var tb = $('#tb');
			
			$.ajax({
				type : 'GET',
				url : '${pageContext.servletContext.contextPath}/manager/NewManagerServlet',
				data : {
					memberId : memberId,
					manager : manager,
					action : 'forManagerPage'
				},
				success : function(data){
					
					componentHandler.upgradeDom();
					tb.empty();
					
					$.each(data, function(key, value){
						
						var r = $('<tr></tr>');
						var d1 = $('<td></td>').text(value.memberId);
						var d2 = $('<td></td>').text(value.name);
						var d3 = $('<td></td>').text(value.bdate);
						var d4 = $('<td></td>').text(value.email);
						var d5 = $('<td></td>').text(value.tel);
						
						var msp = $('<span></span>').addClass('mdl-switch__label');
						var mid = ('man' + value.memberId);
						var minp = $('<input>').attr('type','checkbox').attr('name', 'manager').attr('id', mid).addClass('mdl-switch__input').prop('checked', true);
						var mlab = $('<label></label>').addClass('mdl-switch mdl-js-switch mdl-js-ripple-effect').attr('for', mid);
						var d6 = $('<td></td>');

						if(value.memberId == '${ManagerLoginOK.memberId}'){
							minp.prop("disabled", true);
						}

						mlab.append([minp,msp]);
						d6.append(mlab);
						r.append([d1,d2,d3,d4,d5,d6]);
						tb.append(r);
					})
				}
			})
			
		})
	})
</script>

</html>