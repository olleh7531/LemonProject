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


<!-- Search CSS -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/search/common.css">


<style>
.wrap_list {
	display: inline-block;
	width: 100%;
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px;
}

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
</style>


</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<%
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");

		List song_list = (List) request.getAttribute("song_list");
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
					<div>
						<a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a>
					</div>
					<div>
						<a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a>
					</div>
					<div class="current">
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

				<div style="float: right;">
					<ul
						 id="tabSc" style="font-size: 12px; color: gray; margin-top: 10px; margin-bottom: 10px">
						<li class="tcurrent" style="display: inline;"><a id="btnArtist">아티스트명에서 |</a></li>
						<li style="display: inline;"><a id="btnMusicName">곡명에서 |</a></li>
						<li style="display: inline;"><a id="btnAlbumName">앨범명에서</a></li>
						<input type="hidden" id="categoryType">
					</ul>
				</div>

				<!-- 검색 결과 -->
				<div id="contsSc">
					<h3 class="titleSc">곡</h3>

					<div class="wrap_list">
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

								<tbody id="songList">
									<%
										for (int i = 0; i < song_list.size(); i++) {
											SearchBean sb = (SearchBean) song_list.get(i);
									%>
									<tr class="songs">
										<td><div>
												<input type="checkbox">
											</div></td>
										<td><div><%=(i + 1)%></div></td>
										<td><div><%=sb.getMusic_name()%></div></td>
										<td><div><%=sb.getSinger_name()%></div></td>
										<td><div><%=sb.getAl_name()%></div></td>
										<td><div>
												<span class="odd_span"><i class="fa fa-heart-o"></i>
													<span class="cnt">0</span></span>
											</div></td>
										<td><div
												onclick="LemonPlayer(<%=sb.getMu_num()%>,<%=sb.getAlbum_num()%>)">
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
				</div>
				<!-- 검색 결과 -->




			</div>
			<!-- 차트 -->
			<div id="contsCh">
				<jsp:include page="../board/searchChart.jsp"></jsp:include>
			</div>
			<!-- 차트 -->


			<div style="display: none; clear: both;"></div>


		</div>
	</div>



	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>




	<script>
	$(document).ready(function(){
		$('#top_search').val("${search}");
		$('#btnArtist').click(function(){
			$('#categoryType').val("artist");
			changeCategory();
		});
		$('#btnMusicName').click(function(){
			$('#categoryType').val("musicname");
			changeCategory();
		});
		$('#btnAlbumName').click(function(){
			$('#categoryType').val("albumname");
			changeCategory();
		});		
	}); 
	
	
	function changeCategory(){		
		$.ajax({
			type : "POST", // method="POST" 방식으로 출력 
			url : "./SongSearch.sc", // id 체크하는 jsp파일 주소 불러오기 
			dataType: 'json',
			data : {
				search : $('#top_search').val(),			
	 			stateCategory : $('#categoryType').val(),
			},
			success : function(data) { // data를 가져오는 것이 성공하였을 때
				$('#songList').empty();
			
 				$(data).each(function(index){ 					
 					var text="";
 					
 					text+='<tr class="songs"><td><div><input type="checkbox"></div></td>';
 					text+='<td><div>'+(index+1)+'</div></td>';
 					text+='<td><div>'+this.music_name+'</div></td>';
 					text+='<td><div>'+this.singer_name+'</div></td>';
 					text+='<td><div>'+this.al_name+'</div></td>';
 					text+='<td><div><span class="odd_span"><i class="fa fa-heart-o"></i>';
 					text+='<span class="cnt">0</span></span></div></td>';
 					text+='<td><div><i class="fa fa-play"></i><span class="none">듣기</span></div></td>';
 					text+='<td><div><i class="fa  fa-download "></i><span class="none">다운로드</span></div></td>';					
 					text+='<td><div><i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span></div></td></tr>';					
 										
 					$('#songList').append(text);
 				});
			},
			error : function(xhr, status, error) { // 에러났을 때
				alert("error : " + error);
			}
		});
	}
	

	</script>
	<script type="text/javascript">
	// 검색어 초기화
	$(document).ready(function(){
		$('#top_search').val("${search}");s
	});


	
	function LemonPlayer(mu_num,album_num){
		window.open("./LemonPlayer.mp?musicNum="+mu_num+"&album="+album_num+"","a","width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
	}
	</script>

	<!-- 메뉴 Script -->
	<script type="text/javascript" src="./assets/js/search/menuSc.js"></script>

</body>
</html>