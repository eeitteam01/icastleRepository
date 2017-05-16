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
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.amber-orange.min.css" />
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
<title>iCastle飯店管理中心</title>
<style>
        table label {
            margin-bottom:0px;
        }

        @media screen and (max-width:1366px){
            .mycheckbox{
                margin-bottom:35px;
            }
        }

        @media screen and (max-width:1366px) {
            .myradio {
                margin-bottom:50px;
            }
        }
    </style>
</head>
<body>
	<!--開始左側及上方導覽列-->
	<jsp:include page="../fragment/hotelManagement.jsp" />
	<!--開始左側及上方導覽列-->

	<!--內容區塊-->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header" data-background-color="blue">
                                    <h4 class="title">編輯我的房型</h4>
                                    <p class="category">避免消費糾紛，確實填寫</p>
                                </div>
                                <div class="card-content  table-full-width">
                                    <form action="${pageContext.servletContext.contextPath}/hotelcenter/roomtype/RegisterRoomType.do" method="get">
                                        <table class="table table-bordered">
                                            <thead class="text-warning">
                                                <tr>
                                                    <th class="text-center col-md-1">房型名稱</th>
                                                    <th class="text-center col-md-1">入住人數</th>
                                                    <th class="text-center col-md-1">每晚價格</th>
                                                    <th class="text-center col-md-1">三餐供應</th>
                                                    <th class="text-center col-md-1">加床</th>
                                                    <th class="text-center col-md-1">加床費用/人</th>
                                                    <th class="text-center col-md-1">備註</th>
                                                    <th class="text-center col-md-1">房間數量</th>
                                                </tr>
                                            </thead>
                                            <tbody id="room">
                                            	<c:forEach var="roomTypeVO" items="${roomTypeList}" varStatus="status">
                                            	
                                                <tr>
                                                    <td style="vertical-align:middle">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:150px;">
                                                                    <input class="mdl-textfield__input" type="text" id="roomTypeName${status.count}" name="roomTypeName" value="${roomTypeVO.roomTypeName }">
                                                                    <label class="mdl-textfield__label" for="roomTypeName${status.count}">請輸入房型名稱</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="vertical-align:middle">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="select">
                                                                    <select name="peopleNum">
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                        <option value="5">5</option>
                                                                        <option value="6">6</option>
                                                                        <option value="7">7</option>
                                                                        <option value="8">8</option>
                                                                    </select>
                                                                    <div class="select__arrow"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="vertical-align:middle">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td><p style="font-size: 16px;padding-top:10px;">平日價</p></td>
                                                                    <td>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:100px;margin-left:15px;">
                                                                            <input class="mdl-textfield__input" type="text" id="weekdaysPrice${status.count}" name="weekdaysPrice" pattern="-?[0-9]*(\.[0-9]+)?">
                                                                            <label class="mdl-textfield__label" for="weekdaysPrice${status.count}">請輸入房型價格</label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <p style="font-size: 16px;padding-top:10px;">假日價</p>
                                                                    </td>
                                                                    <td>
                                                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:100px;margin-left:15px;">
                                                                                <input class="mdl-textfield__input" type="text" id="holidayPrice${status.count}" name="holidayPrice">
                                                                                <label class="mdl-textfield__label" for="holidayPrice${status.count}">請輸入房型價格</label>
                                                                            </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <p style="font-size: 16px;padding-top:10px;">旺季價</p>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:100px;margin-left:15px;">
                                                                            <input class="mdl-textfield__input" type="text" id="seasonPrice${status.count}" name="seasonPrice">
                                                                            <label class="mdl-textfield__label" for="seasonPrice${status.count}">請輸入房型價格</label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:80px;">
                                                                            <input class="mdl-textfield__input" type="text" id="customizedName${status.count}" name="customizedName">
                                                                            <label class="mdl-textfield__label" for="customizedName${status.count}">自訂價格</label>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:100px;margin-left:15px;">
                                                                            <input class="mdl-textfield__input" type="text" id="customizedPrice${status.count}" name="customizedPrice">
                                                                            <label class="mdl-textfield__label" for="customizedPrice${status.count}">請輸入房型價格</label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td style="vertical-align:middle">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox" for="meals0${status.count}">
                                                                            <input type="checkbox" id="meals0${status.count}" class="mdl-checkbox__input" name="meals0">
                                                                            <span class="mdl-checkbox__label">早餐</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox" for="meals1${status.count}">
                                                                            <input type="checkbox" id="meals1${status.count}" class="mdl-checkbox__input" name="meals1">
                                                                            <span class="mdl-checkbox__label">下午茶</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox" for="meals2${status.count}">
                                                                            <input type="checkbox" id="meals2${status.count}" class="mdl-checkbox__input" name="meals2">
                                                                            <span class="mdl-checkbox__label">晚餐</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect myradio" for="bedAddable0_yes${status.count}">
                                                                <input type="radio" id="bedAddable0_yes${status.count}" class="mdl-radio__button" name="bedAddable0" value="true">
                                                                <span class="mdl-radio__label">可加床</span>
                                                            </label>
                                                            <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect myradio" for="bedAddable0_no${status.count}">
                                                                <input type="radio" id="bedAddable0_no${status.count}" class="mdl-radio__button" name="bedAddable0" value="false">
                                                                <span class="mdl-radio__label">不可加床</span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:80px;">
                                                                    <input class="mdl-textfield__input" type="text" id="pricePerPerson${status.count}" name="pricePerPerson">
                                                                    <label class="mdl-textfield__label" for="pricePerPerson${status.count}">請輸入費用</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="mdl-textfield mdl-js-textfield" style="width:150px;">
                                                                    <textarea class="mdl-textfield__input" type="text" rows="6" id="remark${status.count}" name="remark"></textarea>
                                                                    <label class="mdl-textfield__label" for="remark${status.count}">請輸入備註</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width:80px;">
                                                                    <input class="mdl-textfield__input" type="text" id="roomNumber${status.count}" name="roomNumber">
                                                                    <label class="mdl-textfield__label" for="roomNumber${status.count}">請輸入房間數量</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <input type="hidden" name="times"/>
                                        <input type="submit" class="btn btn-primary" value="登入"
                                               style="float: right">
                                    </form>
                                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored" id="add">
                                        <i class="material-icons">add</i>
                                    </button>
                                </div>
                            </div>
                        </div>
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
    $(function () {
        var count = 1;

        $('#add').click(function () {
            var tbody = $('#room');
            
            var tr = $('<tr></tr>');

            var roomTypeName_td = $('<td></td>').css("vertical-align", "middle");
            var roomTypeName_row = $('<div></div>').addClass("row");
            var roomTypeName_col = $('<div></div>').addClass('col-md-12');
            var roomTypeName_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css("width","150px");
            var roomTypeName_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "roomTypeName" + count, name: "roomTypeName" });
            var roomTypeName_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "roomTypeName" + count).text("請輸入房型名稱");
            roomTypeName_inputdiv.append([roomTypeName_input, roomTypeName_label]);
            roomTypeName_col.append(roomTypeName_inputdiv);
            roomTypeName_row.append(roomTypeName_col);
            roomTypeName_td.append(roomTypeName_row);

            var peopleNum_td = $('<td></td>').css("vertical-align", "middle");
            var peopleNum_row = $('<div></div>').addClass("row");
            var peopleNum_col = $('<div></div>').addClass('col-md-12');
            var peopleNum_selectdiv = $('<div></div>').addClass("select");
            var peopleNum_select = $('<select></select>').attr("name", "peopleNum");
            var peopleNum_option1 = $('<option></option>').text("1").attr("value","1");
            var peopleNum_option2 = $('<option></option>').text("2").attr("value", "2");
            var peopleNum_option3 = $('<option></option>').text("3").attr("value", "3");
            var peopleNum_option4 = $('<option></option>').text("4").attr("value", "4");
            var peopleNum_option5 = $('<option></option>').text("5").attr("value", "5");
            var peopleNum_option6 = $('<option></option>').text("6").attr("value", "6");
            var peopleNum_option7 = $('<option></option>').text("7").attr("value", "7");
            var peopleNum_option8 = $('<option></option>').text("8").attr("value", "8");
            var peopleNum_arrow = $('<div></div>').addClass("select__arrow");
            peopleNum_select.append([peopleNum_option1, peopleNum_option2, peopleNum_option3, peopleNum_option4, peopleNum_option5, peopleNum_option6, peopleNum_option7, peopleNum_option8]);
            peopleNum_selectdiv.append([peopleNum_select, peopleNum_arrow]);
            peopleNum_col.append(peopleNum_selectdiv);
            peopleNum_row.append(peopleNum_col);
            peopleNum_td.append(peopleNum_row);

            var price_td = $('<td></td>').css("vertical-align", "middle");
            var price_table = $('<table></table>');
            var price_tbody = $('<tbody></tbody>');
            var weekdaysPrice_tr = $('<tr></tr>');
            var weekdaysPrice_td1 = $('<td></td>');
            var weekdaysPrice_p = $('<p></p>').css({ "font-size": "16px", "padding-top": "10px" }).text("平日價");
            var weekdaysPrice_td2 = $('<td></td>');
            var weekdaysPrice_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({"width":"100px","margin-left":"15px"});
            var weekdaysPrice_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "weekdaysPrice" + count, name: "weekdaysPrice" });
            var weekdaysPrice_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "weekdaysPrice" + count).text("請輸入房型價格");
            weekdaysPrice_inputdiv.append([weekdaysPrice_input, weekdaysPrice_label]);
            weekdaysPrice_td2.append(weekdaysPrice_inputdiv);
            weekdaysPrice_td1.append(weekdaysPrice_p);
            weekdaysPrice_tr.append([weekdaysPrice_td1, weekdaysPrice_td2]);

            var holidayPrice_tr = $('<tr></tr>');
            var holidayPrice_td1 = $('<td></td>');
            var holidayPrice_p = $('<p></p>').css({ "font-size": "16px", "padding-top": "10px" }).text("假日價");
            var holidayPrice_td2 = $('<td></td>');
            var holidayPrice_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "100px", "margin-left": "15px" });
            var holidayPrice_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "holidayPrice" + count, name: "holidayPrice" });
            var holidayPrice_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "holidayPrice" + count).text("請輸入房型價格");
            holidayPrice_inputdiv.append([holidayPrice_input, holidayPrice_label]);
            holidayPrice_td2.append(holidayPrice_inputdiv);
            holidayPrice_td1.append(holidayPrice_p);
            holidayPrice_tr.append([holidayPrice_td1, holidayPrice_td2]);

            var seasonPrice_tr = $('<tr></tr>');
            var seasonPrice_td1 = $('<td></td>');
            var seasonPrice_p = $('<p></p>').css({ "font-size": "16px", "padding-top": "10px" }).text("旺季價");
            var seasonPrice_td2 = $('<td></td>');
            var seasonPrice_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "100px", "margin-left": "15px" });
            var seasonPrice_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "seasonPrice" + count, name: "seasonPrice" });
            var seasonPrice_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "seasonPrice" + count).text("請輸入房型價格");
            seasonPrice_inputdiv.append([seasonPrice_input, seasonPrice_label]);
            seasonPrice_td2.append(seasonPrice_inputdiv);
            seasonPrice_td1.append(seasonPrice_p);
            seasonPrice_tr.append([seasonPrice_td1, seasonPrice_td2]);

            var customizedPrice_tr = $('<tr></tr>');
            var customizedPrice_td1 = $('<td></td>');
            var customizedName_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "80px"});
            var customizedName_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "customizedName" + count, name: "customizedName" });
            var customizedName_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "customizedName" + count).text("自訂價格");
            var customizedPrice_td2 = $('<td></td>');
            var customizedPrice_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "100px", "margin-left": "15px" });
            var customizedPrice_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "customizedPrice" + count, name: "customizedPrice" });
            var customizedPrice_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "customizedPrice" + count).text("請輸入房型價格");
            customizedPrice_inputdiv.append([customizedPrice_input, customizedPrice_label]);
            customizedPrice_td2.append(customizedPrice_inputdiv);
            customizedName_inputdiv.append([customizedName_input, customizedName_label]);
            customizedPrice_td1.append(customizedName_inputdiv);
            customizedPrice_tr.append([customizedPrice_td1, customizedPrice_td2])

            price_tbody.append([weekdaysPrice_tr, holidayPrice_tr, seasonPrice_tr, customizedPrice_tr]);
            price_table.append(price_tbody);
            price_td.append(price_table);

            var meals_td = $('<td></td>').css("vertical-align", "middle");
            var meals_row = $('<div></div>').addClass("row");
            var meals_col = $('<div></div>').addClass('col-md-12');
            var breakfast_row = $('<div></div>').addClass("row");
            var breakfast_col = $('<div></div>').addClass('col-md-12');
            var breakfast_label = $('<label></label>').addClass("mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox").attr("for", "meals0" + "_" + count);
            var breakfast_input = $('<input/>').addClass("mdl-checkbox__input").attr({ type: "checkbox", id: "meals0" + "_" + count, name: "meals0" });
            var breakfast_span = $('<span></span>').addClass("mdl-checkbox__label").text("早餐");
            breakfast_label.append([breakfast_input, breakfast_span]);
            breakfast_col.append(breakfast_label);
            breakfast_row.append(breakfast_col);

            var afternoontea_row = $('<div></div>').addClass("row");
            var afternoontea_col = $('<div></div>').addClass('col-md-12');
            var afternoontea_label = $('<label></label>').addClass("mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox").attr("for", "meals1" + "_" + count);
            var afternoontea_input = $('<input/>').addClass("mdl-checkbox__input").attr({ type: "checkbox", id: "meals1" + "_" + count, name: "meals1" });
            var afternoontea_span = $('<span></span>').addClass("mdl-checkbox__label").text("下午茶");
            afternoontea_label.append([afternoontea_input, afternoontea_span]);
            afternoontea_col.append(afternoontea_label);
            afternoontea_row.append(afternoontea_col);

            var dinner_row = $('<div></div>').addClass("row");
            var dinner_col = $('<div></div>').addClass('col-md-12');
            var dinner_label = $('<label></label>').addClass("mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mycheckbox").attr("for", "meals2" + "_" + count);
            var dinner_input = $('<input/>').addClass("mdl-checkbox__input").attr({ type: "checkbox", id: "meals2" + "_" + count, name: "meals2" });
            var dinner_span = $('<span></span>').addClass("mdl-checkbox__label").text("晚餐");
            dinner_label.append([dinner_input, dinner_span]);
            dinner_col.append(dinner_label);
            dinner_row.append(dinner_col);

            meals_col.append([breakfast_row, afternoontea_row, dinner_row]);
            meals_row.append(meals_col);
            meals_td.append(meals_row);

            var bedAddable_td = $('<td></td>').css("vertical-align", "middle");
            var bedAddable_col = $('<div></div>').addClass('col-md-12');
            var bedAddable_label_yes = $('<label></label>').addClass("mdl-radio mdl-js-radio mdl-js-ripple-effect myradio").attr("for", "bedAddable" + count + "_yes");
            var bedAddable_input_yes = $('<input/>').addClass("mdl-radio__button").attr({ name: "bedAddable" + count, value: "true", type: "radio", id: "bedAddable" + count + "_yes" });
            var bedAddable_span_yes = $('<span></span>').addClass("mdl-radio__label").text("可加床");
            bedAddable_label_yes.append([bedAddable_input_yes, bedAddable_span_yes]);

            var bedAddable_label_no = $('<label></label>').addClass("mdl-radio mdl-js-radio mdl-js-ripple-effect myradio").attr("for", "bedAddable" + count + "_no");
            var bedAddable_input_no = $('<input/>').addClass("mdl-radio__button").attr({ name: "bedAddable" + count, value: "false", type: "radio", id: "bedAddable" + count + "_no" });
            var bedAddable_span_no = $('<span></span>').addClass("mdl-radio__label").text("不可加床");
            bedAddable_label_no.append([bedAddable_input_no, bedAddable_span_no]);

            bedAddable_col.append([bedAddable_label_yes, bedAddable_label_no]);
            bedAddable_td.append(bedAddable_col);

            var pricePerPerson_td = $('<td></td>').css("vertical-align", "middle");
            var pricePerPerson_row = $('<div></div>').addClass("row");
            var pricePerPerson_col = $('<div></div>').addClass('col-md-12');
            var pricePerPerson_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "80px"});
            var pricePerPerson_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "pricePerPerson" + count, name: "pricePerPerson" });
            var pricePerPerson_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "pricePerPerson" + count).text("請輸入費用");
            pricePerPerson_inputdiv.append([pricePerPerson_input, pricePerPerson_label]);
            pricePerPerson_col.append(pricePerPerson_inputdiv);
            pricePerPerson_row.append(pricePerPerson_col);
            pricePerPerson_td.append(pricePerPerson_row);

            var remark_td = $('<td></td>').css("vertical-align", "middle");
            var remark_row = $('<div></div>').addClass("row");
            var remark_col = $('<div></div>').addClass('col-md-12');
            var remark_textareadiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield").css("width", "150px");
            var remark_textarea = $('<textarea></textarea>').addClass("mdl-textfield__input").attr({ type: "text", row: "6", id: "remark" + count, name: "remark" });
            var remark_label = $('<label></label>').addClass("mdl-textfield__label").attr("for", "remark" + count).text("請輸入備註");
            remark_textareadiv.append([remark_textarea, remark_label]);
            remark_col.append(remark_textareadiv);
            remark_row.append(remark_col);
            remark_td.append(remark_row);

            var roomNumber_td = $('<td></td>').css("vertical-align", "middle");
            var roomNumber_row = $('<div></div>').addClass("row");
            var roomNumber_col = $('<div></div>').addClass('col-md-12');
            var roomNumber_inputdiv = $('<div></div>').addClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label").css({ "width": "80px" });
            var roomNumber_input = $('<input/>').addClass("mdl-textfield__input").attr({ type: "text", id: "roomNumber" + count, name: "roomNumber" });
            var roomNumber_label = $('<label></label>').addClass("mdl-textfield__label").attr("id", "roomNumber" + count).text("請輸入房間數量");
            roomNumber_inputdiv.append([roomNumber_input, roomNumber_label]);
            roomNumber_col.append(roomNumber_inputdiv);
            roomNumber_row.append(roomNumber_col);
            roomNumber_td.append(roomNumber_row);


            tr.append([roomTypeName_td, peopleNum_td, price_td, meals_td, bedAddable_td, pricePerPerson_td, remark_td, roomNumber_td]);
            tbody.append(tr);
            componentHandler.upgradeDom();

            count++;
            $('input[name="times"]').val(count);
        })
    })
</script>
</html>