<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"><!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/common.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="my_fold">
			<div id="conts" class="">
				<h2 class="f_tit">아티스트 채널</h2>
				<div class="wrap_dtl_atist">
					<div class="dtl_atist clfix">
						<h3 class="none">아티스트 기본정보</h3>
						<!-- 프로필 이미지 -->
						<div class="wrap_thumb" title="프로필 이미지">
							<span class="thumb">
								<span class="thumb_frame"></span>
								<span id="artistImgArea">
									<img width="208" height="208"
										src="https://cdnimg.melon.co.kr/cm/artistcrop/images/002/61/143/261143_500.jpg?aad93aacac744dd0a35c1bd7b9d0f950/melon/resize/416/quality/80/optimize"
										alt="" />
								</span>
							</span>
						</div>
						<!-- 프로필 이미지 -->
						<!-- 아티스트 정보 -->
						<div class="wrap_atist_info">
							<p class="title_atist">
								<strong class="none">아티스트명</strong>아이유
								<span class="realname">&nbsp;(이지은)</span>
							</p>
							<dl class="atist_info clfix">
								<dt>데뷔</dt>
								<dd>
									<span class="gubun">2008.09.18</span>
									<a href="" title="미아 재생" class="btn_play_song">
										<span class="icon_play">곡재생</span>
										<span class="songname12">미아</span>
									</a>
								</dd>
								<dt>생일</dt>
								<dd>1993.05.16</dd>
								<dt>활동유형</dt>
								<dd>솔로</dd>
								<dt>소속사</dt>
								<dd>카카오M, 페이브엔터테인먼트</dd>
								<dt>수상이력</dt>
								<dd class="awarded">
									<span class="ellipsis">제15회 한국대중음악상
										<span class="bar">|</span>최우수 팝 음반
									</span>
									<a href="" title="아이유 상세정보 더보기" class="btn_text arrow_r">
										<span class="text">더보기</span>
										<span class="icon"></span>
									</a>
								</dd>

							</dl>
						</div> <!-- 아티스트 정보 -->
					</div>
				</div>
				<div class="wrap_atist_recommend d_artist_list" style="display: none;">
					<!--class list_type 추가시 좌측 버튼 생성-->
					<p>
						<strong>아이유</strong> 팬이시라면 이 아티스트도 좋아하실 것 같아요.
					</p>
					<div class="atist_recommend_list"></div>
					<button type="button" title="이전" class="btn_recommend_pre">
						<span class="odd_span">
							<span class="even_span">이전</span>
						</span>
					</button>
					<button type="button" title="다음" class="btn_recommend_next">
						<span class="odd_span">
							<span class="even_span">다음</span>
						</span>
					</button>
				</div>

				<!-- 탭 메뉴 -->
				<div class="wrap_tab_atist">
					<ul>
						<li class="first_child on">
							<a href="" title="아이유 타임라인">
								<span class="cntt">
									<span class="icon_timeline">타임라인</span>
								</span>
							</a>
						</li>
						<li class="">
							<a href="" title="아이유 곡정보">
								<span class="cntt">곡</span>
							</a>
						</li>
						<li class="">
							<a href="" title="아이유 앨범정보">
								<span class="cntt">앨범</span>
							</a>
						</li>
						<li class="">
							<a href="" title="아이유 비디오정보">
								<span class="cntt">비디오</span>
							</a>
						</li>
						<li class="">
							<a href="" title="아이유 포토정보">
								<span class="cntt">포토/스토리</span>
							</a>
						</li>
					</ul>
				</div> <!-- 탭 메뉴 -->
			</div>
		</div>
	</div>
	<!-- 내용 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
