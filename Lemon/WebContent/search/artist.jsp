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
	
	
	<style>
	.wrap_list{
		display: inline-block;
		width: 100%;
		border-bottom: 1px solid #ccc;
		margin-bottom: 20px;
	}
	
	.info p a:hover{
		text-decoration: underline;
	}
	
	
	</style>
		

</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		SearchBean at_pro = (SearchBean) request.getAttribute("artist_profile");
		List artist_list = (List) request.getAttribute("artist_list");
		
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_con">			
			<div id="wrap_contsSc">	
			
			<c:set var="search" value="${requestScope.search}"/>
			<div style="text-align: left; padding-top: 29px; padding-bottom: 8px;">
			<%
				if(at_pro != null){
			%>			
				<strong>'${search}'</strong>에 대한 검색 결과입니다.
			<%
				}
			%>			
			</div>
			
			<!-- 메뉴 -->	
			<div id="menuSc">
				<div><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></div>
				<div class="current"><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></div>
				<div><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></div>
				<div><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></div>
				<div><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></div>
				<div style="display:none; clear: both;"></div>
			</div>
			
				
			<!-- 검색 결과 -->
			<div id="contsSc">	
			<h3 class="titleSc">아티스트</h3>
			
			<div class="wrap_list">
			<!-- 아티스트 -->
				<!-- 아티스트 프로필 -->
				<%
					if(at_pro != null){
				%>
				<div style="display: inline-block; width:100%; padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid #ccc">
					<div style="display: inline-block; width:96px; height:96px; 96margin-bottom: 10px; border: 1px solid #ccc; float: left;">
						<a href="./ArtistChanel.ac?artist=<%=at_pro.getSi_num() %>">
						<img width="100%" height="100%"
							 src="./upload/starpost/singerProfile/<%=at_pro.getSi_picture() %>"></a>
					</div>
					<div style="display:none; clear: both;"></div>		
					<div class="info" style="display: inline-block; margin-left: 10px;" >
					<p><a href="./ArtistChanel.ac?artist=<%=at_pro.getSi_num() %>"><strong><%=at_pro.getSinger_name() %></strong></a></p>
					<p><%=at_pro.getSi_gender() %></p>
					<p><%=at_pro.getActivity_type() %></p>
					<p><%=at_pro.getSi_genre() %></p>
					</div>
				</div>
				
				<!-- 아티스트 리스트 -->
				<%
					if(!(artist_list.size() == 0)){
						for (int i=0; i<artist_list.size(); i++) {
							SearchBean arSb = (SearchBean) artist_list.get(i);	
					%>
					<div style="display: inline-block; width:100%; padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid #ccc">
						<div style="display: inline-block; width: 96px; height: 96px; margin-bottom: 10px; border: 1px solid #ccc; float: left;">
							<a href="./ArtistChanel.ac?artist=<%=arSb.getSi_num() %>">
							<img width="100%" height="100%"
								 src="./upload/starpost/singerProfile/<%=arSb.getSi_picture() %>"></a>
						</div>
						<div style="display:none; clear: both;"></div>		
						
						<div class="info" style="display: inline-block; margin-left: 10px;" >
						<p><a href="./ArtistChanel.ac?artist=<%=arSb.getSi_num() %>"><strong><%=arSb.getSinger_name() %></strong></a></p>
						<p><%=arSb.getSi_gender() %></p>
						<p><%=arSb.getActivity_type() %></p>
						<p><%=arSb.getSi_genre() %></p>
						</div>
					</div>
				<%
						}
					}
				}else{
					%>
						<div style="margin-top: 100px; margin-bottom: 100px;">
							<div style="text-align: center;">
							<strong>'${search}'</strong>(으)로 검색한 결과가 없습니다.	
							</div>
							<ul style="margin-top: 26px; text-align: center;">
								<li>검색어의 철자와 띄어쓰기가 정확한지 확인해 주세요.</li>
								<li>검색어의 단어수를 줄이거나, 보다 일반적인 단어 등 다른 검색어를 입력해 보세요.</li>
							</ul>
						</div>
					<%
				}
			%> 
				<!-- 아티스트 -->
				</div>
			
			
			
			</div>
			<!-- 검색 결과 -->
			</div>
			
			<!-- 차트 -->
			<div id="contsCh">			
				<jsp:include page="../board/searchChart.jsp"></jsp:include>	
			</div>
			<!-- 차트 -->
			
			
	 		<div style="display:none; clear: both;"></div>

	 				
		</div>
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	// 검색어 초기화
	$(document).ready(function(){
		$('#top_search').val("${search}");s
	});

	</script>
	
	
	<!-- 메뉴 Script -->
	<script type="text/javascript" src="./assets/js/search/menuSc.js"></script>
	
	</body>
</html>