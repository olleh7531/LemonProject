<%@page import="com.lemon.search.db.SearchBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lemon.search.db.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
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
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/font-awesome/css/font-awesome.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>

<style>

/* 레이아웃 */
#bg_contsSc {
	/* border: 1px solid red;  */
	text-align: center;
	width: 100%;
}

#wrap_con {
	/* border: 1px solid blue; */
	display: inline-block;
	width: 1008px;
}

#wrap_contsSc {
	display: inline-block;
	/* border: 1px solid green;  */
	width: 80%;
	float: left;
}

#contsSc {
	/*  		border: 1px solid pink;  */
	text-align: left;
}

#contsCh {
	display: inline-block;
	border: 1px solid gray;
	width: 18%;
	float: right;
}
/* 레이아웃 */

/* 메뉴 */
 	#menuSc{
 		display: inline-block;
 		border-top: 2px solid #848484;
 		width: 100%;
 	}
 	
 	#menuSc div {
 	 	display: inline-block;
 	 	float: left;
 	 	width: 20%;
 	 	background-color: #ebf0ed;
 	 	border-bottom: 1px solid #dbdbdb;
 	 	padding-top: 10px;
 	 	padding-bottom: 10px;
 	}
 	
 	#menuSc div.current{
 		font-weight: bold;
 		color: #333333;
 		background-color: #fff;
 	 	border-bottom: 1px solid #fff; 		
 	}

 /* 메뉴 */

/* 공통 기타 */
h3.titleSc {
	color: #1a1a1a;
	font-weight: bold;
	font-size: 18px;
	line-height: 24px;
	font-family: "맑은 고딕", "Malgun Gothic", "Apple Gothic", sans-serif;
	padding-top: 25px;
	padding-bottom: 12px;
	border-bottom: 1px solid #ccc;
}

.wrap_list {
	display: inline-block;
	width: 100%;
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px;
}

h4.titleSc {
	padding-top: 25px;
	padding-bottom: 8px;
	color: #1a1a1a;
	font-weight: bold;
	font-size: 14px;
	line-height: 24px;
	font-family: "맑은 고딕", "Malgun Gothic", "Apple Gothic", sans-serif;
}
/* 공통 기타 */

/* 아티스트 관련 */
#artist_list {
	padding: 16px 0 0;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

#artist_info {
	display: inline-block;
	margin-left: 24px;
	width: 500px;
}

dl#info dt {
	float: left;
	clear: both;
	width: 70px;
	color: #666;
	font-size: 12px;
	line-height: 20px;
	margin-top: 2px;
}

dl#info dd {
	float: left;
	width: 371px;
	color: #1a1a1a;
	font-size: 12px;
	line-height: 20px;
	margin-top: 2px;
}

.wrap_artist {
	display: block;
}

.g_artist_info {
	display: inline-block;
	margin-left: 10px;
}

.g_artist_info dl dd {
	font-size: 12px;
	line-height: 20px;
	margin-top: 2px;
}
/* 아티스트 관련 */

/* 곡 관련 */
.wrap_tb_song_list {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.tb_song_list {
	width: 100%;
	border-collapse: collapse;
}

.tb_song_list th {
	line-height: 30px;
}

.tb_song_list td {
	line-height: 30px;
}

.songs {
	text-align: center;
}

.songs td {
	border-top: 1px solid #ccc;
}
/* 곡 관련 */

.g_artist_info dl dd a:hover{
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
		List song_ar_list = (List) request.getAttribute("song_ar_list");
		List song_mn_list = (List) request.getAttribute("song_mn_list");
		List song_an_list = (List) request.getAttribute("song_an_list");
		List album_list = (List) request.getAttribute("album_list");
		List lyric_list = (List) request.getAttribute("lyric_list");

		System.out.println(search);
		System.out.println("at_pro : "+at_pro);
		System.out.println("artist_list : "+artist_list);
		System.out.println("song_ar_list : "+song_ar_list);
		System.out.println("song_mn_list : "+song_mn_list);
		System.out.println("song_an_list : "+song_an_list);
		System.out.println("album_list : "+album_list);
		System.out.println("lyric_list : "+lyric_list);
		
		
	%>

	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_con">
			<div id="wrap_contsSc">

				<c:set var="search" value="${requestScope.search}" />
				<div
					style="text-align: left; padding-top: 29px; padding-bottom: 8px;">
					<strong>'${search}'</strong>에 대한 검색 결과입니다.
				</div>
				<!-- 메뉴 -->
				<div id="menuSc">
					<div class="current">
						<a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a>
					</div>
					<div>
						<a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a>
					</div>
					<div>
						<a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a>
					</div>
					<div>
						<a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a>
					</div>
					<div>
						<a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a>
					</div>
					<div style="display: none; clear: both;"></div>
				</div>
				
				<%
					if(at_pro == null && !(artist_list.size() > 0) && !(song_ar_list.size() > 0) && !(song_mn_list.size() > 0) && !(song_an_list.size() > 0) && !(album_list.size() > 0) && !(lyric_list.size() > 0)){
						%>
						<div id="contsSc">
						<h3 class="titleSc">통합 검색</h3>
						<div style="margin-top: 100px; margin-bottom: 100px;">
						<div style="text-align: center;"><strong>'${search}'</strong>(으)로 검색한 결과가 없습니다.	</div>
							<ul style="text-align: center; margin-top: 26px;">
								<li>검색어의 철자와 띄어쓰기가 정확한지 확인해 주세요.</li>
								<li>검색어의 단어수를 줄이거나, 보다 일반적인 단어 등 다른 검색어를 입력해 보세요.</li>
							</ul>
						</div>
						<div style="border-top: 1px solid #ccc;"></div>
						</div>
						<%		
					}else{
				%>

				<!-- 검색 결과 -->
				<div id="contsSc">
					<h3 class="titleSc">통합 검색</h3>
					<!-- 아티스트 -->
					<!-- 아티스트 프로필 -->
					<%
						if (at_pro != null) {
					%>
					<h3 class="titleSc">아티스트</h3>
					<div id="artist_list">
						<div>
							<div style="display: inline-block; width: 100%;">
								<div
									style="display: inline-block; width: 208px; height: 208px;margin-bottom: 10px; border: 1px solid #ccc; float: left;">
									<a href="./ArtistChanel.ac?artist=<%=at_pro.getSi_num() %>">
									<img width="100%" height="100%"
										src="./upload/starpost/singerProfile/<%=at_pro.getSi_picture()%>"></a>
								</div>
								

								<div id="artist_info">
									<div style="display: inline-block; font-size: 18px;">
										<a href="./ArtistChanel.ac?artist=<%=at_pro.getSi_num() %>"><strong><b><%=at_pro.getSinger_name()%></b></strong></a>
									</div>
									<div style="border-top: 1px solid #e6e6e6">
										<dl id="info" style="display: block; margin-top: 10px;">
											<dt>활동유형</dt>
											<dd><%=at_pro.getSi_gender()%>,
												<%=at_pro.getActivity_type()%></dd>
											<dt>활동장르</dt>
											<dd><%=at_pro.getSi_genre()%></dd>
											<dt>생일</dt>
											<dd><%=at_pro.getSi_birth()%></dd>
										</dl>
									</div>
								</div>
								<div style="display: none; clear: both;"></div>
							</div>
						</div>

						<!-- 아티스트 리스트 -->
						<%
							if (!(artist_list.size() == 0)) {
						%>
						<div
							style="border-top: 1px solid #e6e6e6; margin-top: 16px; display: block;"></div>
						<div style="display: inline-block; margin-top: 16px;">
							<%
								for (int i = 0; i < artist_list.size(); i++) {
											SearchBean arSb = (SearchBean) artist_list.get(i);
							%>
							<div class="wrap_artist" style="display: inline-block; float: left; margin-right: 10px;">
								<div
									style="display: inline-block; width: 96px; height: 96px;margin-bottom: 10px; border: 1px solid #ccc; float: left;">
 									<a href="./ArtistChanel.ac?artist=<%=arSb.getSi_num() %>">
									<img width="100%" height="100%"
										src="./upload/starpost/singerProfile/<%=arSb.getSi_picture()%>"></a>
								</div>
								<div style="display: none; clear: both;"></div>
								<div class="g_artist_info" style="display: inline-block;">
									<dl>
										<dd>
											<a href="./ArtistChanel.ac?artist=<%=arSb.getSi_num() %>"><strong><%=arSb.getSinger_name()%></strong></a>
										</dd>
										<dd><%=arSb.getSi_gender()%>,<%=arSb.getActivity_type()%></dd>
										<dd><%=arSb.getSi_genre()%></dd>
									</dl>
								</div>
								<div style="display: none; clear: both;"></div>

							</div>
							<div style="display: none; clear: both;"></div>
							<%
								}
							%>
						</div>
						<%
							}
						%>
					</div>
					<%
						}
					%>

					<!-- 아티스트 -->




					<!-- 곡 -->
					<%
						if (!(song_ar_list.size() == 0) || !(song_mn_list.size() == 0) || !(song_an_list.size() == 0)) {
					%>
					<h3 class="titleSc">곡</h3>
					<div class="wrap_list">
						<!-- 곡: 아티스트명으로 검색 -->
						<%
							if (!(song_ar_list.size() == 0)) {
						%>
						<div style="display: inline-block; width: 100%;">
							<h4 class="titleSc">● 아티스트명으로 검색</h4>
							<div class="wrap_tb_song_list">
								<table class="tb_song_list">
									<colgroup>
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 100px">
										<col style="width: 80px">
										<col style="width: 80px">
										<col style="width: 50px">
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 30px">
									</colgroup>
									<thead>
										<tr style="text-align: center;">
											<th><div>
													<input type="checkbox">
												</div></th>
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
										<tr class="songs">
											<td><div>
													<input type="checkbox">
												</div></td>
											<td><div><%=(i + 1)%></div></td>
											<td><div><%=sarlSb.getMusic_name()%></div></td>
											<td><div><%=sarlSb.getSinger_name()%></div></td>
											<td><div><%=sarlSb.getAl_name()%></div></td>
											<td><div>
													<span class="odd_span"><i class="fa fa-heart-o"></i>
														<span class="cnt">0</span></span>
												</div></td>
											<td><div
													onclick="LemonPlayer(<%=sarlSb.getMu_num()%>,<%=sarlSb.getAlbum_num()%>)">
													<i class="fa fa-play"></i><span class="none">듣기</span>
												</div></td>
											<td><div>
													<i class="fa  fa-download "></i><span class="none">다운로드</span>
												</div></td>
											<td><div>
													<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
												</div></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<%
							}
						%>


						<!-- 곡: 곡명으로 검색 -->
						<%
							if (!(song_mn_list.size() == 0)) {
						%>
						<div style="display: inline-block; width: 100%;">
							<h4 class="titleSc">● 곡명으로 검색</h4>
							<div class="wrap_tb_song_list">
								<table class="tb_song_list">
									<colgroup>
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 100px">
										<col style="width: 80px">
										<col style="width: 80px">
										<col style="width: 50px">
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 30px">
									</colgroup>
									<thead>
										<tr style="text-align: center;">
											<th><div>
													<input type="checkbox">
												</div></th>
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
										<tr class="songs">
											<td><div>
													<input type="checkbox">
												</div></td>
											<td><div><%=(i + 1)%></div></td>
											<td><div><%=smnlSb.getMusic_name()%></div></td>
											<td><div><%=smnlSb.getSinger_name()%></div></td>
											<td><div><%=smnlSb.getAl_name()%></div></td>
											<td><div>
													<span class="odd_span"><i class="fa fa-heart-o"></i>
														<span class="cnt">0</span></span>
												</div></td>
											<td><div
													onclick="LemonPlayer(<%=smnlSb.getMu_num()%>,<%=smnlSb.getAlbum_num()%>)">
													<i class="fa fa-play"></i><span class="none">듣기</span>
												</div></td>
											<td><div>
													<i class="fa  fa-download "></i><span class="none">다운로드</span>
												</div></td>
											<td><div>
													<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
												</div></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<%
							}
						%>


						<!-- 곡: 앨범명으로 검색 -->
						<%
							if (!(song_an_list.size() == 0)) {
						%>
						<div style="display: inline-block; width: 100%;">
							<h4 class="titleSc">● 앨범명으로 검색</h4>
							<div class="wrap_tb_song_list">
								<table class="tb_song_list">
									<colgroup>
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 100px">
										<col style="width: 80px">
										<col style="width: 80px">
										<col style="width: 50px">
										<col style="width: 30px">
										<col style="width: 30px">
										<col style="width: 30px">
									</colgroup>
									<thead>
										<tr style="text-align: center;">
											<th><div>
													<input type="checkbox">
												</div></th>
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
										<tr class="songs">
											<td><div>
													<input type="checkbox">
												</div></td>
											<td><div><%=(i + 1)%></div></td>
											<td><div><%=sanlSb.getMusic_name()%></div></td>
											<td><div><%=sanlSb.getSinger_name()%></div></td>
											<td><div><%=sanlSb.getAl_name()%></div></td>
											<td><div>
													<span class="odd_span"><i class="fa fa-heart-o"></i>
														<span class="cnt">0</span></span>
												</div></td>
											<td><div
													onclick="LemonPlayer(<%=sanlSb.getMu_num()%>,<%=sanlSb.getAlbum_num()%>)">
													<i class="fa fa-play"></i><span class="none">듣기</span>
												</div></td>
											<td><div>
													<i class="fa  fa-download "></i><span class="none">다운로드</span>
												</div></td>
											<td><div>
													<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
												</div></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<%
						}
					%>

					<!-- 곡 -->

					<!-- 앨범 -->
					<%
						if (!(album_list.size() == 0)) {
					%>
					<h3 class="titleSc">앨범</h3>
					<div class="wrap_list">
						<div>
							<ul>
								<%
									for (int i = 0; i < album_list.size(); i++) {
											SearchBean alSb = (SearchBean) album_list.get(i);
								%>
								<li style="width: 100%;">
									<div style="display: inline-block; width: 100%; border-top: 1px solid #ccc; padding-top: 10px; margin-bottom: 10px;">
										<div style="display: inline-block; width: 130px; height: 130px; border: 1px solid #ccc; float: left;">
											<a href="./LemonDetai.ct?mu_num=<%=alSb.getAl_num() %>"><img src="./musicUpload/albumcover/<%=alSb.getAl_art_img()%>"
												 width="100%" height="100%" title="<%=alSb.getAl_art_img()%>"></a>
										</div>
										<div style="display: inline-block; margin-left: 10px;">
											<p>
												<strong><%=alSb.getAl_name()%></strong>
											</p>
											<p><%=alSb.getSinger_name()%></p>
											<p><%=alSb.getAl_release()%></p>
										</div>
										<div style="display: none; clear: both;"></div>
									</div>
								</li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
					<%
						}
					%>
					<!-- 앨범 -->


					<!-- 가사 -->
					<%
						if (!(lyric_list.size() == 0)) {
					%>
					<h3 class="titleSc">가사</h3>
					<div class="wrap_list">
						<%
							for (int i = 0; i < lyric_list.size(); i++) {
									SearchBean lySb = (SearchBean) lyric_list.get(i);
						%>
						<div
							style="border-bottom: 1px solid #ccc; padding-top: 15px; padding-bottom: 15px;">
							<div>
								<b><%=lySb.getMusic_name()%></b>
							</div>
							<div
								style="display: block; margin-bottom: 4px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><%=lySb.getLyrics()%></div>
							<div><%=lySb.getSinger_name()%>
								|
								<%=lySb.getAl_name()%></div>
						</div>
						<%
							}
						%>
					</div>
					<%
						}
					%>
					<!-- 가사 -->

				</div>
				<%
					}
				%>
			</div>
			<!-- 검색 결과 -->

			<!-- 차트 -->
			<div id="contsCh">
				<jsp:include page="../board/searchChart.jsp"></jsp:include>
			</div>
			<!-- 차트 -->


			<div style="display: none; clear: both;"></div>


		</div>
	</div>

	<script type="text/javascript">
	// 검색어 초기화
	$(document).ready(function(){
		$('#top_search').val("${search}");s
	});

	
	function LemonPlayer(mu_num,album_num){
		window.open("./LemonPlayer.mp?musicNum="+mu_num+"&album="+album_num+"","a","width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
	}
	</script>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- 메뉴 Script -->
	<script type="text/javascript" src="./assets/js/search/menuSc.js"></script>
</body>
</html>