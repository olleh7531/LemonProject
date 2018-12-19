<%@page import="com.lemon.member.db.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Date"%>
<%@page import="com.lemon.artistchanel.db.ArtistChanelInfoDAO"%>
<%@page import="com.lemon.artistchanel.db.ArtistChanelInfoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel_common.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel_tabmenu.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel_song.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel_photo.css">
<link rel="stylesheet" type="text/css" href="./assets/css/starpost/artist_chanel_info.css">
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/common/jquery.cookie.js"></script>
<!-- <script type="text/javascript" src="./assets/js/common/jquery-migrate-3.0.1.js"></script> -->
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_tabmenu.js"></script>
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_photo.js"></script>
</head>
<body>
<%-- <%
	// 아티스트 정보 번호
	int artist = Integer.parseInt(request.getParameter("artist"));
 	// 디비 처리 객체 ArtistChanelInfoDAO 객체 생성
	ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();
	
	// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
	ArtistChanelInfoBean acibean = acidao.getArtistChanelInfo(artist);
	String g_singer_name = acibean.getGroup_singer_name();
	String g_singer_num = acibean.getGroup_singer_num();
 	List group = acidao.getGroupMember(g_singer_num);
	
	// null이거나"" 일 때 처리 사항 관련
	// -> 에러나서 여기에서 불러옴
		// 본명 ->""
		String real_name = acibean.getReal_name();
		
		// 데뷔 날짜 -> null
		Date debut_year = acibean.getDebut_year();
		
		// 생일 -> null
		Date siger_birth = acibean.getSi_birth();
		
		// 소속사 ->""
		String agency = acibean.getSi_agency();
	
		// 소속 그룹 멤버 ->""
		String group_name ="";
		
		if(!acibean.getGroup_singer_name().equals("")) {
			group_name = acibean.getGroup_singer_name();
			group_name = group_name.substring(0, group_name.length() - 1);
		}
%> --%>

	<%
		String email_id = (String) session.getAttribute("email_id");
		MemberDAO mdao = new MemberDAO();
		int level = mdao.getLevel(email_id);
	%>
	
	<!-- ArtistChanelInfoBean 불러오기 -->
	<c:set var="info" value="${requestScope.info}"/>
	
	<!-- 그룹 -> 그룹 멤버 가져오기 -->
	<c:set var="group_member" value="${requestScope.group_member}"/>
	
	<!-- 솔로 -> 그룹 이름 불러오기 -->
	<c:set var="solo_group" value="${requestScope.solo_group}"/>
	
	<!-- ArtistChanelPhotoBean 불러오기 -->
	<c:set var="photo" value="${requestScope.photo}"/>
	
	<!-- ArtistChanelPhoto 페이지 처리하기 -->
	<c:set var="photo_list" value="${requestScope.photo_list}"/>
	<c:set var="page_num" value="${requestScope.page_num}"/>
	<c:set var="count" value="${requestScope.count}"/>
	<c:set var="page_count" value="${requestScope.page_count}"/>
	<c:set var="page_block" value="${requestScope.page_block}"/>
	<c:set var="start_page" value="${requestScope.start_page}"/>
	<c:set var="end_page" value="${requestScope.end_page}"/>
	
	<!-- url 아티스트 번호 불러오기 -->
	<c:set var="artist" value="${param.artist}"/>
	
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	<input type="hidden" id="artist" value="${artist}">
	
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="my_fold">
			<div id="conts" class="">
				<h2 class="f_tit">아티스트 채널</h2>
				<!-- 아티스트 기본정보 -->
				<div class="wrap_dtl_atist">
					<div class="dtl_atist clfix">
						<h3 class="none">아티스트 기본정보</h3>
						<!-- 프로필 이미지 -->
						<div class="wrap_thumb" title="프로필 이미지">
							<span class="thumb">
								<span class="thumb_frame"></span>
								<span id="artistImgArea">
									<%-- <%
										if(acibean.getSi_picture() != null) {
									%>
									<img width="208" height="208"
										src="./upload/starpost/singerProfile/<%=acibean.getSi_picture()%>"
										alt="">
									<%
										}
										else {
									%>
									<img width="208" height="208" src="" alt="">
									<%
										}
									%> --%>
									<c:choose>
										<c:when test="${info.si_picture!=null}">
											<img width="208" height="208"
												src="./upload/starpost/singerProfile/${info.si_picture}"
												alt="">
											</c:when>
										<c:otherwise>
											<img width="208" height="208" src="" alt="">
										</c:otherwise>
									</c:choose>
								</span>
							</span>
						</div>
						<!-- 프로필 이미지 -->
						
						<!-- 아티스트 정보 -->
						<c:if test="${info != null}">
						<div class="wrap_atist_info">
							<p class="title_atist">
								<%-- <strong class="none">아티스트명</strong><%=acibean.getSinger_name()%>
								<% if(!real_name.equals("")) { %>
								<span class="realname">(<%=real_name%>)</span>
								<% } %> --%>
								<strong class="none">아티스트명</strong>${info.singer_name}
								<c:if test="${info.real_name != ''}">
									<span class="realname">(${info.real_name})</span>
								</c:if>
							</p>
							<dl class="atist_info clfix">
								<%-- <%	if(debut_year != null) {%> --%>
								<c:if test="${info.debut_year != null}">
								<dt>데뷔</dt>
									<%-- <dd><%=debut_year%> --%>
									<dd>${info.debut_year}
										<span class="gubun"></span>
										<%-- <a href="" title="<%=acibean.getDebut_song()%> 재생" class="btn_play_song"> --%>
										<a href="" title="${info.debut_song} 재생" class="btn_play_song">
											<span class="icon_play">곡재생</span>
											<%-- <span class="songname12"><%=acibean.getDebut_song()%></span> --%>
											<span class="songname12">${info.debut_song}</span>
										</a>
									</dd>
								</c:if>
								<%-- <% } %>
								<% if(siger_birth != null) {%> --%>
								<c:if test="${info.si_birth != null}">
								<dt>생일</dt>
									<%-- <dd><%=siger_birth%></dd>
								<% } %> --%>
									<dd>${info.si_birth}</dd>
								</c:if>
								<dt>활동유형</dt>
									<%-- <dd><%=acibean.getActivity_type()%></dd> --%>
									<dd>${info.activity_type}</dd>
								<%-- <%
									if(!group_name.equals("")) {
								%> --%>
								<c:forEach items="${group_member}" var="list_group_member" varStatus="status_group_member">
								<c:if test="${list_group_member.singer_name != null}">
								<c:if test="${status_group_member.first}">
								<dt>멤버</dt>
									<dd>
								</c:if>
									<%-- <%
										for(int i = 0; i < group.size(); i++) {
								  		ArtistChanelInfoBean gbean = (ArtistChanelInfoBean) group.get(i);
									%> --%>
									<%-- <dd><%=group_num %></dd> --%>
										<%-- <a href="./ArtistChanel.ac?artist=<%=acibean_group_member.getSi_num() %>"
											title="<%=acibean_group_member.getSinger_name() %>" class="ellipsis"><%=acibean_group_member.getSinger_name()%>
										</a> --%>
										<a href="./ArtistChanel.ac?artist=${list_group_member.si_num}"
											title="${list_group_member.singer_name}" class="ellipsis">${list_group_member.singer_name}
										</a>
								<%-- <%
										}
								%> --%>
								<c:if test="${status_group_member.last}">
									</dd>									
								</c:if>
								<%-- <%
									}
								%> --%>
								</c:if>
								</c:forEach>
								<%-- <% if(!agency.equals("")) { %> --%>
								<c:if test="${info.si_agency != ''}">
								<dt>소속사</dt>
									<%-- <dd><%=acibean.getSi_agency()%></dd> --%>
									<dd>${info.si_agency}</dd>
								<%-- <%} %> --%>
								</c:if>
							</dl>
						</div>
						</c:if>
						<!-- 아티스트 정보 -->
						
						<!-- 관리자 전용 -->
						<% 
						if(email_id != null) {
							if(email_id.equals("admin")) { %>
							<div class="wrap_intst">
								<div class="fan_area">
									<div class="list_userlk01">
										<strong class="none">이 아티스트 팬</strong>
										<ul class="clfix" id="artistTopLikeUserLayer">										
											<li>
												<a href="" title="비디오 글쓰기" class="box_userlk01">
													<span class="memid">비디오 글쓰기</span>
												</a>
											</li>
											<li>
												<a href="" title="비디오 수정" class="box_userlk01">
													<span class="memid">비디오 수정</span>
												</a>
											</li>
											<li>
												<a href="./AdminArtistChanelPhoto.ac" title="포토 글쓰기" class="box_userlk01">
													<span class="memid">포토 글쓰기</span>
												</a>
											</li>
											<li>
												<a href="" title="포토 수정" class="box_userlk01">
													<span class="memid">포토 수정</span>
												</a>
											</li>
											<li>
												<a href="./AdminArtistChanelInfo.ac" title="소개 글쓰기" class="box_userlk01">
													<span class="memid">소개 글쓰기</span>
												</a>
											</li>
											<li>
												<a href="" title="소개 수정" class="box_userlk01">
													<span class="memid">소개 수정</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						<%}
						} %>
					</div>
				</div>
				<!-- 아티스트 기본정보 -->
				
				<!-- 탭 메뉴 -->
				<div class="wrap_tab_atist">
					<ul class="artist_chanel_tab">
						<li class="first_child" data-tab="artist_chanel_tab1">
							<a href="" title="아이유 곡정보">
								<span class="cntt">곡</span>
							</a>
						</li>
						<li class="" data-tab="artist_chanel_tab2">
							<a href="#" title="아이유 앨범정보">
								<span class="cntt">앨범</span>
							</a>
						</li>
						<li class="" data-tab="artist_chanel_tab3">
							<a href="#" title="아이유 비디오정보">
								<span class="cntt">비디오</span>
							</a>
						</li>
						<li class="" data-tab="artist_chanel_tab4">
							<a href="#" title="아이유 포토정보">
								<span class="cntt">포토</span>
							</a>
						</li>
						<li class="" data-tab="artist_chanel_tab5">
							<a href="#" title="아이유 상세정보">
								<span class="cntt">소개</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 탭 메뉴 -->
				
				<!-- 곡리스트 -->
				<div class="section_vdo artist_chanel_tab1 current tab_content">
					<div class="sort_info clfix">
						<div class="wrap_sort fl_left" id="sort_layer">
							<a href="" title="발매 보기" class="ico_radio on" radio-value="A">
								<span class="icon"></span>
								<span class="text">
									<span>발매</span>(155)
								</span>
							</a>
							<a href="" title="참여 보기" class="ico_radio" radio-value="F">
								<span class="icon"></span>
								<span class="text">
									<span>참여</span>(16)
								</span>
							</a>
							<a href="" title="작사 보기" class="ico_radio" radio-value="L">
								<span class="icon"></span>
								<span class="text">
									<span>작사</span>(51)
								</span>
							</a>
							<a href="" title="작곡 보기" class="ico_radio" radio-value="C">
								<span class="icon"></span>
								<span class="text">
									<span>작곡</span>(21)
								</span>
							</a>
						</div>
						<ul class="list_sort fl_right">
							<li class="first_child on">
								<a href="" id="ISSUE_DATE" class="orderClass" title="곡 리스트 최신순으로 정렬">최신순</a>
							</li>
							<li class="">
								<a href="" id="POPULAR_SONG_LIST" class="orderClass" title="곡 리스트 인기순으로 정렬">인기순</a>
							</li>
							<li class="">
								<a href="" id="SONG_NAME_WEB_LIST" class="orderClass" title="곡 리스트 가나다순으로 정렬">가나다순</a>
							</li>
						</ul>
					</div>
					<!-- 곡리스트 -->
					<div id="pageList">
						<!-- 곡1 목록 -->
						<form id="frm" name="frm">
							<div class="tb_list d_song_list songTypeOne" style="width: 1008px;">
								<div class="wrap_btn_tb top">
									<button type="button" title="곡 목록 전체 선택" class="btn_base short check_all d_checkall">
										<span class="odd_span">
											<span class="even_span">전체선택</span>
										</span>
									</button>
									<button type="button" title="선택된 곡 재생 - 새 창" class="btn_base short play d_listen">
										<span class="odd_span">
											<span class="even_span">듣기</span></span>
									</button>
									<button type="button" title="선택된 곡 다운로드 - 새 창" class="btn_base short download d_download">
										<span class="odd_span">
											<span class="even_span">다운</span>
										</span>
									</button>
									<button type="button" title="선택된 곡 담기 - 새 창" class="btn_base short scrap d_scrap">
										<span class="odd_span">
											<span class="even_span">담기</span>
										</span>
									</button>
									<button type="button" title="선택된 곡 선물하기 - 새 창" class="btn_base short gift d_gift">
										<span class="odd_span">
											<span class="even_span">선물</span>
										</span>
									</button>
								</div>
								<table style="width: 100%">
									<caption>
										곡 목록입니다. 목록에 있는 곡을 선택하여 재생, 다운로드, 플레이리스트 담기, 선물하기가 가능합니다.
									</caption>
									<colgroup>
										<col style="width: 29px">
										<col style="width: 48px">
										<col style="width: 100%">
										<col style="width: 152px">
										<col style="width: 146px">
										<col style="width: 82px">
										<col style="width: 49px">
										<col style="width: 40px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">
												<div class="wrap pd_none left">
													<input type="checkbox" title="곡 목록 전체 선택" class="input_check d_checkall">
												</div>
											</th>
											<th scope="col">
												<div class="wrap">NO</div>
											</th>
											<th scope="col">
												<div class="wrap">곡명</div>
											</th>
											<th scope="col" class="t_left">
												<div class="wrap">아티스트</div>
											</th>
											<th scope="col" class="t_left">
												<div class="wrap">앨범</div>
											</th>
											<th scope="col" class="t_left">
												<div class="wrap right_none">좋아요</div>
											</th>
											<th scope="col">
												<div class="wrap pd_none left">뮤비</div>
											</th>
											<th scope="col">
												<div class="wrap pd_none right">다운</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="wrap pd_none left">
													<input type="checkbox" title="삐삐 곡 선택" class="input_check"
														name="input_check" value="31346009">
												</div>
											</td>
											<td class="no">
												<div class="wrap">1</div>
											</td>
											<td class="t_left">
												<div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play" title="삐삐 재생 - 새 창">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add" title="삐삐 곡담기 - 새 창">
															<span class="odd_span">담기</span>
														</button>
														<a href="" title="삐삐 곡정보 - 페이지 이동" class="btn btn_icon_detail">
															<span class="odd_span">삐삐</span>
														</a>
														<span title="타이틀 곡" class="icon_song title">타이틀 곡</span>
														<a href="" class="fc_gray" title="삐삐 재생 - 새 창">삐삐</a>
													</div>
												</div>
											</td>
											<td class="t_left">
												<div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis" style="max-width: 122px">
														<a href="" title="아이유 - 페이지 이동" class="fc_mgray">아이유</a>
														<span class="checkEllipsis" style="display: none">
															<a href="" title="아이유 - 페이지 이동" class="fc_mgray">아이유</a>
														</span>
													</div>
												</div>
											</td>
											<td class="t_left">
												<div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="" title="삐삐 - 페이지 이동" class="fc_mgray">삐삐</a>
													</div>
												</div>
											</td>
											<td class="t_left">
												<div class="wrap right_none">
													<button type="button" class="btn_icon like" title="삐삐"
														data-song-no="31346009" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span>
														<span class="cnt">
															<span class="none">총건수</span>0
														</span>
													</button>
												</div>
											</td>
											<td>
												<div class="wrap pd_none left">
													<button type="button" class="btn_icon mv" title="삐삐 뮤직비디오 - 새 창">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div>
											</td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="삐삐 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '31346009', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="가을 아침 곡 선택"
														class="input_check" name="input_check" value="30636089">
												</div></td>
											<td class="no"><div class="wrap">2</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="가을 아침 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30636089);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="가을 아침 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30636089');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30636089');"
															title="가을 아침 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">가을 아침</span></a> <a
															href="javascript:melon.play.playSong('27030101',30636089);"
															class="fc_gray" title="가을 아침 재생 - 새 창">가을 아침</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="가을 아침"
														data-song-no="30636089" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="가을 아침 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30636089','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="가을 아침 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30636089', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="비밀의 화원 곡 선택"
														class="input_check" name="input_check" value="30646584">
												</div></td>
											<td class="no"><div class="wrap">3</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="비밀의 화원 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30646584);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="비밀의 화원 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30646584');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30646584');"
															title="비밀의 화원 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">비밀의 화원</span></a> <a
															href="javascript:melon.play.playSong('27030101',30646584);"
															class="fc_gray" title="비밀의 화원 재생 - 새 창">비밀의 화원</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="비밀의 화원"
														data-song-no="30646584" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="비밀의 화원 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30646584','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="비밀의 화원 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30646584', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="잠 못 드는 밤 비는 내리고 곡 선택"
														class="input_check" name="input_check" value="30646585">
												</div></td>
											<td class="no"><div class="wrap">4</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="잠 못 드는 밤 비는 내리고 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30646585);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="잠 못 드는 밤 비는 내리고 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30646585');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30646585');"
															title="잠 못 드는 밤 비는 내리고 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">잠
																못 드는 밤 비는 내리고</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',30646585);"
															class="fc_gray" title="잠 못 드는 밤 비는 내리고 재생 - 새 창">잠 못
															드는 밤 비는 내리고</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="잠 못 드는 밤 비는 내리고" data-song-no="30646585"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="잠 못 드는 밤 비는 내리고 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30646585','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="잠 못 드는 밤 비는 내리고 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30646585', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="어젯밤 이야기 곡 선택"
														class="input_check" name="input_check" value="30646586">
												</div></td>
											<td class="no"><div class="wrap">5</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="어젯밤 이야기 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30646586);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="어젯밤 이야기 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30646586');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30646586');"
															title="어젯밤 이야기 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">어젯밤 이야기</span></a> <a
															href="javascript:melon.play.playSong('27030101',30646586);"
															class="fc_gray" title="어젯밤 이야기 재생 - 새 창">어젯밤 이야기</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="어젯밤 이야기"
														data-song-no="30646586" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="어젯밤 이야기 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30646586','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="어젯밤 이야기 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30646586', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="개여울 곡 선택" class="input_check"
														name="input_check" value="30646587">
												</div></td>
											<td class="no"><div class="wrap">6</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="개여울 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30646587);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="개여울 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30646587');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30646587');"
															title="개여울 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">개여울</span></a> <a
															href="javascript:melon.play.playSong('27030101',30646587);"
															class="fc_gray" title="개여울 재생 - 새 창">개여울</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="개여울"
														data-song-no="30646587" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="개여울 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30646587','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="개여울 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30646587', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="매일 그대와 곡 선택"
														class="input_check" name="input_check" value="30646588">
												</div></td>
											<td class="no"><div class="wrap">7</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="매일 그대와 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30646588);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="매일 그대와 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30646588');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30646588');"
															title="매일 그대와 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">매일 그대와</span></a> <a
															href="javascript:melon.play.playSong('27030101',30646588);"
															class="fc_gray" title="매일 그대와 재생 - 새 창">매일 그대와</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10096855');"
															title="꽃갈피 둘 - 페이지 이동" class="fc_mgray">꽃갈피 둘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="매일 그대와"
														data-song-no="30646588" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="매일 그대와 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30646588','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="매일 그대와 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30646588', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="이 지금 곡 선택"
														class="input_check" name="input_check" value="30378155">
												</div></td>
											<td class="no"><div class="wrap">8</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="이 지금 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378155);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="이 지금 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378155');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378155');"
															title="이 지금 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">이 지금</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378155);"
															class="fc_gray" title="이 지금 재생 - 새 창">이 지금</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="이 지금"
														data-song-no="30378155" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="이 지금 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378155','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="이 지금 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378155', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="팔레트 (Feat. G-DRAGON) 곡 선택"
														class="input_check" name="input_check" value="30378156">
												</div></td>
											<td class="no"><div class="wrap">9</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="팔레트 (Feat. G-DRAGON) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378156);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="팔레트 (Feat. G-DRAGON) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378156');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378156');"
															title="팔레트 (Feat. G-DRAGON) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">팔레트
																(Feat. G-DRAGON)</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',30378156);"
															class="fc_gray" title="팔레트 (Feat. G-DRAGON) 재생 - 새 창">팔레트
															(Feat. G-DRAGON)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="팔레트 (Feat. G-DRAGON)" data-song-no="30378156"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="팔레트 (Feat. G-DRAGON) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378156','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="팔레트 (Feat. G-DRAGON) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378156', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="이런 엔딩 곡 선택"
														class="input_check" name="input_check" value="30378157">
												</div></td>
											<td class="no"><div class="wrap">10</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="이런 엔딩 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378157);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="이런 엔딩 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378157');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378157');"
															title="이런 엔딩 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">이런 엔딩</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378157);"
															class="fc_gray" title="이런 엔딩 재생 - 새 창">이런 엔딩</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="이런 엔딩"
														data-song-no="30378157" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="이런 엔딩 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378157','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="이런 엔딩 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378157', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="잼잼 곡 선택" class="input_check"
														name="input_check" value="30378159">
												</div></td>
											<td class="no"><div class="wrap">11</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="잼잼 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378159);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="잼잼 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378159');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378159');"
															title="잼잼 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">잼잼</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378159);"
															class="fc_gray" title="잼잼 재생 - 새 창">잼잼</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="잼잼"
														data-song-no="30378159" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="잼잼 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378159','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="잼잼 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378159', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="Black Out 곡 선택"
														class="input_check" name="input_check" value="30378160">
												</div></td>
											<td class="no"><div class="wrap">12</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Black Out 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378160);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Black Out 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378160');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378160');"
															title="Black Out 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">Black
																Out</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378160);"
															class="fc_gray" title="Black Out 재생 - 새 창">Black Out</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="Black Out" data-song-no="30378160"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="Black Out 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378160','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Black Out 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378160', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="마침표 곡 선택" class="input_check"
														name="input_check" value="30378161">
												</div></td>
											<td class="no"><div class="wrap">13</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="마침표 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378161);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="마침표 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378161');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378161');"
															title="마침표 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">마침표</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378161);"
															class="fc_gray" title="마침표 재생 - 새 창">마침표</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="마침표"
														data-song-no="30378161" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="마침표 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378161','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="마침표 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378161', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="그렇게 사랑은 곡 선택"
														class="input_check" name="input_check" value="30378163">
												</div></td>
											<td class="no"><div class="wrap">14</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="그렇게 사랑은 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378163);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="그렇게 사랑은 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378163');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378163');"
															title="그렇게 사랑은 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">그렇게 사랑은</span></a> <a
															href="javascript:melon.play.playSong('27030101',30378163);"
															class="fc_gray" title="그렇게 사랑은 재생 - 새 창">그렇게 사랑은</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="그렇게 사랑은"
														data-song-no="30378163" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="그렇게 사랑은 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378163','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="그렇게 사랑은 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378163', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="이름에게 곡 선택"
														class="input_check" name="input_check" value="30378164">
												</div></td>
											<td class="no"><div class="wrap">15</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="이름에게 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30378164);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="이름에게 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30378164');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30378164');"
															title="이름에게 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">이름에게</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',30378164);"
															class="fc_gray" title="이름에게 재생 - 새 창">이름에게</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10056666');"
															title="Palette - 페이지 이동" class="fc_mgray">Palette</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="이름에게"
														data-song-no="30378164" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="이름에게 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30378164','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="이름에게 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30378164', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="사랑이 잘 (With 오혁) 곡 선택"
														class="input_check" name="input_check" value="30349593">
												</div></td>
											<td class="no"><div class="wrap">16</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="사랑이 잘 (With 오혁) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30349593);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="사랑이 잘 (With 오혁) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30349593');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30349593');"
															title="사랑이 잘 (With 오혁) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">사랑이
																잘 (With 오혁)</span></a> <span title="타이틀 곡" class="icon_song title">타이틀
															곡</span> <a
															href="javascript:melon.play.playSong('27030101',30349593);"
															class="fc_gray" title="사랑이 잘 (With 오혁) 재생 - 새 창">사랑이
															잘 (With 오혁)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10052968');"
															title="사랑이 잘 - 페이지 이동" class="fc_mgray">사랑이 잘</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="사랑이 잘 (With 오혁)" data-song-no="30349593"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="사랑이 잘 (With 오혁) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30349593','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="사랑이 잘 (With 오혁) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30349593', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="밤편지 곡 선택" class="input_check"
														name="input_check" value="30314784">
												</div></td>
											<td class="no"><div class="wrap">17</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="밤편지 재생 - 새 창"
															onClick="melon.play.playSong('27030101',30314784);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="밤편지 곡담기 - 새 창"
															onClick="melon.play.addPlayList('30314784');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('30314784');"
															title="밤편지 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">밤편지</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',30314784);"
															class="fc_gray" title="밤편지 재생 - 새 창">밤편지</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('10047890');"
															title="밤편지 - 페이지 이동" class="fc_mgray">밤편지</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="밤편지"
														data-song-no="30314784" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="밤편지 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '30314784','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="밤편지 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '30314784', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="새 신발 곡 선택"
														class="input_check" name="input_check" value="7896506">
												</div></td>
											<td class="no"><div class="wrap">18</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="새 신발 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896506);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="새 신발 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896506');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896506');"
															title="새 신발 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">새 신발</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896506);"
															class="fc_gray" title="새 신발 재생 - 새 창">새 신발</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="새 신발"
														data-song-no="7896506" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="새 신발 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896506','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="새 신발 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896506', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="Zeze 곡 선택"
														class="input_check" name="input_check" value="7896507">
												</div></td>
											<td class="no"><div class="wrap">19</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Zeze 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896507);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Zeze 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896507');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896507');"
															title="Zeze 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">Zeze</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896507);"
															class="fc_gray" title="Zeze 재생 - 새 창">Zeze</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="Zeze"
														data-song-no="7896507" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="Zeze 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896507','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Zeze 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896507', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="스물셋 곡 선택" class="input_check"
														name="input_check" value="7896508">
												</div></td>
											<td class="no"><div class="wrap">20</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="스물셋 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896508);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="스물셋 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896508');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896508');"
															title="스물셋 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">스물셋</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',7896508);"
															class="fc_gray" title="스물셋 재생 - 새 창">스물셋</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="스물셋"
														data-song-no="7896508" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="스물셋 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896508','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="스물셋 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896508', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="푸르던 곡 선택" class="input_check"
														name="input_check" value="7896509">
												</div></td>
											<td class="no"><div class="wrap">21</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="푸르던 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896509);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="푸르던 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896509');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896509');"
															title="푸르던 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">푸르던</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896509);"
															class="fc_gray" title="푸르던 재생 - 새 창">푸르던</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="푸르던"
														data-song-no="7896509" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="푸르던 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896509','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="푸르던 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896509', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox"
														title="Red Queen (Feat. Zion.T) 곡 선택" class="input_check"
														name="input_check" value="7896510">
												</div></td>
											<td class="no"><div class="wrap">22</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Red Queen (Feat. Zion.T) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896510);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Red Queen (Feat. Zion.T) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896510');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896510');"
															title="Red Queen (Feat. Zion.T) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">Red
																Queen (Feat. Zion.T)</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896510);"
															class="fc_gray" title="Red Queen (Feat. Zion.T) 재생 - 새 창">Red
															Queen (Feat. Zion.T)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="Red Queen (Feat. Zion.T)" data-song-no="7896510"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="Red Queen (Feat. Zion.T) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896510','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Red Queen (Feat. Zion.T) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896510', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="무릎 곡 선택" class="input_check"
														name="input_check" value="7896511">
												</div></td>
											<td class="no"><div class="wrap">23</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="무릎 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896511);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="무릎 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896511');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896511');"
															title="무릎 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">무릎</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896511);"
															class="fc_gray" title="무릎 재생 - 새 창">무릎</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="무릎"
														data-song-no="7896511" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="무릎 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896511','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="무릎 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896511', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="안경 곡 선택" class="input_check"
														name="input_check" value="7896512">
												</div></td>
											<td class="no"><div class="wrap">24</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="안경 재생 - 새 창"
															onClick="melon.play.playSong('27030101',7896512);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="안경 곡담기 - 새 창"
															onClick="melon.play.addPlayList('7896512');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('7896512');"
															title="안경 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">안경</span></a> <a
															href="javascript:melon.play.playSong('27030101',7896512);"
															class="fc_gray" title="안경 재생 - 새 창">안경</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2646282');"
															title="CHAT-SHIRE - 페이지 이동" class="fc_mgray">CHAT-SHIRE</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="안경"
														data-song-no="7896512" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="안경 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '7896512','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="안경 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '7896512', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="마음 곡 선택" class="input_check"
														name="input_check" value="5700639">
												</div></td>
											<td class="no"><div class="wrap">25</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="마음 재생 - 새 창"
															onClick="melon.play.playSong('27030101',5700639);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="마음 곡담기 - 새 창"
															onClick="melon.play.addPlayList('5700639');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('5700639');"
															title="마음 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">마음</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',5700639);"
															class="fc_gray" title="마음 재생 - 새 창">마음</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2319008');"
															title="마음 - 페이지 이동" class="fc_mgray">마음</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="마음"
														data-song-no="5700639" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="마음 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '5700639','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="마음 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '5700639', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="소격동 곡 선택" class="input_check"
														name="input_check" value="5401276">
												</div></td>
											<td class="no"><div class="wrap">26</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="소격동 재생 - 새 창"
															onClick="melon.play.playSong('27030101',5401276);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="소격동 곡담기 - 새 창"
															onClick="melon.play.addPlayList('5401276');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('5401276');"
															title="소격동 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">소격동</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',5401276);"
															class="fc_gray" title="소격동 재생 - 새 창">소격동</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2284378');"
															title="소격동 - 페이지 이동" class="fc_mgray">소격동</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="소격동"
														data-song-no="5401276" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="소격동 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '5401276','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="소격동 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '5401276', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="애타는 마음 곡 선택"
														class="input_check" name="input_check" value="4711007">
												</div></td>
											<td class="no"><div class="wrap">27</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="애타는 마음 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4711007);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="애타는 마음 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4711007');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4711007');"
															title="애타는 마음 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">애타는 마음</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',4711007);"
															class="fc_gray" title="애타는 마음 재생 - 새 창">애타는 마음</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('569214');"
															title="울랄라세션 - 페이지 이동" class="fc_mgray">울랄라세션</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('569214');"
															title="울랄라세션 - 페이지 이동" class="fc_mgray">울랄라세션</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

													<div class="wrap_atist" style="display: none;">
														<button type="button" title="아티스트 더보기 - 레이어 팝업"
															class="btn btn_more" data-control="dropdown">
															<span class="odd_span">아티스트명 더보기</span>
														</button>
														<!-- [DP] 아티스트 더보기 레이어 -->
														<div class="l_popup small"
															style="display: none; width: 168px;">
															<div class="l_cntt">
																<ul class="list_bullet">

																	<li><a
																		href="javascript:melon.link.goArtistDetail('569214');"
																		title="울랄라세션 페이지 이동">울랄라세션</a></li>

																	<li><a
																		href="javascript:melon.link.goArtistDetail('261143');"
																		title="아이유 페이지 이동">아이유</a></li>

																</ul>
															</div>
															<button type="button" class="btn_close">
																<span class="odd_span">닫기</span>
															</button>
															<span class="shadow"></span> <span
																class="bullet_vertical"></span>
														</div>
														<!-- //[DP] 아티스트 더보기 레이어 -->
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2263452');"
															title="애타는 마음 - 페이지 이동" class="fc_mgray">애타는 마음</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="애타는 마음"
														data-song-no="4711007" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="애타는 마음 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4711007','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="애타는 마음 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4711007', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="애타는 마음 (Inst.) 곡 선택"
														class="input_check" name="input_check" value="4711008">
												</div></td>
											<td class="no"><div class="wrap">28</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="애타는 마음 (Inst.) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4711008);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="애타는 마음 (Inst.) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4711008');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4711008');"
															title="애타는 마음 (Inst.) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">애타는
																마음 (Inst.)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4711008);"
															class="fc_gray" title="애타는 마음 (Inst.) 재생 - 새 창">애타는
															마음 (Inst.)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('569214');"
															title="울랄라세션 - 페이지 이동" class="fc_mgray">울랄라세션</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('569214');"
															title="울랄라세션 - 페이지 이동" class="fc_mgray">울랄라세션</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

													<div class="wrap_atist" style="display: none;">
														<button type="button" title="아티스트 더보기 - 레이어 팝업"
															class="btn btn_more" data-control="dropdown">
															<span class="odd_span">아티스트명 더보기</span>
														</button>
														<!-- [DP] 아티스트 더보기 레이어 -->
														<div class="l_popup small"
															style="display: none; width: 168px;">
															<div class="l_cntt">
																<ul class="list_bullet">

																	<li><a
																		href="javascript:melon.link.goArtistDetail('569214');"
																		title="울랄라세션 페이지 이동">울랄라세션</a></li>

																	<li><a
																		href="javascript:melon.link.goArtistDetail('261143');"
																		title="아이유 페이지 이동">아이유</a></li>

																</ul>
															</div>
															<button type="button" class="btn_close">
																<span class="odd_span">닫기</span>
															</button>
															<span class="shadow"></span> <span
																class="bullet_vertical"></span>
														</div>
														<!-- //[DP] 아티스트 더보기 레이어 -->
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2263452');"
															title="애타는 마음 - 페이지 이동" class="fc_mgray">애타는 마음</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="애타는 마음 (Inst.)" data-song-no="4711008"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="애타는 마음 (Inst.) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4711008','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="애타는 마음 (Inst.) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4711008', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="나의 옛날이야기 곡 선택"
														class="input_check" name="input_check" value="4645220">
												</div></td>
											<td class="no"><div class="wrap">29</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="나의 옛날이야기 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4645220);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="나의 옛날이야기 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4645220');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4645220');"
															title="나의 옛날이야기 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">나의 옛날이야기</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',4645220);"
															class="fc_gray" title="나의 옛날이야기 재생 - 새 창">나의 옛날이야기</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="나의 옛날이야기" data-song-no="4645220"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="나의 옛날이야기 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4645220','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="나의 옛날이야기 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4645220', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="꽃 곡 선택" class="input_check"
														name="input_check" value="4646570">
												</div></td>
											<td class="no"><div class="wrap">30</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="꽃 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646570);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="꽃 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646570');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646570');"
															title="꽃 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">꽃</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646570);"
															class="fc_gray" title="꽃 재생 - 새 창">꽃</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="꽃"
														data-song-no="4646570" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="꽃 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646570','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="꽃 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646570', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="삐에로는 우릴 보고 웃지 곡 선택"
														class="input_check" name="input_check" value="4646571">
												</div></td>
											<td class="no"><div class="wrap">31</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="삐에로는 우릴 보고 웃지 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646571);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="삐에로는 우릴 보고 웃지 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646571');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646571');"
															title="삐에로는 우릴 보고 웃지 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">삐에로는
																우릴 보고 웃지</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646571);"
															class="fc_gray" title="삐에로는 우릴 보고 웃지 재생 - 새 창">삐에로는
															우릴 보고 웃지</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="삐에로는 우릴 보고 웃지" data-song-no="4646571"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="삐에로는 우릴 보고 웃지 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646571','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="삐에로는 우릴 보고 웃지 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646571', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="사랑이 지나가면 곡 선택"
														class="input_check" name="input_check" value="4646572">
												</div></td>
											<td class="no"><div class="wrap">32</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="사랑이 지나가면 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646572);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="사랑이 지나가면 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646572');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646572');"
															title="사랑이 지나가면 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">사랑이 지나가면</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646572);"
															class="fc_gray" title="사랑이 지나가면 재생 - 새 창">사랑이 지나가면</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="사랑이 지나가면" data-song-no="4646572"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="사랑이 지나가면 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646572','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="사랑이 지나가면 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646572', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="너의 의미 (Feat. 김창완) 곡 선택"
														class="input_check" name="input_check" value="4646573">
												</div></td>
											<td class="no"><div class="wrap">33</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="너의 의미 (Feat. 김창완) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646573);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="너의 의미 (Feat. 김창완) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646573');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646573');"
															title="너의 의미 (Feat. 김창완) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">너의
																의미 (Feat. 김창완)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646573);"
															class="fc_gray" title="너의 의미 (Feat. 김창완) 재생 - 새 창">너의
															의미 (Feat. 김창완)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="너의 의미 (Feat. 김창완)" data-song-no="4646573"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="너의 의미 (Feat. 김창완) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646573','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="너의 의미 (Feat. 김창완) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646573', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="여름밤의 꿈 곡 선택"
														class="input_check" name="input_check" value="4646575">
												</div></td>
											<td class="no"><div class="wrap">34</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="여름밤의 꿈 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646575);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="여름밤의 꿈 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646575');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646575');"
															title="여름밤의 꿈 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">여름밤의 꿈</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646575);"
															class="fc_gray" title="여름밤의 꿈 재생 - 새 창">여름밤의 꿈</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="여름밤의 꿈"
														data-song-no="4646575" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="여름밤의 꿈 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646575','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="여름밤의 꿈 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646575', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="꿍따리 샤바라 (Feat. 클론) 곡 선택"
														class="input_check" name="input_check" value="4646588">
												</div></td>
											<td class="no"><div class="wrap">35</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="꿍따리 샤바라 (Feat. 클론) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4646588);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="꿍따리 샤바라 (Feat. 클론) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4646588');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4646588');"
															title="꿍따리 샤바라 (Feat. 클론) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">꿍따리
																샤바라 (Feat. 클론)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4646588);"
															class="fc_gray" title="꿍따리 샤바라 (Feat. 클론) 재생 - 새 창">꿍따리
															샤바라 (Feat. 클론)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2256290');"
															title="꽃갈피 - 페이지 이동" class="fc_mgray">꽃갈피</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="꿍따리 샤바라 (Feat. 클론)" data-song-no="4646588"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="꿍따리 샤바라 (Feat. 클론) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4646588','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="꿍따리 샤바라 (Feat. 클론) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4646588', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="봄 사랑 벚꽃 말고 곡 선택"
														class="input_check" name="input_check" value="4579468">
												</div></td>
											<td class="no"><div class="wrap">36</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="봄 사랑 벚꽃 말고 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4579468);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="봄 사랑 벚꽃 말고 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4579468');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4579468');"
															title="봄 사랑 벚꽃 말고 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">봄
																사랑 벚꽃 말고</span></a> <span title="타이틀 곡" class="icon_song title">타이틀
															곡</span> <a
															href="javascript:melon.play.playSong('27030101',4579468);"
															class="fc_gray" title="봄 사랑 벚꽃 말고 재생 - 새 창">봄 사랑 벚꽃
															말고</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('767374');"
															title="HIGH4 (하이포) - 페이지 이동" class="fc_mgray">HIGH4
															(하이포)</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('767374');"
															title="HIGH4 (하이포) - 페이지 이동" class="fc_mgray">HIGH4
																(하이포)</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

													<div class="wrap_atist" style="display: none;">
														<button type="button" title="아티스트 더보기 - 레이어 팝업"
															class="btn btn_more" data-control="dropdown">
															<span class="odd_span">아티스트명 더보기</span>
														</button>
														<!-- [DP] 아티스트 더보기 레이어 -->
														<div class="l_popup small"
															style="display: none; width: 168px;">
															<div class="l_cntt">
																<ul class="list_bullet">

																	<li><a
																		href="javascript:melon.link.goArtistDetail('767374');"
																		title="HIGH4 (하이포) 페이지 이동">HIGH4 (하이포)</a></li>

																	<li><a
																		href="javascript:melon.link.goArtistDetail('261143');"
																		title="아이유 페이지 이동">아이유</a></li>

																</ul>
															</div>
															<button type="button" class="btn_close">
																<span class="odd_span">닫기</span>
															</button>
															<span class="shadow"></span> <span
																class="bullet_vertical"></span>
														</div>
														<!-- //[DP] 아티스트 더보기 레이어 -->
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2248659');"
															title="봄 사랑 벚꽃 말고 - 페이지 이동" class="fc_mgray">봄 사랑 벚꽃
															말고</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="봄 사랑 벚꽃 말고" data-song-no="4579468"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="봄 사랑 벚꽃 말고 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4579468','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="봄 사랑 벚꽃 말고 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4579468', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="봄 사랑 벚꽃 말고 (Inst.) 곡 선택"
														class="input_check" name="input_check" value="4587059">
												</div></td>
											<td class="no"><div class="wrap">37</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="봄 사랑 벚꽃 말고 (Inst.) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4587059);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="봄 사랑 벚꽃 말고 (Inst.) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4587059');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4587059');"
															title="봄 사랑 벚꽃 말고 (Inst.) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">봄
																사랑 벚꽃 말고 (Inst.)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4587059);"
															class="fc_gray" title="봄 사랑 벚꽃 말고 (Inst.) 재생 - 새 창">봄
															사랑 벚꽃 말고 (Inst.)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('767374');"
															title="HIGH4 (하이포) - 페이지 이동" class="fc_mgray">HIGH4
															(하이포)</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('767374');"
															title="HIGH4 (하이포) - 페이지 이동" class="fc_mgray">HIGH4
																(하이포)</a>, <a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

													<div class="wrap_atist" style="display: none;">
														<button type="button" title="아티스트 더보기 - 레이어 팝업"
															class="btn btn_more" data-control="dropdown">
															<span class="odd_span">아티스트명 더보기</span>
														</button>
														<!-- [DP] 아티스트 더보기 레이어 -->
														<div class="l_popup small"
															style="display: none; width: 168px;">
															<div class="l_cntt">
																<ul class="list_bullet">

																	<li><a
																		href="javascript:melon.link.goArtistDetail('767374');"
																		title="HIGH4 (하이포) 페이지 이동">HIGH4 (하이포)</a></li>

																	<li><a
																		href="javascript:melon.link.goArtistDetail('261143');"
																		title="아이유 페이지 이동">아이유</a></li>

																</ul>
															</div>
															<button type="button" class="btn_close">
																<span class="odd_span">닫기</span>
															</button>
															<span class="shadow"></span> <span
																class="bullet_vertical"></span>
														</div>
														<!-- //[DP] 아티스트 더보기 레이어 -->
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2248659');"
															title="봄 사랑 벚꽃 말고 - 페이지 이동" class="fc_mgray">봄 사랑 벚꽃
															말고</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="봄 사랑 벚꽃 말고 (Inst.)" data-song-no="4587059"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="봄 사랑 벚꽃 말고 (Inst.) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4587059','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="봄 사랑 벚꽃 말고 (Inst.) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4587059', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox"
														title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 곡 선택"
														class="input_check" name="input_check" value="4369827">
												</div></td>
											<td class="no"><div class="wrap">38</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369827);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369827');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369827');"
															title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">금요일에
																만나요 (Feat. 장이정 Of HISTORY)</span></a> <span title="타이틀 곡"
															class="icon_song title">타이틀 곡</span> <a
															href="javascript:melon.play.playSong('27030101',4369827);"
															class="fc_gray"
															title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 재생 - 새 창">금요일에
															만나요 (Feat. 장이정 Of HISTORY)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="금요일에 만나요 (Feat. 장이정 Of HISTORY)"
														data-song-no="4369827" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" class="btn_icon mv"
														title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369827','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="금요일에 만나요 (Feat. 장이정 Of HISTORY) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369827', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="크레파스 (드라마 `예쁜 남자` 삽입곡) 곡 선택"
														class="input_check" name="input_check" value="4369828">
												</div></td>
											<td class="no"><div class="wrap">39</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="크레파스 (드라마 `예쁜 남자` 삽입곡) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369828);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="크레파스 (드라마 `예쁜 남자` 삽입곡) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369828');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369828');"
															title="크레파스 (드라마 `예쁜 남자` 삽입곡) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">크레파스
																(드라마 `예쁜 남자` 삽입곡)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369828);"
															class="fc_gray" title="크레파스 (드라마 `예쁜 남자` 삽입곡) 재생 - 새 창">크레파스
															(드라마 `예쁜 남자` 삽입곡)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="크레파스 (드라마 `예쁜 남자` 삽입곡)" data-song-no="4369828"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="크레파스 (드라마 `예쁜 남자` 삽입곡) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369828','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="크레파스 (드라마 `예쁜 남자` 삽입곡) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369828', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="을의 연애 (With 박주원) 곡 선택"
														class="input_check" name="input_check" value="4369829">
												</div></td>
											<td class="no"><div class="wrap">40</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="을의 연애 (With 박주원) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369829);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="을의 연애 (With 박주원) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369829');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369829');"
															title="을의 연애 (With 박주원) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">을의
																연애 (With 박주원)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369829);"
															class="fc_gray" title="을의 연애 (With 박주원) 재생 - 새 창">을의
															연애 (With 박주원)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="을의 연애 (With 박주원)" data-song-no="4369829"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="을의 연애 (With 박주원) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369829','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="을의 연애 (With 박주원) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369829', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox"
														title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 곡 선택"
														class="input_check" name="input_check" value="4369830">
												</div></td>
											<td class="no"><div class="wrap">41</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369830);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369830');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369830');"
															title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">누구나
																비밀은 있다 (Feat. 가인 Of Brown Eyed Girls)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369830);"
															class="fc_gray"
															title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 재생 - 새 창">누구나
															비밀은 있다 (Feat. 가인 Of Brown Eyed Girls)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls)"
														data-song-no="4369830" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369830','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="누구나 비밀은 있다 (Feat. 가인 Of Brown Eyed Girls) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369830', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="입술 사이 (50cm) 곡 선택"
														class="input_check" name="input_check" value="4369831">
												</div></td>
											<td class="no"><div class="wrap">42</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="입술 사이 (50cm) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369831);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="입술 사이 (50cm) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369831');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369831');"
															title="입술 사이 (50cm) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">입술
																사이 (50cm)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369831);"
															class="fc_gray" title="입술 사이 (50cm) 재생 - 새 창">입술 사이
															(50cm)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="입술 사이 (50cm)" data-song-no="4369831"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="입술 사이 (50cm) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369831','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="입술 사이 (50cm) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369831', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="분홍신 곡 선택" class="input_check"
														name="input_check" value="4369832">
												</div></td>
											<td class="no"><div class="wrap">43</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="분홍신 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369832);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="분홍신 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369832');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369832');"
															title="분홍신 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">분홍신</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369832);"
															class="fc_gray" title="분홍신 재생 - 새 창">분홍신</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="분홍신"
														data-song-no="4369832" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="분홍신 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369832','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="분홍신 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369832', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="Modern Times 곡 선택"
														class="input_check" name="input_check" value="4369833">
												</div></td>
											<td class="no"><div class="wrap">44</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Modern Times 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369833);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Modern Times 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369833');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369833');"
															title="Modern Times 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">Modern
																Times</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369833);"
															class="fc_gray" title="Modern Times 재생 - 새 창">Modern
															Times</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="Modern Times" data-song-no="4369833"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="Modern Times 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369833','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Modern Times 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369833', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="싫은 날 곡 선택"
														class="input_check" name="input_check" value="4369834">
												</div></td>
											<td class="no"><div class="wrap">45</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="싫은 날 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369834);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="싫은 날 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369834');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369834');"
															title="싫은 날 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">싫은 날</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369834);"
															class="fc_gray" title="싫은 날 재생 - 새 창">싫은 날</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="싫은 날"
														data-song-no="4369834" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="싫은 날 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369834','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="싫은 날 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369834', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="Obliviate 곡 선택"
														class="input_check" name="input_check" value="4369835">
												</div></td>
											<td class="no"><div class="wrap">46</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Obliviate 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369835);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Obliviate 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369835');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369835');"
															title="Obliviate 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">Obliviate</span></a>






														<a
															href="javascript:melon.play.playSong('27030101',4369835);"
															class="fc_gray" title="Obliviate 재생 - 새 창">Obliviate</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="Obliviate" data-song-no="4369835"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="Obliviate 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369835','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Obliviate 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369835', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="아이야 나랑 걷자 (Feat. 최백호) 곡 선택"
														class="input_check" name="input_check" value="4369836">
												</div></td>
											<td class="no"><div class="wrap">47</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="아이야 나랑 걷자 (Feat. 최백호) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369836);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="아이야 나랑 걷자 (Feat. 최백호) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369836');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369836');"
															title="아이야 나랑 걷자 (Feat. 최백호) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">아이야
																나랑 걷자 (Feat. 최백호)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369836);"
															class="fc_gray" title="아이야 나랑 걷자 (Feat. 최백호) 재생 - 새 창">아이야
															나랑 걷자 (Feat. 최백호)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="아이야 나랑 걷자 (Feat. 최백호)" data-song-no="4369836"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="아이야 나랑 걷자 (Feat. 최백호) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369836','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="아이야 나랑 걷자 (Feat. 최백호) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369836', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="Havana 곡 선택"
														class="input_check" name="input_check" value="4369837">
												</div></td>
											<td class="no"><div class="wrap">48</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="Havana 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369837);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="Havana 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369837');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369837');"
															title="Havana 곡정보 - 페이지 이동" class="btn btn_icon_detail"><span
															class="odd_span">Havana</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369837);"
															class="fc_gray" title="Havana 재생 - 새 창">Havana</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like" title="Havana"
														data-song-no="4369837" data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled" title="Havana 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369837','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="Havana 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369837', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox"
														title="우울시계 (Feat. 종현 Of SHINee) 곡 선택" class="input_check"
														name="input_check" value="4369838">
												</div></td>
											<td class="no"><div class="wrap">49</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="우울시계 (Feat. 종현 Of SHINee) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369838);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="우울시계 (Feat. 종현 Of SHINee) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369838');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369838');"
															title="우울시계 (Feat. 종현 Of SHINee) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">우울시계
																(Feat. 종현 Of SHINee)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369838);"
															class="fc_gray"
															title="우울시계 (Feat. 종현 Of SHINee) 재생 - 새 창">우울시계
															(Feat. 종현 Of SHINee)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="우울시계 (Feat. 종현 Of SHINee)" data-song-no="4369838"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="우울시계 (Feat. 종현 Of SHINee) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369838','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="우울시계 (Feat. 종현 Of SHINee) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369838', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>

										<tr>
											<td><div class="wrap pd_none left">
													<input type="checkbox" title="한낮의 꿈 (Feat. 양희은) 곡 선택"
														class="input_check" name="input_check" value="4369839">
												</div></td>
											<td class="no"><div class="wrap">50</div></td>
											<td class="t_left"><div class="wrap pd_none">
													<div class="ellipsis" style="max-width: 100%">
														<button type="button" class="btn_icon play"
															title="한낮의 꿈 (Feat. 양희은) 재생 - 새 창"
															onClick="melon.play.playSong('27030101',4369839);">
															<span class="odd_span">재생</span>
														</button>
														<button type="button" class="btn_icon add"
															title="한낮의 꿈 (Feat. 양희은) 곡담기 - 새 창"
															onClick="melon.play.addPlayList('4369839');">
															<span class="odd_span">담기</span>
														</button>
														<a href="javascript:melon.link.goSongDetail('4369839');"
															title="한낮의 꿈 (Feat. 양희은) 곡정보 - 페이지 이동"
															class="btn btn_icon_detail"><span class="odd_span">한낮의
																꿈 (Feat. 양희은)</span></a> <a
															href="javascript:melon.play.playSong('27030101',4369839);"
															class="fc_gray" title="한낮의 꿈 (Feat. 양희은) 재생 - 새 창">한낮의
															꿈 (Feat. 양희은)</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap wrapArtistName">
													<div id="artistName" class="ellipsis"
														style="max-width: 122px">
														<a href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a><span
															class="checkEllipsis" style="display: none"><a
															href="javascript:melon.link.goArtistDetail('261143');"
															title="아이유 - 페이지 이동" class="fc_mgray">아이유</a></span>
													</div>

												</div></td>
											<td class="t_left"><div class="wrap">
													<div class="ellipsis" style="max-width: 90%">
														<a href="javascript:melon.link.goAlbumDetail('2222587');"
															title="Modern Times - Epilogue - 페이지 이동" class="fc_mgray">Modern
															Times - Epilogue</a>
													</div>
												</div></td>
											<td class="t_left"><div class="wrap right_none">
													<button type="button" class="btn_icon like"
														title="한낮의 꿈 (Feat. 양희은)" data-song-no="4369839"
														data-song-menuId="27030101">
														<span class="odd_span">좋아요</span> <span class="cnt"><span
															class="none">총건수</span>0</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none left">
													<button type="button" disabled="disabled"
														class="btn_icon mv disabled"
														title="한낮의 꿈 (Feat. 양희은) 뮤직비디오 - 새 창"
														onClick="melon.link.goMvDetail('27030101', '4369839','song');">
														<span class="odd_span">뮤직비디오</span>
													</button>
												</div></td>
											<td><div class="wrap pd_none right">
													<button type="button" class="btn_icon dl"
														title="한낮의 꿈 (Feat. 양희은) 다운로드 - 새 창"
														onClick="melon.buy.goBuyProduct('frm', '4369839', '3C0001', '','0', '27030101');">
														<span class="odd_span">다운</span>
													</button>
												</div></td>
										</tr>


									</tbody>
								</table>
								<div class="wrap_btn_tb bottom">
									<button type="button" title="곡 목록 전체 선택"
										class="btn_base short check_all d_checkall">
										<span class="odd_span"><span class="even_span">전체선택</span></span>
									</button>
									<button type="button" title="선택된 곡 재생 - 새 창"
										class="btn_base short play d_listen"
										onClick="melon.play.playFormSong('27030101','frm');">
										<span class="odd_span"><span class="even_span">듣기</span></span>
									</button>
									<button type="button" title="선택된 곡 다운로드 - 새 창"
										class="btn_base short download d_download"
										onClick="melon.buy.goBuyProduct('frm','','3C0001','input_check','0','27030101');">
										<span class="odd_span"><span class="even_span">다운</span></span>
									</button>
									<button type="button" title="선택된 곡 담기 - 새 창"
										class="btn_base short scrap d_scrap"
										onClick="melon.play.addFormPlayList('frm');">
										<span class="odd_span"><span class="even_span">담기</span></span>
									</button>
									<button type="button" title="선택된 곡 선물하기 - 새 창"
										class="btn_base short gift d_gift"
										onClick="melon.buy.goPresent('song', 'frm', '27030101');">
										<span class="odd_span"><span class="even_span">선물</span></span>
									</button>
								</div>
							</div>
						</form>
						<!-- // 곡1 목록 -->
					</div>
				</div> <!-- 곡 리스트 -->
				
				<!-- 앨범 -->
				<div class="tab_content" id="artist_chanel_tab2">
				</div>
				<!-- 앨범 -->
				
				<!-- 비디오 -->
				<div class="tab_content" id="artist_chanel_tab3">
				</div>
				<!-- 비디오 -->
				
				<!-- 포토  -->
				<div class="tab_content" id="artist_chanel_tab4">
					<!-- 포토 리스트 -->
					<div class="section_photo d_photo_list photo_list_div">
						<!-- 최신순 / 좋아요순 -->
						<div class="sort_info clfix">
							<ul class="list_sort fl_right">
								<li class="first_child on">
									<a href="" id="NEW" class="orderClass" title="포토리스트 최신순으로 정렬">최신순</a>
								</li>
								<li class="">
									<a href="" id="LIKE" class="orderClass" title="포토리스트 좋아요순으로 정렬">좋아요순</a>
								</li>
							</ul>
						</div>
						<!-- // 최신순 / 좋아요순 -->
						
						<!-- 포토 리스트 내용 -->
						<c:if test="${photo_list != null}">
						<div id="pageList" >
							<div class="photo_wrap">
								<c:forEach items="${photo_list}" var="list_photo" varStatus="status_photo">
								<c:if test="${status_photo.first}">
								<div class="photo_list">
									<ul>
									</c:if>
										<li class="photo02_li">
											<div class="wrap_photo02">
												<div class="thumb_wrap">
													<!-- <a href="" class="thumb" title="[바닐라 어쿠스틱 - 싱글 앨범 &lsquo;지쳤니&rsquo; 발매 D-day 커버 공개] 포토상세"> -->
													<a id="ar_num" onclick="photo_content()" class="thumb"
														title="[${info.singer_name} '-' ${list_photo.ar_subject}] 포토상세"
														style="cursor: pointer;">test
														<span class="thumb_frame"></span>
														<!-- <img width="148" src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/50/558/80050558_1000.jpg/melon/resize/148/quality/80/optimize" alt="아티스트"> -->
														<img  width="148" src="./upload/starpost/singerPhoto/${list_photo.ar_photo}" title="${list_photo.ar_num}" alt="아티스트">
														<span class="wrap_vertical"></span>
													</a>
												</div>
											</div>
										</li>
											<c:if test="${status_photo.last}">
									</ul>
										</c:if>
										</c:forEach>
								</div>
							</div>
						</div>
						<!-- 포토 리스트 내용 -->
						
						<!-- 포토 페이지 -->
						<c:if test="${count != null}">
						<div id="pageObjNavgation" style="">
							<div class="paginate">
								<a class="btn_first disabled">
									<span>맨처음</span>
								</a>
								<c:if test="${start_page > page_block}">
								<a href="./ArtistChanel.ac??artist=${info.si_num}&page_num=${start_page - page_block}" class="btn_pre disabled">
									<span>이전</span>
								</a>
								</c:if>
								
								<!-- begin = 시작숫자 -->
								<!-- end = 마지막숫자 -->
								<!-- step = 증가할 수 -->		
								<c:forEach var="i" begin="${start_page}" end="${end_page}" step="1">
								<span class="page_num">
									<c:choose>
									<c:when test="${i == currentPage}">
									<strong>
										<span class="none">현재페이지</span>${i}
									</strong>
									</c:when>
									<c:otherwise>
									<a href="./ArtistChanel.ac?artist=${info.si_num}&page_num=${page_num}">${i}</a>
									</c:otherwise>
									</c:choose>
								</span>
								</c:forEach>
								
								<c:if test="${end_page > page_count}">
								<a href="" class="btn_next disabled">
									<span>다음</span>
								</a>
								</c:if>
								
								<a href="" class="btn_last">
									<span>맨끝</span>
								</a>
							</div>
						</div>
						</c:if> <!-- // 포토 페이지 -->
						</c:if> <!-- // 포토 리스트 내용 -->
						<!-- // 포토 페이지 -->
					</div> <!-- // 포토 리스트 -->
				</div>
				<!-- 포토  -->
				
				<!-- 포토 선택시 내용 보기 -->
<%-- 				<div class="tab_content" id="artist_chanel_tab4">
					<!-- 영역 -->
					<div class="section_photo">
						<!-- 사진 수량 / 전체 목록보기 -->
						<div class="sort_info clfix">
							<div class="wrap_sort fl_left">
								<p class="photo_count">
									<strong>1</strong>/
									<em id="totCnt">239</em>
								</p>
							</div>
							<div class="fl_right">
								<a href="" title="전체 목록보기" class="btn btn_big short">
									<span class="odd_span">
										<span class="even_span">전체 목록보기</span>
									</span>
								</a>
							</div>
						</div>
						<!-- 사진 수량 / 전체 목록보기 -->
						
						<!-- 포토 슬라이더 -->
						<div class="photo_list02">
							<ul>
								<li class="on">
									<div class="thumb_wrap">
										<a href="" class="thumb" title="">
											<img src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/50/258/80050258_1000.jpg/melon/resize/104/quality/80/optimize"
												alt="아티스트">
											<span class="wrap_vertical"></span>
											<span class="bor"></span>
										</a>
									</div>
								</li>
								<li class="">
									<div class="thumb_wrap">
										<a href="" class="thumb ex_height" title="[D-4] 10주년 투어콘서트 <이 지금 dlwlrma> Teaser Poster #4 이미지">
											<img src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/49/998/80049998_1000.jpg/melon/resize/104/quality/80/optimize"
												alt="아티스트">
											<span class="wrap_vertical"></span>
											<span class="bor"></span>
										</a>
									</div>
								</li>
							</ul>
							<button type="button" title="이전" class="btn_photo_pre disabled" disabled="disabled">
								<span class="odd_span">
									<span class="even_span">이전</span>
								</span>
							</button>
							<button type="button" title="다음" class="btn_photo_next"">
								<span class="odd_span">
									<span class="even_span">다음</span>
								</span>
							</button>
						</div>
						<!-- 포토 슬라이더 -->
						
						<!-- 포토 슬라이더 선택 내용 보여주기 -->
						<div class="photo_detail_view">
							<!-- 사진 내용 / 댓글 -->
							<div class="photo_detail_list_ajax d_photo_list">
								<!-- 사진 내용 -->
								<div class="photo_detail_list">
									<div class="photo_detail_image">
										<a href="" title="이미지 확대보기" class="thumb">
											<span class="wrap_vertical"></span>
											<img id="photoViewLayer"
												src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/50/258/80050258_org.jpg/melon/quality/80/optimize"
												alt="">
											<span class="icon_viewlk_image"></span>
										</a>
									</div>
									
									<!-- 좋아요 / 조회수 / 내용 / 등록일 / 리뷰수 -->
									<div class="photo_detail_info">
										<div class="photo_info_view">
											<!-- class="on" 추가시 활성 -->
											<a class="btn_like_big d_btn" title="[D-1] 10주년 투어콘서트 <이 지금 dlwlrma> Teaser Poster #5 좋아요"
												href="">
												<span class="icon">좋아요</span>
												<strong class="none">총건수</strong>2,586
											</a>
											<em class="bar">|</em>
											<span class="cnt_view">조회 
												<strong>45,003</strong>
											</span>
										</div>
										<div class="photo_info_text">
											[D-1] 10주년 투어콘서트 &lt;이 지금 dlwlrma&gt;<br>Teaser Poster #5 : 더 이상한 나라의 이지금
										</div>
										<div class="photo_info_btm">
											<p class="date">
												<span>등록일</span> 
												<strong>2018.10.27</strong>
											</p>
											<p class="review">
												<span>리뷰</span> 
												<strong>
													<a href="">29</a>개
												</strong>
											</p>
										</div>
									</div>
									<!-- 좋아요 / 조회수 / 내용 / 등록일 / 리뷰수 -->
								</div>
								<!-- 사진 내용 -->
								
								<!-- 댓글 -->
								<!-- 댓글 -->
							</div>
							<!-- 사진 내용 / 댓글 -->
						</div>
						<!-- 포토 슬라이더 선택 내용 보여주기 -->
					</div>
					<!-- 영역 -->
				</div> --%>
				<!-- 포토 선택시 내용 보기 -->
				
				<!-- 아티스트 소개 -->
				<div class="section_atistinfo01 tab_content" id="artist_chanel_tab5">
					<!-- 활동정보 / 그룹 멤버 -->
					<div class="section_atistinfo03">
						<!-- 활동 정보 -->
						<h3 class="title line arr">활동정보</h3>
						<dl class="list_define clfix">
						<%-- <%	if(debut_year!=null){%> --%>
							<c:if test="${info.debut_year != null}">
							<dt>데뷔</dt>
								<%-- <dd><%=debut_year%></dd> --%>
								<dd>${info.debut_year}</dd>
							<%-- <%} %> --%>
							</c:if>
							<dt>데뷔곡</dt>
								<dd>
									<%-- <a href="" class="ellipsis" title="<%=acibean.getDebut_song()%>"><%=acibean.getDebut_song()%></a> --%>
									<a href="" class="ellipsis" title="${info.debut_song}">${info.debut_song}</a>
								</dd>
							<dt>유형</dt>
								<%-- <dd><%=acibean.getActivity_type()%>
									<span class="bar">|</span><%=acibean.getSi_gender()%> --%>
								<dd>${info.activity_type}
									<span class="bar">|</span>${info.si_gender}
								</dd>
							<dt>장르</dt>
								<%-- <dd><%=acibean.getSi_genre()%></dd> --%>
								<dd>${info.si_genre}</dd>
							<%-- <% if(!agency.equals("")) { %> --%>
							<c:if test="${info.si_agency != ''}">
							<dt>소속사명</dt>
								<%-- <dd><%=agency%></dd> --%>
								<dd>${info.si_agency}</dd>
							<%-- <%} %> --%>
							</c:if>
							
							<c:if test="${solo_group != null}">
							<dt>소속그룹</dt>
								<dd>
									<c:forEach items="${solo_group}" var="list_solo_group" varStatus="status_solo_group">
									<c:if test="${!status_solo_group.last}">
									<a href='./ArtistChanel.ac?artist=${list_solo_group.si_num}'>${list_solo_group.singer_name}</a>, 
									</c:if>
									<c:if test="${status_solo_group.last}">
									<a href='./ArtistChanel.ac?artist=${list_solo_group.si_num}'>${list_solo_group.singer_name}</a>
									</c:if>
									</c:forEach>
								</dd>
							</c:if>
						</dl>
						<!-- 활동 정보 -->
						
						<!-- 그룹멤버-->
						<%-- <%
							if(!group_member.equals("")) {
						%> --%>
						<c:forEach items="${group_member}" var="list_group_member" varStatus="status_group_member">
						<c:if test="${list_group_member.singer_name != null}">
						<c:if test="${status_group_member.first}">
	 					<div class="wrap_gmem">
							<h3 class="title line arr">그룹멤버</h3>						
							<ul class="list_atist13 d_artist_list">
								<%-- <%
									for(int i = 0; i < group.size(); i++){
							  		ArtistChanelInfoBean acibean_group_member = (ArtistChanelInfoBean) group.get(i);
							  %> --%>
									</c:if>
								<li>
									<div class="wrap_atist13">
										<%-- <a href="./ArtistChanel.ac?artist=<%=acibean_group_member.getSi_num() %>"
											title="<%=acibean_group_member.getSinger_name() %>" class="thumb"> --%>
										<a href="./ArtistChanel.ac?artist=${list_group_member.si_num}"
											title="${list_group_member.singer_name}" class="thumb">
										<span class="thumb_frame"></span>
											<%-- <img width="96" height="96"
												src="./upload/starpost/singerProfile/<%=acibean_group_member.getSi_picture()%>"
												alt="<%=acibean_group_member.getSinger_name()%> 프로필 이미지"> --%>
											<img width="96" height="96"
												src="./upload/starpost/singerProfile/${list_group_member.si_picture}"
												alt="${list_group_member.singer_name} 프로필 이미지">
										</a>
										<div class="atist_info">
											<dl>
												<dt>
													<strong class="none">아티스트명</strong>
													<%-- <a href="./ArtistChanel.ac?artist=<%=acibean_group_member.getSi_num() %>"
														title="<%=acibean_group_member.getSinger_name() %>" class="ellipsis"><%=acibean_group_member.getSinger_name()%>
													</a> --%>
													<a href="./ArtistChanel.ac?artist=${list.si_num}"
														title="${list_group_member.singer_name}" class="ellipsis">${list_group_member.singer_name}
													</a>
												</dt>
												<%-- <dd class="gubun"><%=acibean_group_member.getSi_gender()%>/<%=acibean_group_member.getActivity_type()%></dd> --%>
												<dd class="gubun">${list_group_member.si_gender}/${list_group_member.activity_type}</dd>
												<dd class="gnr">
													<strong class="none">음악장르</strong>
													<%-- <div class="ellipsis fc_strong"><%=acibean_group_member.getSi_genre()%></div> --%>
													<div class="ellipsis fc_strong">${list_group_member.si_genre}</div>
												</dd>
											</dl>
										</div>
										<c:if test="${status_group_member.last}">
									</div>
								</li>
								<%-- <%
							  	}
							 	%> --%>
							 	</c:if>
						<%-- <%
							}
						%> --%>
						</c:if>
						</c:forEach>
							</ul>
						</div>
						<!-- // 그룹멤버 -->
					</div>
					<!-- // 활동정보 / 그룹 멤버 -->
					
					<!-- 신상정보 -->
					<%-- <%if(!real_name.equals("") || siger_birth!=null) { %> --%>
					<c:if test="${info.real_name || acibean.si_birth != null}">
					<div class="section_atistinfo04">
						<h3 class="title line arr">신상정보</h3>
						<dl class="list_define clfix">
							<%-- <%
								if(!real_name.equals("")) {
							%> --%>
							<c:if test="${info.real_name}">
							<dt>본명</dt>
								<%-- <dd><%=real_name%></dd> --%>
								<dd>${info.real_name}</dd>
							<%-- <%} %> --%>
							</c:if>
							
							<%-- <% if(siger_birth!=null){%> --%>
							<c:if test="${info.si_birth != null}">
							<dt>생일</dt>
								<%-- <dd><%=siger_birth%></dd> --%>
								<dd>${info.si_birth}</dd>
							<%-- <%} %> --%>
							</c:if>
						</dl>
					</div>
					<%-- <%} %> --%>
					</c:if>
					<!-- //신상정보 -->
				</div>
				<!-- // 아티스트 소개 -->
			</div>
		</div>
		<!-- // 내용 -->
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>