<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"> <!-- 메인 / 메뉴 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
	
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	

	<!-- Search CSS -->
	<link rel="stylesheet" type="text/css" href="./assets/css/search/common.css">
	<style type="text/css">
	h3.title{
		margin-bottom: 12px;
	    color: #1a1a1a;
	    font-weight: bold;
 	    font-size: 18px; 
	    line-height: 24px;
	    font-family: "맑은 고딕", "Malgun Gothic", "Apple Gothic", sans-serif;
	}
	
	h3.title span.cnt{
		color: #666;
	}
	
	.wrap_cntt{
		border-top: 1px solid #ccc;
	} 
	.list_sort{float: right;
	}
	.list_sort li{float: left;
    margin-left: 4px;
    padding: 0 4px 0 9px;
    background: url(//cdnimg.melon.co.kr/resource/image/web/common/bg_gray_bar.png) no-repeat 0 3px;
	}
	</style>
</head>
<body>
	<c:set var="arr" value="${requestScope.list}"/>
	<c:set var="search" value="${requestScope.search}"/>
<script type="text/javascript">

 $(document).ready(function(){
		$('#top_search').val("${search}");
		$('#li_weight').click(function(){
			$('#sort').val("정확도순");	
			$('#searchFrm').submit();
		});
		$('#li_date').click(function(){
			$('#sort').val("최신순");
			$('#searchFrm').submit();
		});
		$('#li_ganada').click(function(){
			$('#sort').val("가나다순");
			$('#searchFrm').submit();
		});
}); 
</script>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div><p><strong>'${search}'</strong>에 대한 검색 결과입니다.</p></div>
			<div>
				<ul>
					<li><a href="#"></a></li>
					<li><a href="#">앨범</a></li>
					<li><a href="#">가사</a></li>
				</ul>
			</div>
			<ul class="list_sort">
								<li class="first_child" id="li_weight"><a title="가사 리스트 정확도순으로 정렬">정확도순</a></li>
								<li id="li_date" class=""><a title="가사 리스트 최신순으로 정렬" >최신순</a></li>
								<li id="li_ganada" class="on"><a title="가사 리스트 가나다순으로 정렬">가나다순</a></li>
							</ul>
			<div id="contsSc">
				<h3 class="title">
					가사
					<span class="cnt">| 총 ${fn:length(arr)} 건</span>
				</h3>
				
				 <c:forEach items="${arr}" var="list" varStatus="status">
						<div><b>${list.music_name}</b></div>
						<div style="    display: block;
    margin-bottom: 4px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;">${list.lyrics}</div>
						<div>${list.singer_name} | ${list.al_name}</div>
						<hr>
				</c:forEach>
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>