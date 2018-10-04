<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css" href="../assets/css/common/common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/menu/menu_common.css">
<link rel="stylesheet" type="text/css" href="../assets/css/menu/menu_search.css">
<link rel="stylesheet" type="text/css" href="../assets/css/menu/menu_search_realtime.css">
<link rel="stylesheet" type="text/css" href="../assets/css/menu/menu_banner.css">
<link rel="stylesheet" type="text/css" href="../assets/css/menu/menu.css">
</head>
<body>
	<div id="wrap">
		<div id="header" class="main">
			<div id="header_wrap" class="pr_none">
				<!-- 메인 컨텐츠 가운데 정렬을 위한 pr_none 클래스 추가 -->
				
				<div id="gnb" class="clfix">
					<!-- 로고 -->
					<h1>
						<a href="../index.html" title="레몬 Lemon 로고 - 홈으로 이동" class="mlog">
							<img src="../assets/img/menu/menu_logo.png" alt="레몬 Lemon 로고 이미지">
						</a>
					</h1>
					<!-- 로고 -->
					
					<!-- 통합검색 영역 -->
					<fieldset>
						<legend>통합검색영역</legend>
						<input type="text" title="검색 입력 편집창" placeholder="" name="" id="top_search"
							style="width: 249px">
						<input type="hidden" name="keywordLink" id="keywordLink" value="">
						<button type="button" style="display: none;" id="top_search_autocomplete_toggle"
							class="btn_icon btn_auto close" title="자동검색 펼침">
							<span class="odd_span">자동검색 펼침</span>
						</button>
						<!-- open/close 클래스 사용 -->
						<button type="button" class="btn_icon search_m" title="검색">
							<span class="odd_span">검색</span>
						</button>
						<div class="auto_complete" id="top_search_autocomplete">
							<div class="auto_complete_cont" style="display: block;">
								<!-- 자동완성 레이어 -->
							</div>
						</div>
						<div class="auto_complete" id="top_search_autocomplete_template"
							style="display: none;">
							<!-- 자동완성 레이어 템플릿 -->
							<!-- 텍스트 결과 -->
							<ul class="text_result">
								<li><a href="#" class="autocomplete-label"></a></li>
							</ul>
							<!-- 섬네일 결과 -->
							<ul class="thumb_result">
								<li class="cate"></li>
								<li class="class02">
									<a href="#">
										<span class="thumb_40">
											<span class="thumb_frame"></span>
											<img class="autocomplete-img" width="40" height="40" alt="">
										</span>
										<div class="info">
											<span class="autocomplete-label"></span><br>
											<span>
												<span class="f11 autocomplete-info"></span>
											</span>
										</div>
									</a>
								</li>
							</ul>
							<!-- 검색어가 없을 때 -->
							<ul class="text_result">
								<li class="result_none">
									<span>해당글자로 시작하는 단어가 없습니다.</span>
								</li>
							</ul>
						</div>
					</fieldset>
					<form style="display: none" id="searchFrm" method="get" action="">
						<input type="hidden" name="q">
						<input type="hidden" name="section">
					</form>
					<!-- //통합검색 영역 -->
					
					<!-- 실시간 검색어 -->
					<div class="realtime_soar_keyword">
						<a href="/search/trend/index.htm" class="title" style="display: inline-block;">급상승 키워드</a>
						<div class="keyword_overlay">
							<ol style="overflow:hidden; height:20px;">
								<!-- 롤링 영역 -->
								<li style="top: 0px; display: none;">
									<strong class="order bg1 on">1
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="휘성 (Realslow) - 페이지 이동">휘성 (Realslow)</a>
									<span class="wrap_rank static"> <span class="icon">순위 동일</span> </span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg2">2
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="우주속에서 - 페이지 이동">우주속에서</a>
									<span class="wrap_rank new"> <span class="icon">새진입</span> </span>
								</li>
								<li style="top: 0px; display: list-item;">
									<strong class="order bg3">3
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="최진혁 - 페이지 이동">최진혁</a>
									<span class="wrap_rank down">
										<span class="icon">순위하락수</span>
										<span class="num">1</span>
									</span>
								</li>
								<li style="top: 0px; display: none;" class="">
									<strong class="order bg4">4
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="세글자 - 페이지 이동">세글자</a>
									<span class="wrap_rank up">
										<span class="icon">순위상승수</span>
										<span class="num">72</span>
									</span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg5">5
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="손 the guest OST - 페이지 이동">손 the guest OST</a>
									<span class="wrap_rank static">
										<span class="icon">순위 동일</span>
									</span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg6">6
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="마성의 기쁨 OST - 페이지 이동">마성의 기쁨 OST</a>
									<span class="wrap_rank static">
										<span class="icon">순위 동일</span>
									</span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg7">7
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="SURAN (수란) - 페이지 이동">SURAN (수란)</a>
									<span class="wrap_rank up">
										<span class="icon">순위상승수</span>
										<span class="num">2</span>
									</span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg8">8
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="아이유 - 페이지 이동">아이유</a>
									<span class="wrap_rank up">
										<span class="icon">순위상승수</span>
										<span class="num">549</span>
									</span>
								</li>
								<li style="top: 0px; display: none;" class="">
									<strong class="order bg9">9
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="레오 (빅스) - 페이지 이동">레오 (빅스)</a>
									<span class="wrap_rank new">
										<span class="icon">새진입</span>
									</span>
								</li>
								<li style="top: 0px; display: none;">
									<strong class="order bg10">10
										<span class="gubun">.</span>
										<span class="none"> 위</span>
									</strong>
									<a href="" class="ellipsis" title="정일훈 - 페이지 이동">정일훈</a>
									<span class="wrap_rank up">
										<span class="icon">순위상승수</span>
										<span class="num">10</span>
									</span>
								</li>
							<!-- //롤링 영역 -->
							</ol>
							<a href="/search/trend/index.htm" class="keyword_more" title="실시간 순위">
								<span>더보기 
									<span></span>
								</span>
							</a>
						</div>
					</div>
				</div>
				<!-- //실시간 검색어 -->
				
				<!-- 배너 영역 -->
	            <div class="cmn_banner">
	               <a href="" title="라이브원(소유) 사전알림 당일 - 페이지 이동" class="d_item mlog">
	                  <img class="mySlides" width="280" height="75"
	                     src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002062810.png" alt="">
	               </a>
	               <a href="" title="이용권(니니즈 10월) - 페이지 이동" class="d_item mlog">
	                  <img class="mySlides" width="280" height="75"
	                  	src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20180928071055.png" alt="">
	               </a>
	               <a href="" title="게토레이 5차 - 페이지 이동" class="d_item mlog">
	                  <img class="mySlides" width="280" height="75"
	                  	src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20180912115049.png" alt="">
	               </a>
	               <div class="gnb_banner_btn">
					   <a class="btn prev d_btn_ctrl" title="이전 이벤트 보기" onclick="plusDivs(-1)">이전 이벤트 보기</a>
					   <a class="btn next d_btn_ctrl" title="다음 이벤트 보기" onclick="plusDivs(1)">다음 이벤트 보기</a>
					  </div>
				</div>
				<!-- 배너 영역 -->
			
				<!-- 메뉴 -->
				<div id="menu">
					<ul>
						<li class="menu1">
							<a href="" class="cur_menu mlog">
								<span class="menu_bg menu01">레몬차트</span>
							</a>
						</li>
						<li class="menu2">
							<a href="" class="cur_menu mlog">
								<span class="menu_bg menu02">최신</span>
							</a>
						</li>
						<li class="menu3">
							<a href="" class="cur_menu mlog">
								<span class="menu_bg menu03">장르</span>
							</a>
						</li>
						<li class="menu4">
							<a href="" class="mlog">
								<span class="menu_more menu04">공지사항</span>
							</a>
						</li>
						<li class="menu5">
							<a href="" class="mlog">
								<span class="menu_more menu05">스타포스트</span>
							</a>
						</li>
						<li class="menu6">
							<a href="" class="mlog">
								<span class="menu_more menu06">매거진</span>
							</a>
						</li>
						<li class="menu7">
							<a href="" lass="cur_menu mlog">
								<span class="menu_bg menu07">마이뮤직</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 메뉴 -->
			</div>
		</div>