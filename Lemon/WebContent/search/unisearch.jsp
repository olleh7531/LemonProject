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
	
		List song_ar_list = (List) request.getAttribute("song_ar_list");
		List song_mn_list = (List) request.getAttribute("song_mn_list");
		List song_an_list = (List) request.getAttribute("song_an_list");
		
		List album_list = (List) request.getAttribute("album_list");

		
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div id="contsSc">
			
			
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
 				<div>
				<ul>
				<%	
					for (int i = 0; i < album_list.size(); i++) {
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
				<!-- 앨범 -->
								
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>