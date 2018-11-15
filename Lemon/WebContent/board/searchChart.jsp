<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.list_rank_side .rank {
    display: inline-block;
    margin-left: 12px;
    vertical-align: middle;
}


.wrap_rank {
    display: inline-block;
    color: #999;
    font-size: 12px;
    line-height: 18px;
    font-family: "Arial", "돋움", "Dotum", "Apple Gothic", sans-serif;
    vertical-align: middle;
}

.wrap_rank span {
    vertical-align: middle;
    font-family: "Arial", "돋움", "Dotum", "Apple Gothic", sans-serif;
    font-size: 10px;
}

.icon_down {
    display: inline-block;
    width: 7px;
    height: 7px;
    margin-right: -1px;
    background: url(//cdnimg.melon.co.kr/resource/image/web/common/bg_sprite_rank.png) no-repeat -70px 0;
    overflow: hidden;
    font-size: 0 !important;
    line-height: 0 !important;
    vertical-align: middle;
}

.icon_static {
    display: inline-block;
    width: 7px;
    height: 7px;
    margin-right: -1px;
    margin-left: 0;
    background: url(//cdnimg.melon.co.kr/resource/image/web/common/bg_sprite_rank.png) no-repeat -22px 0;
    overflow: hidden;
    font-size: 0 !important;
    line-height: 0 !important;
    vertical-align: middle;
}

.icon_up {
    display: inline-block;
    width: 7px;
    height: 7px;
    margin-right: -1px;
    background: url(//cdnimg.melon.co.kr/resource/image/web/common/bg_sprite_rank.png) no-repeat -80px 0;
    overflow: hidden;
    font-size: 0 !important;
    line-height: 0 !important;
    vertical-align: middle;
}

.wrap_cont_side {
    position: relative;
    zoom: 1;
}
#side_conts {
/*     position: absolute; */
    right: 21px;
    top: 16px;
    bottom: -0;
/*     width: 230px; */
    background-color: #fff;
    border: 1px solid #d9d9d9;
    border-bottom: 0;
}
#side_conts .side_cont {
    position: relative;
    width: 176px;
    margin: 0 -1px;
    padding: 22px 15px;
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
}

.list_rank_side .wrap .no {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin-right: 3px;
    background: url(//cdnimg.melon.co.kr/resource/image/web/search/bul_list_newst.png) no-repeat left top;
    color: #666;
    font-size: 11px;
    line-height: 18px;
    font-family: "Arial","돋움", "Dotum", "Apple Gothic", sans-serif;
    text-align: center;
    vertical-align: middle;
}

.none {
    position: absolute;
    top: -5000em;
    left: 0;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    overflow: hidden;
}

.list_rank_side .wrap .cntt {
    position: relative;
    display: inline-block;
    width: 104px;
    vertical-align: middle;
}

.list_rank_side .ellipsis {
    display: inline-block;
    width: 100%;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.list_rank_side .wrap .cntt a {
    display: block;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

ol, ul, li {
    list-style: none;
    font-weight: normal;
}

.list_rank_side .wrap {
    display: inline-block;
    vertical-align: middle;
}
</style>
</head>
<body>
<c:set var="arr" value="${requestScope.searchchart}"/>
<c:set var="popular" value="${requestScope.popular}"/>

<c:set var = "gender1" value = "0" />
<c:set var = "gender2" value = "0" />
<c:set var= "generation1" value="0"/>
<c:set var= "generation2" value="0"/>
<c:set var= "generation3" value="0"/>
<c:set var= "generation4" value="0"/>
<c:set var= "generation5" value="0"/>

<c:forEach var="result" items="${arr}" varStatus="status">
<c:set var= "gender1" value="${gender1 + result.sc_gender1}"/>
<c:set var= "gender2" value="${gender2 + result.sc_gender2}"/>
<c:set var= "generation1" value="${generation1 + result.sc_generation1}"/>
<c:set var= "generation2" value="${generation2 + result.sc_generation2}"/>
<c:set var= "generation3" value="${generation3 + result.sc_generation3}"/>
<c:set var= "generation4" value="${generation4 + result.sc_generation4}"/>
<c:set var= "generation5" value="${generation5 + result.sc_generation5}"/>
</c:forEach>
<c:set var= "male1" value="${gender1 / (gender1+gender2) *100}"/>
<c:set var= "female1" value="${gender2 / (gender1+gender2) *100}"/>
<fmt:formatNumber var="male2" value="${male1}" pattern="."/>
<fmt:formatNumber var="female2" value="${female1}" pattern="."/>
<h5 style="font-size: 14px;"><b style="float: left; padding-left: 10px; padding-top: 20px; color: #eeb024;">${arr[0].sc_keyword}</b><b style="float: right; padding-right: 10px; padding-top: 20px;">검색트렌드</b></h5>
<div id="side_conts">
<div id="lineChart"></div>
<h5 style="font-size: 13px;"><b style="float: left; padding-left: 10px;">성별</b></h5>
<div id="chart"></div>
<h5 style="font-size: 13px;"><b style="float: left; padding-left: 10px;">연령별</b></h5>
<div id="PieChart"></div>
<div id="side_cont">
<div class="wrap_title_side line">
							<h2 class="f_tit_side " style="padding-top: 10px;">인기키워드</h2>
						</div>
						<hr>
						<div class="wrap_cont_side">
							<div class="list_rank_side">
								<ul>
								
									
								<c:forEach var="psearch" items="${popular}" varStatus="status">
									<li>
										<div class="wrap">
											<span class="no">${status.index+1}<span class="none">위</span></span>
											<div class="cntt">
												<span class="none">곡명</span>
												<div class="ellipsis">
													<a href="/Lemon/UniSearch.sc?search=${psearch.sc_keyword}&sort=최신순" title="${psearch.sc_keyword} 통합검색 - 페이지 이동">${psearch.sc_keyword}</a>
												</div>
											</div>
										</div>
										<div class="rank">
										<c:if test="${psearch.sc_rank>0}">
										<span title="${psearch.sc_rank}단계 상승" class="wrap_rank"> <span class="icon_up">단계 상승</span> <span>${psearch.sc_rank}</span> </span>
										</c:if>
										<c:if test="${psearch.sc_rank<0}">
										<span title="${psearch.sc_rank}단계 하락" class="wrap_rank"> <span class="icon_down">단계 하락</span> <span>${psearch.sc_rank}</span> </span>
										</c:if>
										<c:if test="${psearch.sc_rank==0}">
											<span title="순위 동일" class="wrap_rank"> <span class="icon_static">${psearch.sc_rank}</span> </span>
										</c:if>
										</div>
									</li>
								</c:forEach>	
									
									
									
								</ul>
							</div>
							<hr>
							<div class="wrap_btn_r_side line">
								<span class="date" style="float:left; padding-left: 10px; font-size: 12px; padding-bottom: 10px;">
				${fn:substring(popular[0].sc_date,0,10)} 	</span>
							</div>
							
						</div>
						</div>
						</div>

<script type="text/javascript">
bb.generate({
	"data" : {
		"columns" : [
				[ "남성", "${male2}" ],
				
				[ "여성", "${female2}" ],
				],	"type": "bar",
				labels: {
				      position: {
				          x: 0,
				          y: -5
				        },
				      },
	},"size": {
        "width": 182,
        "height" : 120
    },"axis": {
        "x": {
            "show": false
        },
        "y": {
            "show": false
        }
    },    point: {
        pattern: [
            "circle",
            "rectangle",
          ]
        },
    "legend": {
    	usePoint: true,
        "position": "right"
    },bar: {
        padding: 20
    },"tooltip": {
        "show": false
    },
    bindto: "#chart"
	
});

var chart = bb.generate({
	  data: {
	    columns: [
		["10대", "${generation1}"],
		["20대", "${generation2}"],
		["30대", "${generation3}"],
		["40대", "${generation4}"],
		["50대", "${generation5}"],
	    ],
	    type: "pie",
	  }, pie: {
		  padding: 1.5,
		  "label": {
	            "show": false
	        },
	    },"size": {
	        "width": 182,
	        "height" : 150
	    },  color: {
	          tiles: function() {
	      	var pattern = d3.select(document.createElementNS(d3.namespaces.svg, "pattern"))
	      		.attr("patternUnits", "userSpaceOnUse")
	      		.attr("width", "6")
	      		.attr("height", "6");

	      	var g = pattern
	      		.append("g")
	      		.attr("fill-rule", "evenodd")
	      		.attr("stroke-width", 1)
	      		.append("g")
	      		.attr("fill", "rgb(255, 127, 14)");

	      	g.append("polygon").attr("points", "5 0 6 0 0 6 0 5");
	      	g.append("polygon").attr("points", "6 5 6 6 5 6");

	      	return [
	      		pattern.node()
	      	];
	         }
	        },
	  bindto: "#PieChart"
	});


var chart = bb.generate({
	  data: {
	    columns: [
		["검색 수",<c:forEach items="${arr}" var="list" varStatus="status" step="1">
		<c:if test="${!status.last}">
		"${list.sc_count}" ,
		</c:if>	
		<c:if test="${status.last}">
		"${list.sc_count}"
		</c:if>
		</c:forEach>]
	    ],colors: {
            "검색 수": "#eeb024",
        },
	  },
	  axis: {
	    x: {
	      tick: {
	        count: 2,
	        "outer": false,
	        centered : true,
	      },"type": "category",
	      "categories" : [ <c:forEach items="${arr}" var="list" varStatus="status">
			<c:set var="test" value="${list.sc_date}"/>
			<c:if test="${!status.last}">
				"${fn:substring(test,5,10)}" , 
			</c:if>	
			<c:if test="${status.last}">
				"${fn:substring(test,5,10)}" 
			</c:if>
			
				</c:forEach>  ],
	          
	    },"y": {
            "show": false
        }
	  }, "size": {
		        "width": 182,
		        "height" : 150
		    },  grid: {
		        x: {
		            show: true
		          },
		          y: {
		            show: true
		          }
		        },"legend": {
		            "show": false,
		        },"point": {
		            "show": false
		        },
	  bindto: "#lineChart"
	});


</script>

</body>
</html>