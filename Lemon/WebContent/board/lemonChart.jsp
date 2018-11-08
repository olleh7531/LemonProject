<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">
<link rel="stylesheet" href="./assets/css/board/billboard.css">
<link rel="stylesheet" href="./assets/css/board/insight.css">


<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="./assets/js/chart/billboard.js"></script>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<style type="text/css">
.calendar_prid {
	position: relative;
	min-height: 34px;
	text-align: center;
	z-index: 9;
	margin-top: 38px;
	margin-bottom: 32px;
}

.calendar_prid .yyyymmdd {
	line-height: 34px;
	color: #575757;
	font-size: 26px;
	vertical-align: middle;
	font-family: 'Nunito', sans-serif;
}

.calendar_prid .hhmm {
	padding-left: 5px;
	color: #eeb024;
	font-size: 26px;
	vertical-align: middle;
	font-family: 'Nunito', sans-serif;
}

.calendar_prid .time_layer {
	position: relative;
	display: inline;
	vertical-align: middle;
}

.button_icons.etc.arrow_d {
	width: 14px;
	height: 8px;
	background-position: -284px -71px;
}

.button_icons {
	display: inline-block;
	background-image:
		url(//cdnimg.melon.co.kr/resource/image/web/common/button_icons_sprite_20180108.png);
	background-repeat: no-repeat;
	background-position: 0 0;
	vertical-align: middle;
}

.calendar_prid .time_layer .box_scroll {
	border: 1px solid #e5e5e5;
	width: 82px;
	height: 205px;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #fff;
	margin: 0 -16px;
	padding: 0 16px;
	overflow-y: auto;
}

ol, ul, li {
	list-style: none;
	font-weight: normal;
}

.calendar_prid .time_layer .time_list .time {
	padding: 5px 0;
	line-height: 30px;
	color: #575757;
	font-size: 16px;
}

.l_popup {
	position: absolute;
	z-index: 15;
	top: 30px;
	right: 15px;
}



#bg_contsChart{   
	width: 100%;
	text-align: center;
	display: inline-block;
}




</style>
<script type="text/javascript">
	function btnevent() {
		var arrowName = $(".arrow_d").attr('name');
		if (arrowName == 1) {
			$(".arrow_d").attr('name', '2');
			$(".l_popup").css('display', '');
		} else {
			$(".arrow_d").attr('name', '1');
			$(".l_popup").css('display', 'none');
		}
	}

	var now = new Date();
	var nowmin = now.getMinutes();
	var nowhour = now.getHours();
	var nowdate = now.toLocaleDateString();
	var n = nowdate.lastIndexOf('.');
	nowdate = nowdate.substring(0, n);
	
	$(document).ready(function() {

	<c:set var="dayTime" value="${param.dayTime}"/>

		
if((nowhour == 0 || nowhour == 00)&& nowmin < 5){ // 5분전에 db스케줄러 작동할시간 주기위해서 5분전에는 어제날짜 보이게
	$('.year').html(nowdate.substring(0, n-1)+(parseInt(nowdate.substring(n-1,n))-1).toString());
}else{
	$('.year').html(nowdate);
}
		$('.time_list li').each(function() {
			var time = $(this).find('.time').html().substring(0, 2).trim();
			
				if (time < nowhour && nowhour != 0 && nowhour != 00) {
					$(this).css('display', '');
				} else if (time == nowhour && nowmin > 5) {
					$(this).css('display', '');
				}
			
		});

		$('a').click(function() {
			var time = $(this).find('.time').html().substring(0, 2).trim();
			$(location).attr('href', 'LemonChart.ct?dayTime=' + time + '');
		})

	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/menu.jsp" />
	<!-- 헤더 -->
	<!-- 본문 -->
	<div class="calendar_prid">
		<span class="yyyymmdd"> <span class="year"></span>
		</span> <span class="hhmm">${dayTime}:00 <span class="hour"></span>
		</span>
		<div class="time_layer">
			<button title="시간선택" class="button_icons etc arrow_d" name="1"
				type="button" onclick="btnevent()">
				<span class="none">시간선택</span>
			</button>
			<div class="l_popup d_layer d_dropdown"
				style="z-index: 9999; display: none;">
				<div class="box_scroll">
					<ul class="time_list">
						<li style="display: none;"><a class="timelist"><span
								class="time">23:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">22:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">21:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">20:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">19:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">18:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">17:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">16:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">15:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">14:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">13:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">12:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">11:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">10:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">09:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">08:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">07:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">06:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">05:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">04:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">03:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">02:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">01:00</span></a></li>
						<li style="display: none;"><a class="timelist"><span
								class="time">00:00</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 본문 -->
		<div id="bg_contsChart">
	<div id="chart" style="	display: inline-block;"></div>

		</div>
		<!-- 본문 -->	
	<script type="text/javascript">
		/*    var chart = bb.generate({
		 bindto: "#chart",
		 data: {
		 type: "line",
		 columns: [
		 ["data1", 30, 200, 100, 170, 150, 250],
		 ["data2", 130, 100, 140, 35, 110, 50]
		 ]
		 },
		 "axis": {
		 "rotated": false,
		 "x": {
		 },
		 "y": {
		 "show": false
		 }
		 }
		 }); */
		<c:set var="arr" value="${requestScope.list}"/>


		bb.generate({
			"data" : {
				"columns" : [
						[ "data1", <c:forEach items="${arr}" var="list" varStatus="status" begin="0" end="71" step="3">
						<c:if test="${status.index!=69}">
						"${list.ch_num}" ,
						</c:if>	
						<c:if test="${status.index==69}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ],
						
						[ "data2", <c:forEach items="${arr}" var="list" varStatus="status" begin="1" end="71" step="3">
						<c:if test="${status.index!=70}">
						"${list.ch_num}" ,
						</c:if>	
						<c:if test="${status.index==70}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ],
						
						[ "data3", <c:forEach items="${arr}" var="list" varStatus="status" begin="2" end="71" step="3">
						<c:if test="${status.index!=71}">
						"${list.ch_num}" , 
						</c:if>	
						<c:if test="${status.index==71}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ], ],
						"type": "line"
			},"size": {
		        "width": 650
		    },
			"axis" : {
				"x" : {
					"show" : true,
					"type" : "category",
					"categories" : [ <c:forEach items="${arr}" var="list" varStatus="status" begin="0" end="23" step="1">
					<c:set var="test" value="${list.ch_updatetime}"/>
					<c:if test="${status.index!=23}">
						"${fn:substring(test,11,13)}" , 
					</c:if>	
					<c:if test="${status.index==23}">
						"${fn:substring(test,11,13)}" 
					</c:if>
					
						</c:forEach>  ],
					"tick" : {
						"outer" : false,
						centered : true,
					}
				},
				"y" : {
					"show" : false,
					"tick" : {
					format: function(d) {
						return d +"%";
	                }
					}
				}
			},
			grid : {
				x : {
					show : false,
					lines : [ {
						value : 0
					}, {
						value : 1
					}, {
						value : 2
					}, {
						value : 3
					}, {
						value : 4
					}, {
						value : 5
					}, {
						value : 6
					}, {
						value : 7
					}, {
						value : 8
					}, {
						value : 9
					}, {
						value : 10
					}, {
						value : 11
					}, {
						value : 12
					}, {
						value : 13
					}, {
						value : 14
					}, {
						value : 15
					}, {
						value : 16
					},{
						value : 17
					},{
						value : 18
					},{
						value : 19
					},{
						value : 20
					},{
						value : 21
					},{
						value : 22
					},{
						value : 23
					},{
						value : 24
					}, ]
				},
				front : true,
			},
		})
	</script>
	<!-- 본문 -->
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" />
	<!-- 푸터 -->
</body>
</html>