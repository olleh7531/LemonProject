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
		
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div id="contsSc">
				<div>
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
						<%
							for (int i = 0; i < song_ar_list.size(); i++) {
								SearchBean sb = (SearchBean) song_ar_list.get(i);
						%>
							<tr>
								<td>
									<div class="wrap t_right">
										<input type="checkbox" title="" class="input_check "
												name="input_check" id="input_check">
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
<%-- 												<span> <a href="#" title="<%=cb.getMusic_name()%>"><%=cb.getMusic_name()%></a> --%>
												</span>
											</div>
											<br>
											<div class="ellipsis rank02">
<%-- 												<a href="#" title="<%=cb.getMusicfile().split("-")[0]%>"><%=cb.getMusicfile().split("-")[0]%></a> --%>
											</div>
										</div>
									</div>
								</td>
								<td>
									<div class="wrap">
										<div class="wrap_song_info">
											<div class="ellipsis rank03">
<!-- 												<a -->
<%-- 													href="./LemonDetai.ct?mu_num=<%=cb.getAl_num()%>&pageNum=<%=pageNum%>" --%>
<%-- 													title="<%=cb.getAl_name()%>"><%=cb.getAl_name()%></a> --%>
											</div>
										</div>
									</div>
								</td>
								<td>
								<div class="wrap" style="text-align: center">
									<button type="button" class="button_etc like" title="" data-song-no="" data-song-menuid="">
										<span class="odd_span"><i class="fa fa-heart-o"></i>
										<span class="cnt">0</span></span>
									</button>
								</div>
								</td>
								<td>
									<div class="wrap t_center">
										<button type="button" title="담기" class="button_icons scrap">
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
										<button type="button" title="다운로드" class="button_icons download ">
												<i class="fa  fa-download "></i><span class="none">다운로드</span>
										</button>
									</div>
								</td>
								<td>
									<div class="wrap t_center">
										<button type="button" title="뮤직비디오" class="button_icons video ">
												<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
										</button>
									</div>
								</td>
							</tr>
	
									<%
// 										}

									%>	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>