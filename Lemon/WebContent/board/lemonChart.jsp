<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="./assets/css/board/billboard.css">
<link rel="stylesheet" href="./assets/css/board/insight.css">


<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="./assets/js/chart/billboard.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
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
	max-height: 205px;
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

#chart .bb-xgrid-line line {stroke: #667080;
z-index: 0;
opacity: 0.3 !important;}
#chart .bb-xgrid-line:NTH-CHILD(24) line {stroke: #a0aac3;
z-index: 0;
opacity: 0.3 !important;}

#chart .bb-region-0 {fill:#4f6595;
    
}
.bb-event-rects .bb-event-rect {
     fill: #4c576f !important;
    background: url(//cdnimg.melon.co.kr/resource/image/web/chart/bg_realtimechart_20180614.png) no-repeat 0 0 !important;
}





/* .bb-shapes .bb-circle {opacity: 0 !important;}  */
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
			$(location).attr('href', 'LemonLatest_Chart.ct?dayTime=' + time + '');
		})

	});
	

	
			for (var i = 0;i<9999 ; i++) {
			  (function (i) {
			    setTimeout(function () {
			      var j=i%3;
			      if(j==0){
					$('.bb-chart-line').eq(0).css('opacity','1');
					$('.bb-circles').eq(0).children().css('opacity','1');
					$('.bb-chart-line').eq(1).css('opacity','0.4');
					$('.bb-circles').eq(1).children().css('opacity','0');
					$('.bb-chart-line').eq(2).css('opacity','0.4');
					$('.bb-circles').eq(2).children().css('opacity','0');
			      }else if(j==1){
						$('.bb-chart-line').eq(0).css('opacity','0.4');
						$('.bb-circles').eq(0).children().css('opacity','0');
						$('.bb-chart-line').eq(1).css('opacity','1');
						$('.bb-circles').eq(1).children().css('opacity','1');
						$('.bb-chart-line').eq(2).css('opacity','0.4');
						$('.bb-circles').eq(2).children().css('opacity','0');
			      }else if(j==2){
						$('.bb-chart-line').eq(0).css('opacity','0.4');
						$('.bb-circles').eq(0).children().css('opacity','0');
						$('.bb-chart-line').eq(1).css('opacity','0.4');
						$('.bb-circles').eq(1).children().css('opacity','0');
						$('.bb-chart-line').eq(2).css('opacity','1');
						$('.bb-circles').eq(2).children().css('opacity','1');
			      }
			    }, 7000*i);
			  })(i);
			};
	
 			
			setTimeout(function () {

			$('.bb-chart-line').eq(0).css('opacity','1');
			$('.bb-circles').eq(0).children().css('opacity','1');
			$('.bb-chart-line').eq(1).css('opacity','0.4');
			$('.bb-circles').eq(1).children().css('opacity','0');
			$('.bb-chart-line').eq(2).css('opacity','0.4');
			$('.bb-circles').eq(2).children().css('opacity','0');
			}, 600);



 
				


</script>
</head>
<body>

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

		<c:set var="arr" value="${requestScope.list}"/>

		bb.generate({
			"data" : {
				"columns" : [
						[ "${list[0].music_name}", <c:forEach items="${arr}" var="list" varStatus="status" begin="0" end="71" step="3">
						<c:if test="${status.index!=69}">
						"${list.ch_num}" ,
						</c:if>	
						<c:if test="${status.index==69}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ],
						
						[ "${list[25].music_name}", <c:forEach items="${arr}" var="list" varStatus="status" begin="1" end="71" step="3">
						<c:if test="${status.index!=70}">
						"${list.ch_num}" ,
						</c:if>	
						<c:if test="${status.index==70}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ],
						
						[ "${list[49].music_name}", <c:forEach items="${arr}" var="list" varStatus="status" begin="2" end="71" step="3">
						<c:if test="${status.index!=71}">
						"${list.ch_num}" , 
						</c:if>	
						<c:if test="${status.index==71}">
						"${list.ch_num}"
						</c:if>
						</c:forEach> ], ],
						"type": "line"
			},"size": {
		        "width": 680,
		        "height" : 350
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
			},   color: {
			    pattern: [
			        "#ff9752",
			        "#5ccfff",
			        "#b5f832",
			      ]
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
			},regions: [
			    {
			        start: -1,
			        end: 24
			      },
			    ], legend: {
			    show: false
			  },
			  bindto: "#chart"
		});
	</script>
	<!-- 본문 -->

</body>
</html>