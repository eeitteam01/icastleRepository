<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
    <!--開始導覽列-->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" height:55px;">
        <div class="container-fluid">
            <!--logo-->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/index.jsp">
                    <img alt="Brand" height="30" src="${pageContext.servletContext.contextPath}/img/logo.png" />
                </a>
            </div>
            <!--結束logo-->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.servletContext.contextPath}/index.jsp">首頁</a></li>
                    <li><a href="#">活動</a></li>
                    <li><a href="#">討論區</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span>會員中心</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> 登入</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登出</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--結束導覽列-->
    <!--content here!!!!!!!!!!!!~~~~~~~~~~-->
<div class="member" style="margin-top:56px">
<form METHOD="post" ACTION="Member.do">
<h1>會員註冊</h1>
<table>
<tr><td><span>帳號:</span></td><td><input type="text" name="email" value="${param.email}">${errorMsgs.emailErr}<br></td></tr>
<tr><td><span>密碼:</span></td><td><input type="text" name="pw" value="${param.pw}">${errorMsgs.pwErr}<br></td></tr>
<tr><td><span>姓名:</span></td><td><input type="text" name="name" value="${param.name}">${errorMsgs.nameErr}<br></td></tr>

<tr><td><span>請選擇性別:</span></td><td><input type="radio" name="gender" value="男" 
<c:if test="${param.gender == '男'}">
checked
</c:if>
>男${errorMsgs.genderErr}<br></td></tr>
<tr><td><span></span></td><td><input type="radio" name="gender" value="女"
<c:if test="${param.gender == '女'}">
checked
</c:if>
>女${errorMsgs.genderErr}<br></td></tr>
<tr><td><span>生日:</span></td><td><input type="text" name="bdate" value="${param.bdate}"/>${errorMsgs.bdateError}<br></td></tr>
<tr><td><span>地址:</span></td><td><input type="text" name="addr" value="${param.addr}">${errorMsgs.addrErr}<br></td></tr>
<tr><td><span>電話:</span></td><td><input type="text" name="tel" value="${param.tel}">${errorMsgs.telErr}<br></td></tr>
<tr><td><span>身分證字號:</span></td><td><input type="text" name="personId" value="${param.personId}">${errorMsgs.personIdErr}<br></td></tr>
<tr><td><span>國家:</span></td><td><input type="text" name="country" value="${param.country}"><br></td></tr>
<tr><td><span>護照:</span></td><td><input type="text" name="passport" value="${param.passport}"><br></td></tr>
<tr><td></td><td><input type="submit"><input id="onekey" type="submit" value="一鍵輸入"></td></tr>
</table>



</form>
</div>

    <!--footer-->
    <div class="footer">
        <img src="${pageContext.servletContext.contextPath}/img/logo.png" width="100" />
        <h6>版權所有©2005 – 2017, iCastle Company Pte. Ltd.保留所有權利</h6>
        <h6>iCastle.com隸屬於Priceline集團—線上旅遊業及相關服務的全球領導品牌。</h6>
    </div>
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
			$('input[name = "email"]').val("andy@yahoo.com.tw");
			$('input[name = "pw"]').val("123");
			$('input[name = "name"]').val("劉德華");
			$('input[name = "pw"]').val("123");
			$(':radio:eq(0)').prop("checked", "true");
// 			$(':radio:eq(1)').prop("checked", "true");  <-----女生 上面是男生
			$('input[name = "bdate"]').val("1990/11/11");
			$('input[name = "addr"]').val("台北市大安區市民大道2段222號");
			$('input[name = "tel"]').val("0988210926");
			$('input[name = "personId"]').val("A125878167");
			$('input[name = "country"]').val("台灣");

		});
	})
</script>



</html>