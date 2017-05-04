<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--     Fonts and icons     -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--<link href="css/bootstrap.min.css" rel="stylesheet" />-->
    <link href="${pageContext.servletContext.contextPath}/css/material-kit.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/css/template.css" rel="stylesheet" />
    <!--以下請加入各自頁面的css-->

    <title>愛客宿-iCastle</title>
    <style>
		.container {
		    width: 1300px;
		    margin-top: 100px;
		    background-color: white; 
		    padding-bottom: 100px;
		}
    </style>
</head>
<body>
    <!--開始導覽列-->
		<jsp:include page="../fragment/nav.jsp"/>
	<!--結束導覽列-->
	
    <!--content here!!!!!!!!!!!!~~~~~~~~~~-->
    <div class="container">
    	<h1>是否忘記密碼?</h1>
    	
    	<form action="CreateRandomPw.do" method="post">
		<table class="">
			<tbody>
			<tr>
				<td>請輸入您的Email</td>
				<td><input type="text" name="email" value="${param.email}"/>${errMap.emailErr}${errMap.emailErr2}</td>
			</tr>			
			<tr>
				<td><input type="submit" value="確定"></td>
				<td><input id="onekey" type="submit" value="一鍵輸入"></td>
			</tr>
			</tbody>
		</table>
		</form>
    </div>
    
    <!--開始footer-->
		<jsp:include page="../fragment/footer.jsp"/>
	<!--結束footer-->
</body>
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/material.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/js/nouislider.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/js/bootstrap-datepicker.js"></script>

<script src="${pageContext.servletContext.contextPath}/js/material-kit.js"></script>
<script>
	$(function(){
		$('#onekey').click(function() {
			event.preventDefault();
			$('input[name = "email"]').val("eeit93no1@gmail.com");		
		});
	})
</script>
</html>