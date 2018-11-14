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
	
		<style>
 	#bg_contsSc{ 
 		border: 1px solid red; 
 		text-align: center;
 		width: 100%; 
 	} 
	
 	#wrap_contsSc{ 
 	 border: 1px solid blue;    
 	 display: inline-block; 
  	 width: 1008px;  
 	} 
	
 	#contsSc { 
	 	display: inline-block;
 		border: 1px solid green; 
 		width: 80%; 
 		float: left;  		
 		
 	} 
	
 	#contsCh { 
	 	display: inline-block;
 		border: 1px solid gray; 
 		width: 18%;
 		float: right;
 	}
 	
 	.clear {
	 	display:none;
	 	clear: both;
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
		List song_ar_list = (List) request.getAttribute("song_ar_list");
		List song_mn_list = (List) request.getAttribute("song_mn_list");
		List song_an_list = (List) request.getAttribute("song_an_list");
		List album_list = (List) request.getAttribute("album_list");
		List lyric_list = (List) request.getAttribute("lyric_list");
		
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<!-- 검색 결과 -->
			<div id="contsSc">	
			<div>
				<ul>
					<li><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></li>
					<li><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></li>
					<li><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></li>
					<li><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></li>
					<li><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></li>
				</ul>
			</div>
			
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
				
			
				<!-- 곡 -->
				<div>
					<!-- 곡: 아티스트명으로 검색 -->
					<%
						if(!(song_ar_list.size() == 0)){
					%>
					<div>
						<p>아티스트명으로 검색</p>
						<table>
							<thead>
								<tr>
									<th><div><input type="checkbox"></div></th>
									<th><div>NO</div></th>
									<th><div>곡명</div></th>
									<th><div>아티스트</div></th>
									<th><div>앨범</div></th>
									<th><div>좋아요</div></th>
									<th><div>재생</div></th>
									<th><div>다운</div></th>
									<th><div>뮤비</div></th>
								</tr>
							</thead>
							<tbody>
							<%
								for (int i = 0; i < song_ar_list.size(); i++) {
									SearchBean sarlSb = (SearchBean) song_ar_list.get(i);	
							%>
								<tr>
									<td><div><input type="checkbox"></div></td>
									<td><div><%=(i+1)%></div></td>
									<td><div><%=sarlSb.getMusic_name() %></div></td>
									<td><div><%=sarlSb.getSinger_name() %></div></td>
									<td><div><%=sarlSb.getAl_name() %></div></td>
									<td><div><span class="odd_span"><i class="fa fa-heart-o"></i>
											 <span class="cnt">0</span></span></div></td>
									<td><div><i class="fa fa-play"></i><span class="none">듣기</span></div></td>
									<td><div><i class="fa  fa-download "></i><span class="none">다운로드</span></div></td>
									<td><div><i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span></div></td>
								</tr>
							<%
								}
							%>
							</tbody>
						</table>
					</div>
					<%
						}
					%>


					<!-- 곡: 곡명으로 검색 -->				
					<%
						if(!(song_mn_list.size() == 0)){
					%>
					<div>
						<p>곡명으로 검색</p>
						<table>
							<thead>
								<tr>
									<th><div><input type="checkbox"></div></th>
									<th><div>NO</div></th>
									<th><div>곡명</div></th>
									<th><div>아티스트</div></th>
									<th><div>앨범</div></th>
									<th><div>좋아요</div></th>
									<th><div>재생</div></th>
									<th><div>다운</div></th>
									<th><div>뮤비</div></th>
								</tr>
							</thead>
							<tbody>
							<%
								for (int i = 0; i < song_mn_list.size(); i++) {
									SearchBean smnlSb = (SearchBean) song_mn_list.get(i);	
							%>
								<tr>
									<td><div><input type="checkbox"></div></td>
									<td><div><%=(i+1) %></div></td>
									<td><div><%=smnlSb.getMusic_name() %></div></td>
									<td><div><%=smnlSb.getSinger_name() %></div></td>
									<td><div><%=smnlSb.getAl_name() %></div></td>
									<td><div><span class="odd_span"><i class="fa fa-heart-o"></i>
											 <span class="cnt">0</span></span></div></td>
									<td><div><i class="fa fa-play"></i><span class="none">듣기</span></div></td>
									<td><div><i class="fa  fa-download "></i><span class="none">다운로드</span></div></td>
									<td><div><i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span></div></td>
								</tr>
							<%
								}
							%>
							</tbody>
						</table>
					</div>
					<%
						}
					%>
					

					<!-- 곡: 앨범명으로 검색 -->
					<%
						if(!(song_an_list.size() == 0)){
					%>
					<div>
						<p>앨범명으로 검색</p>
						<table>
							<thead>
								<tr>
									<th><div><input type="checkbox"></div></th>
									<th><div>NO</div></th>
									<th><div>곡명</div></th>
									<th><div>아티스트</div></th>
									<th><div>앨범</div></th>
									<th><div>좋아요</div></th>
									<th><div>재생</div></th>
									<th><div>다운</div></th>
									<th><div>뮤비</div></th>
								</tr>
							</thead>
							<tbody>
							<%	
								for (int i = 0; i < song_an_list.size(); i++) {
									SearchBean sanlSb = (SearchBean) song_an_list.get(i);
							%>
								<tr>
									<td><div><input type="checkbox"></div></td>
									<td><div><%=(i+1) %></div></td>
									<td><div><%=sanlSb.getMusic_name() %></div></td>
									<td><div><%=sanlSb.getSinger_name() %></div></td>
									<td><div><%=sanlSb.getAl_name() %></div></td>
									<td><div><span class="odd_span"><i class="fa fa-heart-o"></i>
											 <span class="cnt">0</span></span></div></td>
									<td><div><i class="fa fa-play"></i><span class="none">듣기</span></div></td>
									<td><div><i class="fa  fa-download "></i><span class="none">다운로드</span></div></td>
									<td><div><i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span></div></td>
								</tr>
							<%
								}
							%>
							</tbody>
						</table>
					</div>
					<%
						}
					%>
				</div>
				<!-- 곡 -->
				
				<!-- 앨범 -->
				<%
					if(!(album_list.size() == 0)){
				%>
 				<div>
				<ul>
				<%	
					for (int i=0; i<album_list.size(); i++) {
						SearchBean alSb = (SearchBean) album_list.get(i);
				%>
					<li>
						<div>
	<%-- 						<p><%=alSb.getAl_art_img() %></p>
	 --%>						<p><%=alSb.getAl_name() %></p>
							<p><%=alSb.getSinger_name() %></p>
							<p><%=alSb.getAl_release() %></p>
						</div>
					</li>
					<hr>
				<%	
					}
				%>
				</ul>
				</div>
				<%	
					}
				%>
				<!-- 앨범 -->
				
				
				<!-- 가사 -->
				<div>
				<%
					 for(int i=0; i<lyric_list.size(); i++){
						SearchBean lySb =(SearchBean) lyric_list.get(i);				 
				%>
			
				<div><b><%=lySb.getMusic_name() %></b></div>
				<div style="    display: block;
	    						margin-bottom: 4px;
	   							white-space: nowrap;
	    						text-overflow: ellipsis;
	   							overflow: hidden;"><%=lySb.getLyrics() %></div>
				<div><%-- ${list.singer_name} --%> | <%=lySb.getAl_name() %></div>
				<hr>
				<%	 
				 }
				%>
				</div>
				<!-- 가사 -->		
			
			</div>
			<!-- 검색 결과 -->
			
			
			
			<!-- 차트 -->
			<div id="contsCh">			
				<jsp:include page="../board/searchChart.jsp"></jsp:include>	
			</div>
			<!-- 차트 -->
			
			
	 		<div class="clear"></div>		
		</div>
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>