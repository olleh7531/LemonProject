<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">

<link rel="stylesheet" type="text/css"
	href="./assets/css/cahart/chart.css">
<link rel="stylesheet" type="text/css"
	href="./assets/font-awesome/css/font-awesome.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/main/main_new_album.js"></script>
<script type="text/javascript" src="./assets/js/main/main_event.js"></script>
<script type="text/javascript" src="./assets/js/main/main_hot_issue.js"></script>
<script type="text/javascript" src="./assets/js/main/main_chart.js"></script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<!-- 본문 -->
	<div id="cont_wrap" class="clfix">
		<div
			style="border-top: 1px solid #b8b8b8; border-bottom: 1px solid #eaeaea; height: 50px; background-color: #fcfcfc;">
			<div class="div_tab">
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#"
						class="cur_menu mlog"><span class="menu_bg menu01">최신곡</span></a></li>
					<li data-tab="tab2"><a href="#">최신 앨범</a></li>
					<li data-tab="tab3"><a href="#">최신 뮤직비디오</a></li>
				</ul>
			</div>
		</div>

		<div id="conts_section" class="pr_none">


			<div id="tab1" class="tabcontent current">
				<div class="page_header">
					<h2 class="title">최신곡</h2>
				</div>
				<form action="#">
					<div class="service_list_song">
						<div class="wrap_btn_tb top">

							<button type="button" title="선택된 곡 듣기" class="button_rbox"
								onclick="">
								<i class="fa fa-play" style="color: #969696;"></i><span
									class="cnt">듣기</span>
							</button>
							<button type="button" title="선택된 곡 담기" class="button_rbox"
								onclick="">
								<i class="fa  fa-plus" style="color: #969696;"></i><span
									class="cnt">담기</span>
							</button>
							<button type="button" title="선택된 곡 다운로드" class="button_rbox"
								onclick="">
								<i class="fa  fa-download " style="color: #969696;"><span
									class="cnt"></i>다운</span>
							</button>


						</div>
						<table style="width: 100%">
							<thead>
								<tr>
									<th scope="col">
										<div class="wrap t_right">
											<input type="checkbox" title="곡 목록 전체 선택"
												class="input_check d_checkall">
										</div>
									</th>
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
							<tbody>
								<tr>
									<td>
										<div class="wrap t_right">
											<input type="checkbox" title="Make Up (Feat. Crush) 곡 선택"
												class="input_check " name="input_check" value="31376041">
										</div>
									</td>

									<td>
										<div class="wrap t_center" style="color: #000;">
											<span class="rank ">1</span><span class="none">위</span>
										</div>
									</td>
									<td style="width: 60px;">
										<div class="wrap">
											<a href="./LemonDetai.ct" title="Sun And Moon Part.1"
												class="image_typeAll"> <img
												onerror="WEBPOCIMG.defaultAlbumImg(this);" width="60"
												height="60"
												src="https://cdnimg.melon.co.kr/cm/album/images/102/15/272/10215272_500.jpg/melon/resize/120/quality/80/optimize"
												alt="Sun And Moon Part.1 - 페이지 이동"> <span
												class="bg_album_frame"></span>
											</a>
										</div>
									</td>
									<td>
										<div class="wrap" style="text-align: center;">
											<a href="#" class="btn button_icons type03 song_info"><a
												href="#"><i class="fa fa-file-text-o"></i></a></a>
										</div>
									</td>
									<td>
										<div class="wrap">
											<div class="wrap_song_info">
												<div class="ellipsis rank01">
													<span> <a href="#" title="Make Up (Feat. Crush) 재생">Make
															Up (Feat. Crush)</a>
													</span>
												</div>
												<br>
												<div class="ellipsis rank02">
													<a href="#" title="샘김 (SAM KIM) - 페이지 이동">샘김 (SAM KIM)</a>
												</div>

											</div>
										</div>
									</td>
									<td>
										<div class="wrap">
											<div class="wrap_song_info">
												<div class="ellipsis rank03">
													<a href="./LemonDetai.ct"
														title="Sun And Moon Part.1 - 페이지 이동">Sun And Moon
														Part.1</a>
												</div>
											</div>
										</div>
									</td>
									<td>
										<div class="wrap" style="text-align: center">
											<button type="button" class="button_etc like"
												title="Make Up (Feat. Crush) 좋아요" data-song-no="31376041"
												data-song-menuid="18030123">
												<span class="odd_span"><i class="fa fa-heart-o"></i><span
													class="cnt">3,409</span></span>
											</button>
										</div> <!--<a href="#"><i class="fa  fa-heart-o"></i>222</a>-->
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="듣기" class="button_icons play">
												<i class="fa fa-play"></i><span class="none">듣기</span>
											</button>
										</div>
									</td>
									<td>
										<div class="wrap t_center">
											<button type="button" title="담기" class="button_icons scrap">
												<i class="fa  fa-plus"></i><span class="none">담기</span>
											</button>
										</div>
									</td>
									<td>

										<div class="wrap t_center">
											<button type="button" title="다운로드"
												class="button_icons download ">
												<i class="fa  fa-download "></i><span class="none">다운로드</span>
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
							</tbody>

						</table>
					</div>
				</form>
			</div>

			<div id="tab2" class="tabcontent">
				<div class="page_header">
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
				</form>
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
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>