<%@page import="com.lemon.search.db.SearchBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lemon.search.db.SearchDAO"%>
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
	

</head>

<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<c:set var="search" value="${requestScope.search}"/>
	
	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div>
				<ul>
					<li><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></li>
					<li><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></li>
					<li><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></li>
					<li><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></li>
					<li><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></li>
				</ul>
			</div>
		
			<div id="contsSc">
			<ul>
				<li><button type="button" value="artist" onclick="changeCategory();" class="btnCategory">아티스트명에서</button></li>
				<li><button type="button" value="musicname" onclick="changeCategory();" class="btnCategory">곡명에서</button></li>
				<li><button type="button" value="albumname" onclick="changeCategory();" class="btnCategory">앨범명에서</button></li>
			</ul>
			
			
			
		
				
			
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	function changeCategory(){
		$.ajax({
			type : "POST", // method="POST" 방식으로 출력 
			url : "./SongSearch.sc", // id 체크하는 jsp 파일 주소 불러오기 
			dataType: 'json',
			data : {
				search : $('#top_search').val(),			
	 			stateCategory : $('.btnCategory').val(),
			},
			success : function(data) { // data를 가져오는 것이 성공하였을 때
							
			},
			error : function(xhr, status, error) { // 에러났을 때
				alert("error : " + error);
			}
		});
	}


	</script>
	
	</body>
</html>