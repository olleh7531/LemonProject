<%@page import="com.lemon.chart.db.ChartBean"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">

<link rel="stylesheet" type="text/css" href="./assets/css/chart/chart.css">
<link rel="stylesheet" type="text/css" href="./assets/font-awesome/css/font-awesome.css">

<!-- <link rel="stylesheet" type="text/css"
	href="./assets/css/cahart/base.css"> -->
<link rel="stylesheet" type="text/css" href="./assets/css/chart/flexslider.css">
<link rel="stylesheet" type="text/css" href="./assets/css/chart/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/chart/fonts.css" media="all">

<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/main/main_new_album.js"></script>
<script type="text/javascript" src="./assets/js/main/main_event.js"></script>
<script type="text/javascript" src="./assets/js/main/main_hot_issue.js"></script>
<script type="text/javascript" src="./assets/js/main/main_chart.js"></script>
<script type="text/javascript" src="./assets/js/chart/chartCheckBox.js"></script>
<script type="text/javascript">
function NotYet() {
	alert("현재 구현 중입니다");	
}
</script>
<style type="text/css">
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 10px;
	text-decoration: none;
}

.pagination a.active {
	color: #edae06;
	border-bottom: 2px solid #edae06;
}
tr .button_icons {background: none !important;}
</style>
</head>
<%
// 	ArrayList chartList = (ArrayList) request.getAttribute("chartList");
	String pageNum = (String) request.getAttribute("pageNum");
	int count = ((Integer) request.getAttribute("count")).intValue();
	int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
%>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<jsp:include page="../board/lemonChart.jsp"></jsp:include>
	<!-- 본문 -->
	<div id="cont_wrap" class="clfix">
		<div
			style="border-top: 1px solid #b8b8b8; display:none; border-bottom: 1px solid #eaeaea; height: 50px; background-color: #fcfcfc;">
			<div class="div_tab">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a
						href="./LemonLatest_Chart.ct" class="cur_menu mlog"><span
							class="menu_bg menu01">최신곡</span></a></li>
					<li data-tab="tab2"><a href="./LemonAlbumList.ct">최신 앨범</a></li>
					<li data-tab="tab3"><a href="#">최신 뮤직비디오</a></li>
				</ul>
			</div>
		</div>

		<div id="conts_section" class="pr_none">


			<div id="tab1" class="tabcontent current">
				<div class="page_header" style="display: none;">
					<h2 class="title">최신곡</h2>
				</div>
				<form action="#">
					<div class="service_list_song">
						<div class="wrap_btn_tb top" style="display: none;">
							<button type="button" title="선택된 곡 듣기" class="button_rbox"
								onclick="">
								<i class="fa fa-play" style="color: #969696;"><span	class="cnt">듣기</span></i>
							</button>
							<button type="button" title="선택된 곡 담기" class="button_rbox"
								onclick="checkMusicList()">
								<i class="fa  fa-plus" style="color: #969696;"><span class="cnt">담기</span></i>
							</button>
							<button type="button" title="선택된 곡 다운로드" class="button_rbox"
								onclick="NotYet()">
								<i class="fa  fa-download " style="color: #969696;"><span class="cnt">다운</span></i>
							</button>
						</div>
						<table style="width: 100%">
							<thead>
								<tr>
									<th scope="col">
										<div class="wrap t_center">
											<span class="rank">NO</span>
										</div>
									</th>
									<th scope="col">
										<div class="wrap none">앨범이미지</div>
									</th>
									<th scope="col">
										<div class="wrap none">곡 상세가기</div>
									</th>
									<th scope="col">
										<div class="wrap pd_l_12">곡정보</div>
									</th>
									<th scope="col">
										<div class="wrap pd_l_12">앨범</div>
									</th>
									<th scope="col">
										<div class="wrap pd_l_30">좋아요</div>
									</th>
									<th scope="col">
										<div class="wrap t_center">듣기</div>
									</th>
									<th scope="col">
										<div class="wrap t_center">담기</div>
									</th>
									<th scope="col">
										<div class="wrap t_center">다운</div>
									</th>
									<th scope="col">
										<div class="wrap t_center">뮤비</div>
									</th>
								</tr>
							</thead>

							<audio preload class="album"></audio>
							<tbody>
							<c:set var="realmusic" value="${requestScope.realmusic}"/>

								
								<c:forEach var="realmusic" items="${realmusic}" varStatus="status">
									
					

					
													<tr>
									<td>
										<div class="wrap t_center" style="color: #000;">
											<span class="rank ">${realmusic.ch_playcnt}</span>
										</div>
									</td>
									<td style="width: 60px;">
										<div class="wrap">
											<a
												href="./LemonDetai.ct?mu_num=${realmusic.al_num}&pageNum=<%=pageNum%>"
												title="Sun And Moon Part.1" class="image_typeAll"> <img
												width="60" height="60"
												src="./musicUpload/albumcover/${realmusic.al_art_img}"
												alt="${realmusic.music_name}"> <span
												class="bg_album_frame"></span>
											</a>
										</div>
									</td>
									<td>
										<div class="wrap" style="text-align: center;">
											<a href="#" class="btn button_icons type03 song_info"><i
												class="fa fa-file-text-o"></i></a>
										</div>
									</td>
									<td>
										<div class="wrap">
											<div class="wrap_song_info">
												<div class="ellipsis rank01">
													<span> <a href="#" title="${realmusic.music_name}">${realmusic.music_name}</a>
													</span>
												</div>
												<br>
												<div class="ellipsis rank02">
													<a href="#" title="${realmusic.singer_name}">${realmusic.singer_name}</a>
												</div>

											</div>
										</div>
									</td>
									<td>
										<div class="wrap">
											<div class="wrap_song_info">
												<div class="ellipsis rank03">
													<a
														href="./LemonDetai.ct?mu_num=${realmusic.al_num}&pageNum=<%=pageNum%>"
														title="${realmusic.al_name}">${realmusic.al_name}</a>
												</div>
											</div>
										</div>
									</td>
									<td>
										<div class="wrap" style="text-align: center">
											<button type="button" class="button_etc like" title=""
												data-song-no="" data-song-menuid=""
												onclick="goodMusic(${realmusic.ch_music_num})">
												<span class="odd_span"><i class="fa fa-heart-o"></i>
												<span class="cnt">${realmusic.mu_good}</span>
												</span>
											</button>
										</div>
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="듣기" class="button_icons scrap"
												onclick="LemonPlayer(${realmusic.ch_music_num},${realmusic.al_num})">
												<i class="fa fa-play"></i><span class="none">듣기</span>
											</button>
										</div>
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="담기" class="button_icons scrap"
												onclick="location.href='./UserPlaylistUP.ct?mu_num=${realmusic.ch_music_num}'">
												<i class="fa  fa-plus"></i><span class="none">담기</span>
											</button>
										</div>
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="다운로드" class="button_icons download"
												onclick="MusicDownload('${realmusic.musicfile}')">
												<i class="fa  fa-download"></i><span class="none">다운로드</span>
											</button>
										</div>
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="뮤직비디오"
												class="button_icons video ">
												<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
											</button>
										</div>
									</td>
								</tr>

							
								</c:forEach>

							</tbody>
						</table>

						<div style="text-align: center;">
							<div class="pagination">
								<%
									if (count != 0) {
										if (startPage > pageBlock) {
								%>
								<a
									href="./LemonLatest_Chart.ct?pageNum=<%=startPage - pageBlock%>">
									&laquo;</a>
								<%
									}

										for (int i = startPage; i <= endPage; i++) {
								%>
								<a href="./LemonLatest_Chart.ct?pageNum=<%=i%>"
									<%if (Integer.parseInt(pageNum) == i) {%> class="active" <%}%>><%=i%>
								</a>
								<%
									}

										if (endPage < pageCount) {
								%>
								<a
									href="./LemonLatest_Chart.ct?pageNum=<%=startPage + pageBlock%>">&raquo;</a>
								<%
									}
									}
								%>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div id="tab2" class="tabcontent">
				<!-- <div class="page_header">
					<h2 class="title">최신 앨범</h2>
				</div>
				<form action="#">
					<div class="service_list_song">
						<div class="wrap_btn_tb top">
							<div class="service_list">

								<div class="service_list_album">
									<div class="thumb">
										<a href="./LemonDetai.ct"> <img width="180" height="160"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
										</a>
									</div>
									<div class="entry">
										<div class="info">
											<span class="vdo_name">[EP]</span> <a href="./LemonDetai.ct"
												class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
										<div class="wrap_btn_tb">
											<button type="button" onclick="" title="앨범듣기"
												class="button_rbox">
												<span class="button_icons type02 play"></span><span
													class="cnt">앨범듣기</span>
											</button>
											<button type="button" onclick="" title="앨범 다운로드"
												class="button_rbox">
												<span class="button_icons type02 download"></span><span
													class="cnt">앨범다운</span>
											</button>



										</div>
									</div>
								</div>
								<div class="service_list_album">
									<div class="thumb">
										<img width="180" height="160"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
									</div>
									<div class="entry">
										<div class="info">
											<span class="vdo_name">[EP]</span> <a href=""
												class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
										<div class="wrap_btn_tb">
											<button type="button" onclick="" title="앨범듣기"
												class="button_rbox">
												<span class="button_icons type02 play"></span><span
													class="cnt">앨범듣기</span>
											</button>
											<button type="button" onclick="" title="앨범 다운로드"
												class="button_rbox">
												<span class="button_icons type02 download"></span><span
													class="cnt">앨범다운</span>
											</button>



										</div>
									</div>
								</div>
								<div class="service_list_album">
									<div class="thumb">
										<img width="180" height="160"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
									</div>
									<div class="entry">
										<div class="info">
											<span class="vdo_name">[EP]</span> <a href=""
												class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
										<div class="wrap_btn_tb">
											<button type="button" onclick="" title="앨범듣기"
												class="button_rbox">
												<span class="button_icons type02 play"></span><span
													class="cnt">앨범듣기</span>
											</button>
											<button type="button" onclick="" title="앨범 다운로드"
												class="button_rbox">
												<span class="button_icons type02 download"></span><span
													class="cnt">앨범다운</span>
											</button>



										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form> -->
			</div>

			<div id="tab3" class="tabcontent">
				<div class="page_header">
					<h2 class="title">최신 뮤직비디오</h2>
				</div>
				<form action="#">
					<div class="service_list_song">
						<div class="wrap_btn_tb top">
							<div class="service_list">
								<div class="service_list_album">
									<div class="thumb_mv">
										<img width="180" height="140"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
									</div>
									<div class="entry_mv">
										<div class="info">
											<a href="" class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
									</div>
								</div>
								<div class="service_list_album">
									<div class="thumb_mv">
										<img width="180" height="140"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
									</div>
									<div class="entry_mv">
										<div class="info">
											<a href="" class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
									</div>
								</div>
								<div class="service_list_album">
									<div class="thumb_mv">
										<img width="180" height="140"
											src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/180/quality/80/optimize"
											alt="">
									</div>
									<div class="entry_mv">
										<div class="info">
											<a href="" class="ellipsis album_name"
												title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon Part.1</a>
											<span class="ellipsis artist"> <a href=""
												class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
													(SAM KIM)</a><span class="checkEllipsis" style="display: none;"><a
													href="" class="artist_name  " title="샘김 (SAM KIM) - 페이지 이동">샘김
														(SAM KIM)</a></span>
											</span>
										</div>
										<div class="meta">
											<span class="reg_date" title="발매일">2018.10.23</span> <i
												class="bar"></i>
											<button type="button" class="button_etc like"
												title="Sun And Moon Part.1 좋아요" data-album-no="10215272"
												data-album-menuid="18020123">
												<i class="fa fa-heart-o"></i> <span class="cnt"><strong
													class="none">총건수</strong>4,113</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="./assets/js/chart/jquery.flexslider-min.js"></script>
	<script src="./assets/js/chart/smooth-scroll.js"></script>
	<script src="./assets/js/chart/audio.min.js"></script>
	<script src="./assets/js/chart/twitterFetcher_min.js"></script>
	<script src="./assets/js/chart/jquery.countdown.min.js"></script>
	<script src="./assets/js/chart/script.js"></script>
	
	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>

	<script type="text/javascript">
		function LemonPlayer(mu_num,album_num){
			window.open("./LemonPlayer.mp?musicNum="+mu_num+"&album="+album_num+"","a","width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
		}
		
		function MusicDownload(singer) {

				
				$.ajax({
					type : "POST", // method="POST" 방식으로 출력 
					url : "./DownLogUp.ct", // id 체크하는 jsp 파일 주소 불러오기 
					data : {
						musicfile : singer,			
					},
					success : function(data) { // data를 가져오는 것이 성공하였을 때
						if(data==2){
							alert("로그인한 유저만 가능합니다.")
						}else{
							var afterEncoding = encodeURI(singer);
							location.href="./chart/file_down.jsp?file_name="+afterEncoding;
						}
									
					},
					error : function(xhr, status, error) { // 에러났을 때
						alert("error : " + error);
					}
				});
				
			
		}
	</script>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>