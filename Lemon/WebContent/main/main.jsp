<%@page import="com.lemon.chart.db.ChartBean"%>
<%@page import="com.lemon.chart.db.ChartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript"
	src="./assets/js/menu/main_search_real_time.js"></script>
<script type="text/javascript" src="./assets/js/main/main_new_album.js"></script>
<script type="text/javascript" src="./assets/js/main/main_event.js"></script>
<script type="text/javascript" src="./assets/js/main/main_hot_issue.js"></script>
<script type="text/javascript" src="./assets/js/main/main_chart.js"></script>
<script type="text/javascript" src="./assets/js/main/main_login.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>



</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		// LoginAction에서 받아온 세션값 id 정보를 저장 
		String email_id = (String) session.getAttribute("email_id");
		MemberDAO mdao = new MemberDAO();
		String nickName = mdao.getNick(email_id);
		int level = mdao.getLevel(email_id);
		System.out.println("email_id : " + email_id);
		ArrayList<ChartBean> cb = (ArrayList) request.getAttribute("cb");
		ArrayList<ChartBean> cb01 = (ArrayList) request.getAttribute("cb01");
		ArrayList<ChartBean> listimg = (ArrayList) request.getAttribute("listimg");
	%>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<input type="hidden" id="gg_email">
	<input type="hidden" id="gg_name">

	<!-- 본문 -->
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="pr_none">
			<!-- 메인 컨텐츠 가운데 정렬을 위한 pr_none 클래스 추가 -->
			<!-- contents -->
			<div id="conts" class="clfix">
				<!-- 최신앨범 -->
				<div class="new_album">
					<h2>
						<a href="/new/album/index.htm" title="최신 앨범"
							class="title_link mlog">최신 앨범</a>
					</h2>
					<div class="section_na">
						<!-- 최신 앨범 장르 -->
						<!-- <ul class="new_album_cate">
							<li class="bg_none on nth1">
								<a href="" class="mlog" title="전체 최신앨범 보기">전체</a>
							</li>
							<li class="nth2">
								<a href="" class="mlog" title="가요 최신앨범 보기">가요</a>
							</li>
							<li class="nth3">
								<a href="" class="mlog" title="POP 최신앨범 보기">POP</a>
							</li>
							<li class="nth4">
								<a href="" class="mlog" title="OST 최신앨범 보기">OST</a>
							</li>
							<li class="nth5">
								<a href="" class="mlog" title="J-POP 최신앨범 보기">J-POP</a>
							</li>
						</ul> -->
						<!-- 최신 앨범 장르 -->
						<!-- 최신 앨범 리스트 -->
						<div>
							<div class="list_wrap">
								<ul class="sub_list btn_new_album">
									<%
										for (int i = 0; i < cb.size(); i++) {
											ChartBean cb0 = cb.get(i);
									%>
									<li>
										<dl>
											<dt>
												<span class="none"><%=cb0.getAl_name()%></span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="./musicUpload/albumcover/<%=cb0.getAl_art_img()%>"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												<!-- [DP] 재생 레이어 -->
												<div class="overlay">
													<a
														href="javascript:LemonPlayer(<%=cb0.getMu_num()%>,<%=cb0.getAlbum_num()%>)"
														class="btn_play_song mlog" title="그곳에서 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="./LemonDetai.ct?mu_num=<%=cb0.getAlbum_num()%>"
														class="album mlog"> <span class="album_cont"
														title="<%=cb0.getAl_name()%>"> <span
															class="title_wrap"> <span
																class="title title_ellipsis"><%=cb0.getAl_name()%></span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="./LemonDetai.ct?mu_num=<%=cb0.getAlbum_num()%>"
																title="<%=cb0.getAl_singer_name()%> - 페이지 이동"
																class="play_artist mlog"> <span><%=cb0.getAl_singer_name()%></span>
															</a>
														</div>
													</div>
												</div>
												<!-- //[DP] 재생 레이어 -->
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="./LemonDetai.ct?mu_num=<%=cb0.getMu_num()%>"
														title="<%=cb0.getAl_singer_name()%> - 페이지 이동"
														class="play_artist mlog"> <span><%=cb0.getAl_singer_name()%></span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="./LemonDetai.ct?mu_num=<%=cb0.getMu_num()%>"
														title="<%=cb0.getAl_singer_name()%> - 페이지 이동"
														class="play_artist mlog"> <span><%=cb0.getAl_singer_name()%></span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>

									<%
										}
									%>
									<!-- <li>
										<dl>
											<dt>
												<span class="none">그곳에서</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/835/10208835_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="그곳에서 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="그곳에서"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">그곳에서</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="Dok2 - 페이지 이동" class="play_artist mlog">
																<span>Dok2</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="Dok2 - 페이지 이동" class="play_artist mlog">
														<span>Dok2</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="Dok2 - 페이지 이동" class="play_artist mlog">
															<span>Dok2</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">우리의 여름은 가고 가을이 또 왔네요</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/853/10208853_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="우리의 여름은 가고 가을이 또 왔네요 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="우리의 여름은 가고 가을이 또 왔네요"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">우리의 여름은 가고 가을이 또 왔네요</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="깃든 - 페이지 이동" class="play_artist mlog">
																<span>깃든</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="깃든 - 페이지 이동" class="play_artist mlog">
														<span>깃든</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="깃든 - 페이지 이동" class="play_artist mlog">
															<span>깃든</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">和(화)</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/809/10208809_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="和(화) 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="和(화)"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">和(화)</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="카코포니 (cacophony) - 페이지 이동"
																class="play_artist mlog"> <span>카코포니
																	(cacophony)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="카코포니 (cacophony) - 페이지 이동"
														class="play_artist mlog"> <span>카코포니
															(cacophony)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="카코포니 (cacophony) - 페이지 이동"
														class="play_artist mlog"> <span>카코포니
																(cacophony)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">손 the guest OST Part 1</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/712/10208712_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="손 the guest OST Part 1 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="손 the guest OST Part 1">
															<span class="title_wrap"> <span
																class="title title_ellipsis">손 the guest OST Part
																	1</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="오존 (O3ohn) - 페이지 이동"
																class="play_artist mlog"> <span>오존 (O3ohn)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="오존 (O3ohn) - 페이지 이동"
														class="play_artist mlog"> <span>오존 (O3ohn)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="오존 (O3ohn) - 페이지 이동"
														class="play_artist mlog"> <span>오존 (O3ohn)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">오늘의 탐정 OST Part 4</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/861/10208861_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="오늘의 탐정 OST Part 4 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="오늘의 탐정 OST Part 4"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">오늘의 탐정 OST Part 4</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="휘성 (Realslow) - 페이지 이동"
																class="play_artist mlog"> <span>휘성 (Realslow)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="휘성 (Realslow) - 페이지 이동"
														class="play_artist mlog"> <span>휘성 (Realslow)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="휘성 (Realslow) - 페이지 이동"
														class="play_artist mlog"> <span>휘성 (Realslow)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">CAELO</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/587/10208587_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="CAELO 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="CAELO"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">CAELO</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="Babylon (베이빌론) - 페이지 이동"
																class="play_artist mlog"> <span>Babylon
																	(베이빌론)</span>
															</a>
														</div>
													</div>
												</div>
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="Babylon (베이빌론) - 페이지 이동"
														class="play_artist mlog"> <span>Babylon (베이빌론)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="Babylon (베이빌론) - 페이지 이동"
														class="play_artist mlog"> <span>Babylon (베이빌론)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li> -->
								</ul>
								<ul class="sub_list btn_new_album" style="display: none;">
									<%
										for (int i = 0; i < cb01.size(); i++) {
											ChartBean cb02 = cb01.get(i);
									%>
									<li>
										<dl>
											<dt>
												<span class="none"><%=cb02.getAl_name()%></span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="./musicUpload/albumcover/<%=cb02.getAl_art_img()%>"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												<!-- [DP] 재생 레이어 -->
												<div class="overlay">
													<a
														href="javascript:LemonPlayer(<%=cb02.getMu_num()%>,<%=cb02.getAlbum_num()%>)"
														class="btn_play_song mlog" title="그곳에서 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="./LemonDetai.ct?mu_num=<%=cb02.getAlbum_num()%>"
														class="album mlog"> <span class="album_cont"
														title="<%=cb02.getAl_name()%>"> <span
															class="title_wrap"> <span
																class="title title_ellipsis"><%=cb02.getAl_name()%></span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="./LemonDetai.ct?mu_num=<%=cb02.getAlbum_num()%>"
																title="<%=cb02.getAl_singer_name()%> - 페이지 이동"
																class="play_artist mlog"> <span><%=cb02.getAl_singer_name()%></span>
															</a>
														</div>
													</div>
												</div>
												<!-- //[DP] 재생 레이어 -->
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="./LemonDetai.ct?mu_num=<%=cb02.getAlbum_num()%>"
														title="<%=cb02.getAl_singer_name()%> - 페이지 이동"
														class="play_artist mlog"> <span><%=cb02.getAl_singer_name()%></span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="./LemonDetai.ct?mu_num=<%=cb02.getAlbum_num()%>"
														title="<%=cb02.getAl_singer_name()%> - 페이지 이동"
														class="play_artist mlog"> <span><%=cb02.getAl_singer_name()%></span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<%
										}
									%>
									<!-- <li>
										<dl>
											<dt>
												<span class="none">그림</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/872/10208872_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="그림 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="그림"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">그림</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="듀자매 - 페이지 이동" class="play_artist mlog">
																<span>듀자매</span>
															</a>
														</div>
													</div>
												</div>
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="듀자매 - 페이지 이동" class="play_artist mlog">
														<span>듀자매</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="듀자매 - 페이지 이동" class="play_artist mlog">
															<span>듀자매</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">Super Market</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/799/10208799_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="Super Market 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="Super Market"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">Super Market</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="풍뎅이 (PDE) - 페이지 이동"
																class="play_artist mlog"> <span>풍뎅이 (PDE)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="풍뎅이 (PDE) - 페이지 이동"
														class="play_artist mlog"> <span>풍뎅이 (PDE)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="풍뎅이 (PDE) - 페이지 이동"
														class="play_artist mlog"> <span>풍뎅이 (PDE)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">인생</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/791/10208791_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="인생 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="인생"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">인생</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="조덕환 - 페이지 이동" class="play_artist mlog">
																<span>조덕환</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="조덕환 - 페이지 이동" class="play_artist mlog">
														<span>조덕환</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="조덕환 - 페이지 이동" class="play_artist mlog">
															<span>조덕환</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">이 밤 (This Night)</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/735/10208735_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="이 밤 (This Night) 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="이 밤 (This Night)"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">이 밤 (This Night)</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="노래하는 말괄량이 (The Singing Girls) - 페이지 이동"
																class="play_artist mlog"> <span>노래하는 말괄량이
																	(The Singing Girls)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="노래하는 말괄량이 (The Singing Girls) - 페이지 이동"
														class="play_artist mlog"> <span>노래하는 말괄량이 (The
															Singing Girls)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="노래하는 말괄량이 (The Singing Girls) - 페이지 이동"
														class="play_artist mlog"> <span>노래하는 말괄량이 (The
																Singing Girls)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">내 뒤에 테리우스 OST Part.1</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/662/10208662_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="내 뒤에 테리우스 OST Part.1 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="내 뒤에 테리우스 OST Part.1"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">내 뒤에 테리우스 OST Part.1</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="가호 (Gaho) - 페이지 이동"
																class="play_artist mlog"> <span>가호 (Gaho)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="가호 (Gaho) - 페이지 이동"
														class="play_artist mlog"> <span>가호 (Gaho)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="가호 (Gaho) - 페이지 이동"
														class="play_artist mlog"> <span>가호 (Gaho)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">SEASON1/#4</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/754/10208754_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="SEASON1/#4 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="SEASON1/#4"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">SEASON1/#4</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="엠투엠 (M To M) - 페이지 이동"
																class="play_artist mlog"> <span>엠투엠 (M To M)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="엠투엠 (M To M) - 페이지 이동"
														class="play_artist mlog"> <span>엠투엠 (M To M)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="엠투엠 (M To M) - 페이지 이동"
														class="play_artist mlog"> <span>엠투엠 (M To M)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li> -->
								</ul>
								<!-- <ul class="sub_list btn_new_album" style="display: none;">
									<li>
										<dl>
											<dt>
												<span class="none">HYPERISM BLUE</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/758/10208758_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="HYPERISM BLUE 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="HYPERISM BLUE"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">HYPERISM BLUE</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="솔비 - 페이지 이동" class="play_artist mlog">
																<span>솔비</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="솔비 - 페이지 이동" class="play_artist mlog">
														<span>솔비</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="솔비 - 페이지 이동" class="play_artist mlog">
															<span>솔비</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">온기</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/781/10208781_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="온기 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="온기"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">온기</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="다시보기 - 페이지 이동" class="play_artist mlog">
																<span>다시보기</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="다시보기 - 페이지 이동" class="play_artist mlog">
														<span>다시보기</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="다시보기 - 페이지 이동" class="play_artist mlog">
															<span>다시보기</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">Tune of the Life</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/808/10208808_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="Tune of the Life 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="Tune of the Life"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">Tune of the Life</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="루빈 - 페이지 이동" class="play_artist mlog">
																<span>루빈</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="루빈 - 페이지 이동" class="play_artist mlog">
														<span>루빈</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="루빈 - 페이지 이동" class="play_artist mlog">
															<span>루빈</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">It`s My</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/772/10208772_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="It`s My 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="It`s My"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">It`s My</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="LOVO (Lobo Da King) - 페이지 이동"
																class="play_artist mlog"> <span>LOVO (Lobo Da
																	King)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="LOVO (Lobo Da King) - 페이지 이동"
														class="play_artist mlog"> <span>LOVO (Lobo Da
															King)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="LOVO (Lobo Da King) - 페이지 이동"
														class="play_artist mlog"> <span>LOVO (Lobo Da
																King)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">Worth It</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/613/10208613_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="Worth It 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="Worth It"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">Worth It</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="Ted Park - 페이지 이동"
																class="play_artist mlog"> <span>Ted Park</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="Ted Park - 페이지 이동"
														class="play_artist mlog"> <span>Ted Park</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="Ted Park - 페이지 이동"
														class="play_artist mlog"> <span>Ted Park</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">내일도 맑음 OST Part.25</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/751/10208751_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="내일도 맑음 OST Part.25 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="내일도 맑음 OST Part.25"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">내일도 맑음 OST Part.25</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="김은비 - 페이지 이동" class="play_artist mlog">
																<span>김은비</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="김은비 - 페이지 이동" class="play_artist mlog">
														<span>김은비</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="김은비 - 페이지 이동" class="play_artist mlog">
															<span>김은비</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
								</ul> -->
								<!-- <ul class="sub_list btn_new_album" style="display: none;">
									<li>
										<dl>
											<dt>
												<span class="none">밤</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/622/10208622_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="밤 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="밤"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">밤</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="1L2L - 페이지 이동" class="play_artist mlog">
																<span>1L2L</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="1L2L - 페이지 이동" class="play_artist mlog">
														<span>1L2L</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="1L2L - 페이지 이동" class="play_artist mlog">
															<span>1L2L</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">Flexin</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/626/10208626_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="Flexin 재생">
														<span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="Flexin"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">Flexin</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="24 Flakko - 페이지 이동"
																class="play_artist mlog"> <span>24 Flakko</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="24 Flakko - 페이지 이동"
														class="play_artist mlog"> <span>24 Flakko</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="24 Flakko - 페이지 이동"
														class="play_artist mlog"> <span>24 Flakko</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">Vol.1 Mix tape
													Boom&amp;Beat&amp;Clap</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/753/10208753_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="Vol.1 Mix tape Boom&Beat&Clap 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="Vol.1 Mix tape Boom&Beat&Clap">
															<span class="title_wrap"> <span
																class="title title_ellipsis">Vol.1 Mix tape
																	Boom&amp;Beat&amp;Clap</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="Rose Finger(로즈핑거) - 페이지 이동"
																class="play_artist mlog"> <span>Rose
																	Finger(로즈핑거)</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="Rose Finger(로즈핑거) - 페이지 이동"
														class="play_artist mlog"> <span>Rose
															Finger(로즈핑거)</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="Rose Finger(로즈핑거) - 페이지 이동"
														class="play_artist mlog"> <span>Rose
																Finger(로즈핑거)</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">사랑은</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/749/10208749_3_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog" title="사랑은 재생"> <span
														class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="사랑은"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">사랑은</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="스탠딩 에그 - 페이지 이동"
																class="play_artist mlog"> <span>스탠딩 에그</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="스탠딩 에그 - 페이지 이동" class="play_artist mlog">
														<span>스탠딩 에그</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="스탠딩 에그 - 페이지 이동"
														class="play_artist mlog"> <span>스탠딩 에그</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">S.O.U.L DIGITAL SINGLE</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/748/10208748_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="S.O.U.L DIGITAL SINGLE 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="S.O.U.L DIGITAL SINGLE">
															<span class="title_wrap"> <span
																class="title title_ellipsis">S.O.U.L DIGITAL
																	SINGLE</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="S.O.U.L - 페이지 이동"
																class="play_artist mlog"> <span>S.O.U.L</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="S.O.U.L - 페이지 이동"
														class="play_artist mlog"> <span>S.O.U.L</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="S.O.U.L - 페이지 이동"
														class="play_artist mlog"> <span>S.O.U.L</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<span class="none">October Lover</span>
											</dt>
											<dd class="img">
												<span class="none">앨범이미지:</span> <span class="thum">
													<img width="156" height="156"
													src="https://cdnimg.melon.co.kr/cm/album/images/102/08/752/10208752_500.jpg/melon/quality/80/resize/156/optimize"
													alt=""> <span class="bg_album_frame"></span>
												</span>
												[DP] 재생 레이어
												<div class="overlay">
													<a href="" class="btn_play_song mlog"
														title="October Lover 재생"> <span class="none">앨범전체듣기</span>
													</a> <a href="" class="album mlog"> <span
														class="album_cont" title="October Lover"> <span
															class="title_wrap"> <span
																class="title title_ellipsis">October Lover</span>
														</span>
													</span>
													</a>
													<div class="singer">
														<span class="none">가수명:</span>
														<div class="ellipsis">
															<a href="" title="이소라 - 페이지 이동" class="play_artist mlog">
																<span>이소라</span>
															</a>
														</div>
													</div>
												</div>
												//[DP] 재생 레이어
											</dd>
											<dd class="singer layer_singer">
												<span class="none">가수명:</span>
												<div class="ellipsis">
													<a href="" title="이소라 - 페이지 이동" class="play_artist mlog">
														<span>이소라</span>
													</a> <span class="checkEllipsis" style="display: none;">
														<a href="" title="이소라 - 페이지 이동" class="play_artist mlog">
															<span>이소라</span>
													</a>
													</span>
												</div>
											</dd>
										</dl>
									</li>
								</ul> -->
							</div>
							<div class="wrap_page">
								<div class="page">
									
									<span class="	wrap_btn"> 
									<a title="이전" style="cursor: pointer;" onclick="plusNewAlbum(-1)"> 
									<span class="odd_span">◀</span> </a> 
									
									<a title="다음" style="cursor: pointer;" onclick="plusNewAlbum(1)"> 
									<span class="odd_span">▶</span> </a>
									</span>
								</div>
							</div>
						</div>
						<!-- 최신 앨범 리스트 -->
					</div>
				</div>
				<!-- //최신앨범 -->

				<!-- 이벤트 -->
				<div class="event">
					<!-- <div class="event_default">
						<a href="" class="image_type24" title="Dok2" style="display: none;">
							<img width="236" height="315"
								src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002064541.png/melon/quality/80"
								alt="">
							<span class="bg_album_frame"></span>
						</a>
					</div> -->
					<div class="event_list" style="width: 236px;">

						<%
							for (int i = 0; i < listimg.size(); i++) {
								ChartBean cbimg = listimg.get(i);
						%>
						<a href="" class="image_type24 mlog"
							title="<%=cbimg.getAl_name()%>"> <img width="236"
							height="315"
							src="./musicUpload/albumcover/<%=cbimg.getAl_art_img()%>" alt="">
							<span class="bg_album_frame"></span>
						</a>
						<%
							}
						%>
						<!-- <a href="" class="image_type24 mlog" title="Dok2"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002064541.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="S.O.U.L"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002044330.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="이소라"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002044351.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="Omega Sapien"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002063235.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="엠투엠 (M To M)"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002063301.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="iKON"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001045608.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> <a href="" class="image_type24 mlog" title="박원"> <img
							width="236" height="315"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001045630.png/melon/quality/80"
							alt=""> <span class="bg_album_frame"></span>
						</a> -->
					</div>
					<!-- <div class="play_control">
						<a href="#" class="d_btn_ctrl pause btn_pause" title="이벤트 일시정지">
							<span>일시정지</span>
						</a>
						<div class="move">
							윗부분의 a.image_type24 갯수만큼 인디케이터를 넣기
							<a href="#" class="d_indicator mlog on" title="1번째 이벤트 보기">1번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="2번째 이벤트 보기">2번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="3번째 이벤트 보기">3번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="4번째 이벤트 보기">4번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="5번째 이벤트 보기">5번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="6번째 이벤트 보기">6번째 이벤트</a>
							<a href="#" class="d_indicator mlog" title="7번째 이벤트 보기">7번째 이벤트</a>
						</div>
					</div> -->
				</div>
				<!-- //이벤트 -->

				<!-- 로그인 -->
				<div class="id_wrap mt24">

					<c:set var="e_id" value="<%=email_id%>" />
					<c:if test="${empty e_id  || e_id == 'null'}">
						<!-- 로그인하지 않았을 때 -->
						<form action="./MemberLoginAction.mb" method="post">
							<div class="login_wrap" id="gnbLoginDiv">
								<div class="inbox">
									<fieldset>
										<legend>로그인 영역</legend>
										<div class="input_area">
											<input type="text" placeholder="아이디" name="email_id"
												class="text_id_main" title="아이디 입력 편집창"
												style="width: 199px; outline: 0;"> <input
												type="password" placeholder="비밀번호" name="pass"
												title="비밀번호 입력 편집창" class="text_password_main"
												style="width: 199px; outline: 0;">
											<div class="save_id">
												<input type="checkbox" name="saveId" id="id_save01" class="">
												<label for="id_save01">아이디 저장</label>
											</div>
											<button type="submit" class="btn_main_login" title="로그인">
												<span class="odd_span"> <span class="even_span">로그인</span>
												</span>
											</button>
										</div>

										<div class="main_naver_login" style="vertical-align:middle;">
											<div id="naverIdLogin" style="float: left;"></div>
											<p style="display: inline-block; font-size:13px; font-family: 'Dotum'; color: #6f5552;margin-left: 2px;">NAVER</p>
											<div style="display:none; clear: both;"></div>
										</div>



										<div class="main_google_login">
											<input type="button" id="googleLogin" value="Checking..."
												onclick="
									   if(this.value === 'Google Login'){
										gauth.signIn().then(function(){
									    	checkLoginStatus();
										});
								       } else {
									   	gauth.signOut().then(function(){
									   		checkLoginStatus();
										});
								   			 }">
										</div>

										<div class="wrap_member">
											<a href="./MemberFind.mb" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a>
											<a href="./MemberJoin.mb" title="회원가입">회원가입</a>
										</div>
									</fieldset>
								</div>
							</div>
						</form>
					</c:if>
					<!-- 로그인하지 않았을 때 -->

					<!-- 로그인하였을 때 -->
					<c:if test="${!empty e_id}">
						<div class="logout_wrap">
							<!-- 로그인 유저 정보 관련 -->
							<div class="mem_info">
								<strong> <a class="id_area"><%=nickName%></a> 님
								</strong> 
								<input type="button" class="btn_logout" value="로그아웃"
									onclick="
									gauth.signOut().then(function(){
										location.href='./MemberLogoutAction.mb';
									});">
							</div>
							<!-- 로그인 유저 정보 관련
						로그인한 유저 이용권 관련 -->
							<div class="mem_used">
								<strong class="product_name">
 								<a>
 									<strong>
 										<span>E-mail : <%=email_id %></span>
 									</strong>
 								</a>
 								
 								<a>
 									<strong>
 										<%if(level == 1) {%>
 										<span>회원 등급 : 관리자</span>
 										<%} else {%>
 										<span>회원 등급 : 일반 회원</span>
 										<%}%>
 									</strong>
 								</a>
 							</strong>		
							</div>
							<!-- 로그인한 유저 이용권 관련 -->
						</div>
					</c:if>
					<!-- 로그인하였을 때 -->

					<!-- 콘서트 -->
					<div class="promotion_wrap">
						<div class="promotion_default" style="display: none;">
							<a href="" title="[티켓] 박정현"> 
							<img width="280" height="188"
								src="./assets/img/main/common/underLogin.png"> 
								<span class="bg_album_frame"></span>
							</a>
						</div>
						<ul style="width: 280px;">
							<li class="d_item">
							<a href="" title="[티켓] 박정현" class="mlog">
							<img width="280" height="188" src="./assets/img/main/common/underLogin.png"> 
							<span class="bg_album_frame"></span>
							</a></li>
						</ul>
						<div class="play_control" style="display: none;">
							<div class="move">
								<a href="#" class="d_indicator on mlog" title="1번째 이벤트 보기">1번째
									이벤트</a>
							</div>
						</div>
					</div>
					<!-- 콘서트 -->
				</div>
				<!-- //로그인 -->

				<!-- 인기 있어요 -->
				<div class="hot_issue">
					<h2>
						<span class="title_link">인기 있어요</span> <span class="txt_intro">지금
							이슈가 되는 아티스트의 인기 컨텐츠입니다.</span>
					</h2>
					<!-- 리스트 -->
					<div class="hot_issue_bxslider">
						<ul class="sub_list btn_hot_issue">
							<li class="issue_list04">
								<dl class="ml0">
									<dd class="mov_area">
										<a href="" title="스탠딩 에그 '사랑은' Teaser" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001055401.jpg/melon/quality/80"
											alt=""> <span class="playtime"> <strong
												class="none">재생시간</strong> <span class="time">00:37</span>
										</span> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="스탠딩 에그 '사랑은' Teaser" class="mlog"> <span
											class="title">스탠딩 에그 '사랑은' Teaser</span> <span
											class="ellipsis">이번 신곡은 사랑 노래? 이별 노래?</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬TV">레몬TV</a>
										</span> <span class="inquiry">조회 2,612</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="Young Kay 'TALK' 티저 촬영장" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002051107.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="Young Kay 'TALK' 티저 촬영장" class="mlog"> <span
											class="title">Young Kay 'TALK' 티저 촬영장</span> <span
											class="ellipsis">대세, 키프클랜 막둥이의 첫 싱글!</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬매거진">레몬매거진</a>
										</span> <span class="inquiry">조회 439</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="꼭꼭 숨어있던 좋은 노래♪" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001055410.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="꼭꼭 숨어있던 좋은 노래♪" class="mlog"> <span
											class="title">꼭꼭 숨어있던 좋은 노래♪</span> <span class="ellipsis">똑같은
												음악에 지친 사람 모두 주목!</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬DJ">레몬DJ</a>
										</span> <span class="inquiry">조회 45,145</span>
										</span>
									</dd>
								</dl>
								<dl class="ml0">
									<dd class="mov_area">
										<a href="" title="에피톤 프로젝트 '마음속의 단어들'" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002051121.jpg/melon/quality/80"
											alt=""> <span class="playtime"> <strong
												class="none">재생시간</strong> <span class="time">04:00</span>
										</span> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="에피톤 프로젝트 '마음속의 단어들'" class="mlog"> <span
											class="title">에피톤 프로젝트 '마음속의 단어들'</span> <span
											class="ellipsis">기대감 폭발하게 만드신 Preview</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬TV">레몬TV</a>
										</span> <span class="inquiry">조회 2,743</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="다시 들어도 좋은 발라드 명곡!" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001055421.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="다시 들어도 좋은 발라드 명곡!" class="mlog"> <span
											class="title">다시 들어도 좋은 발라드 명곡!</span> <span class="ellipsis">1990~2000년대를
												장악했던 그 감성</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬DJ">레몬DJ</a>
										</span> <span class="inquiry">조회 342,578</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="가을과의 환상조합 [클래식 A to Z]" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002051152.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="가을과의 환상조합 [클래식 A to Z]" class="mlog"> <span
											class="title">가을과의 환상조합 [클래식 A to Z]</span> <span
											class="ellipsis">가을 그 자체, 브람스와 차이콥스키</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬매거진">레몬매거진</a>
										</span> <span class="inquiry">조회 3,046</span>
										</span>
									</dd>
								</dl>
							</li>
						</ul>
						<ul class="sub_list btn_hot_issue">
							<li class="issue_list04">
								<dl class="ml0">
									<dd>
										<a href="" title="인기많은 축가&amp;프로포즈 베스트" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001113838.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="인기많은 축가&amp;프로포즈 베스트" class="mlog"> <span
											class="title">인기많은 축가&amp;프로포즈 베스트</span> <span
											class="ellipsis">10월, 돌아온 결혼식의 계절</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬DJ">레몬DJ</a>
										</span> <span class="inquiry">조회 311,796</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd class="mov_area">
										<a href="" title="치즈 'Everything To' Teaser" class="mlog">
											<img width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002112454.jpg/melon/quality/80"
											alt=""> <span class="playtime"> <strong
												class="none">재생시간</strong> <span class="time">00:51</span>
										</span> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="치즈 'Everything To' Teaser" class="mlog">
											<span class="title">치즈 'Everything To' Teaser</span> <span
											class="ellipsis">한 소절만 들었는데 취향저격 각…♡</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬TV">레몬TV</a>
										</span> <span class="inquiry">조회 2,430</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="싱어송라이터 박원 [r] 녹음 현장" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002112502.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="싱어송라이터 박원 [r] 녹음 현장" class="mlog"> <span
											class="title">싱어송라이터 박원 [r] 녹음 현장</span> <span
											class="ellipsis">그가 좋아하는, 'r'로 시작하는 것들</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬매거진">레몬매거진</a>
										</span> <span class="inquiry">조회 1,610</span>
										</span>
									</dd>
								</dl>
								<dl class="ml0">
									<dd>
										<a href="" title="조금은 강렬한 기분전환이 필요할 때" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001113851.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="조금은 강렬한 기분전환이 필요할 때" class="mlog"> <span
											class="title">조금은 강렬한 기분전환이 필요할 때</span> <span
											class="ellipsis">모든 일이 잘 될 것 같은 기분이 들어</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬DJ">레몬DJ</a>
										</span> <span class="inquiry">조회 11,621</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd class="mov_area">
										<a href="" title="황치열 '어찌 잊으오' MV" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181001113857.jpg/melon/quality/80"
											alt=""> <span class="playtime"> <strong
												class="none">재생시간</strong> <span class="time">04:43</span>
										</span> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="황치열 '어찌 잊으오' MV" class="mlog"> <span
											class="title">황치열 '어찌 잊으오' MV</span> <span class="ellipsis">드라마의
												대미를 장식한 애절한 노래</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬TV">레몬TV</a>
										</span> <span class="inquiry">조회 33,628</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<a href="" title="쌀쌀한 날, 따뜻함이 느껴지는 재즈" class="mlog"> <img
											width="223" height="148"
											src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002112527.jpg/melon/quality/80"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</dd>
									<dt>
										<a href="" title="쌀쌀한 날, 따뜻함이 느껴지는 재즈" class="mlog"> <span
											class="title">쌀쌀한 날, 따뜻함이 느껴지는 재즈</span> <span
											class="ellipsis">감성과 마음에 온기를 채워줄게요♪</span>
										</a>
									</dt>
									<dd class="view_no">
										<span> <span class="bar"> <a href=""
												title="레몬DJ">레몬DJ</a>
										</span> <span class="inquiry">조회 25,331</span>
										</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="wrap_page">
						<div class="page">							
							<span class="wrap_btn"> 
							<a class="btn btn_pre mlog_without_page_change" title="이전22"> 
							<span class="odd_span">이전</span>
							</a> 
							
							<a class="btn btn_next mlog_without_page_change" title="다음22">
							<span class="odd_span">다음</span>
							</a>
							</span>
						</div>
					</div>
				</div>
				<!-- 인기 있어요 -->

				<!-- 레몬차트 -->
				<div class="chart">
					<h2>
						<a href="" class="title_link mlog">레몬 차트</a> <img
							src="./assets/img/main/chart/main_chart_subject_arrow.png">
					</h2>
					<div class="wrap_chart_tab">
						<ul>
							<c:set var="realmusic" value="${requestScope.realmusic}"/>
							<!-- 실시간 차트 -->
							<li class="nth1 chart_tab_li"><a title="실시간 보기"
								class="d_link tab_link realtime"> <span
									class="chart_tab_span">실시간</span>
							</a> <!-- <span class="none">실시간</span> -->
								<div class="list_wrap typeRealtime">
									<span class="txt_intro">
									${fn:substring(realmusic[0].ch_updatetime,0,10)} <strong>${fn:substring(realmusic[0].ch_updatetime,10,16)} </strong>
										기준
									</span>
									<ul>
									
									
					<c:forEach var="realmusic" items="${realmusic}" varStatus="status">
									
									<c:if test="${realmusic.ch_ranking==9999999}">
										<li class="rank_item">
											<div class="rank_number nth${status.index+1}">
												<span class="rank">${status.index+1}</span> <span class="none">위</span> <span
													class="ranking_num new"> <span class="icon">새진입</span>
												</span>
											</div>
										</c:if>
		
									
									<c:if test="${realmusic.ch_ranking>0}">
									
										<li class="rank_item">
											<div class="rank_number nth${status.index+1}">
												<span class="rank">${status.index+1}</span> <span class="none">위</span> <span
													class="ranking_num up"> <span class="num">${realmusic.ch_ranking}</span> <span
													class="icon">단계 상승</span>
												</span>
											</div>
										</c:if>
										
									<c:if test="${realmusic.ch_ranking<0}">
												<li class="rank_item odd">
											<div class="rank_number nth${status.index+1}">
												<span class="rank">${status.index+1}</span> <span class="none">위</span> <span
													class="ranking_num down"> <span class="num">${realmusic.ch_ranking}</span>
													<span class="icon">단계 하락</span>
												</span>
											</div>
									</c:if>
									

									<c:if test="${realmusic.ch_ranking eq 0}">
											<li class="rank_item">
											<div class="rank_number nth${status.index+1}">
												<span class="rank">${status.index+1} </span> <span class="none">위</span> <span
													class="ranking_num static"> <span class="num">${realmusic.ch_ranking}</span>
													<span class="icon">순위 동일</span>
												</span>
											</div>
									</c:if>

									
												<div class="rank_cntt">
												<div class="thumb">
													<a title="${realmusic.music_name}" class="mlog">
														<img width="48" height="48"
														src="./musicUpload/albumcover/${realmusic.al_art_img}"
														alt=""> <span class="bg_album_frame">실시간</span>
													</a>
												</div>
												<div class="rank_info">
													<p class="song" data-song-no="31316695">
														<a href="/Lemon/UniSearch.sc?search=${realmusic.music_name}&sort=최신순" class="ellipsis mlog"
															title="${realmusic.music_name}">${realmusic.music_name}</a>
													</p>
													<div class="artist">
														<div class="ellipsis">
															<a href="/Lemon/UniSearch.sc?search=${realmusic.singer_name}&sort=최신순" title="${realmusic.singer_name} - 페이지 이동" class="fc_mgray mlog">${realmusic.singer_name}</a>
															<span class="checkEllipsisRealtimeChart"
																style="display: none"> <a 
																title="${realmusic.singer_name} - 페이지 이동" class="fc_mgray mlog">${realmusic.singer_name}</a>
															</span>
														</div>
													</div>
												</div>
											</div>
										</li>
					
							
								</c:forEach>
	
										
									</ul>
									<div class="chart_btn_area">			
										<div class="all_view">
											<a href="/Lemon/LemonLatest_Chart.ct" title="레몬차트 더보기" class="mlog"> <span>더보기
													<span></span>
											</span>
											</a>
										</div>
									</div>
								</div></li>
							<!-- //실시간 차트 -->
					</div>
				</div>
				<!-- //레몬차트 -->
			</div>
			<!-- //contents -->
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "GZJyb8Yn7TxRCuHu2w07",
			callbackUrl : "http://localhost:8088/Lemon/CallbackNaver.mb",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "green",
				type : 1,
				height : 15
			}
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>
	<script type="text/javascript">
		function LemonPlayer(mu_num, album_num) {
			window
					.open(
							"./LemonPlayer.mp?musicNum=" + mu_num + "&album="
									+ album_num + "",
							"a",
							"width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
		}
	</script>



</body>
</html>
