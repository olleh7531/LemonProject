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
</head>
<body>
<c:set var="arr" value="${requestScope.list}"/>

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
<h1>서치차트</h1>
<div id="chart"></div>
<div id="PieChart"></div>
<div id="lineChart"></div>
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
        "width": 176,
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
	        "width": 176,
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
	    ],
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
		        "width": 276,
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