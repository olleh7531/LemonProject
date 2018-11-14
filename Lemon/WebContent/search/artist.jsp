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

	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		SearchBean at_pro = (SearchBean) request.getAttribute("artist_profile");
		List artist_list = (List) request.getAttribute("artist_list");

		System.out.println(search);
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
				
				<!-- 아티스트 -->
				<!-- 아티스트 프로필 -->
				<%
					if(at_pro != null){
				%>
				<div>
					<div>
					<p><%=at_pro.getSi_picture() %></p>
					<p><%=at_pro.getSinger_name() %></p>
					<p><%=at_pro.getSi_gender() %></p>
					<p><%=at_pro.getActivity_type() %></p>
					<p><%=at_pro.getSi_genre() %></p>
					<p><%=at_pro.getSi_birth() %></p>
					</div>
				</div>
				<hr>
				<%
					}
				%>				
				
				<!-- 아티스트 리스트 -->
				<%
					if(!(artist_list.size() == 0)){
				%>
				<div>
					<%
						for (int i=0; i<artist_list.size(); i++) {
							SearchBean arSb = (SearchBean) artist_list.get(i);	
					%>
					<div>
					<p><%=arSb.getSi_picture() %></p>
					<p><%=arSb.getSinger_name() %></p>
					<p><%=arSb.getSi_gender() %></p>
					<p><%=arSb.getActivity_type() %></p>
					<p><%=arSb.getSi_genre() %></p>
					</div>
					<hr>
					<%
						}
					%>
				</div>
				<%
					}
				%> 
				<!-- 아티스트 -->
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>