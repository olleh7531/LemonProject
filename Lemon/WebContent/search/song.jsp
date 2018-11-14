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
	<c:set var="search" value="${requestScope.search}"/>
	
	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		List song_list = (List) request.getAttribute("song_list");
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div>
				<ul>
					<li><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></li>
					<li><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></li>
					<li><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></li>
					<li><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></li>
					<li><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></li>
				</ul>
			</div>
			
			<ul>
				<li><a id="btnArtist">아티스트명에서</a></li>
				<li><a id="btnMusicName">곡명에서</a></li>
				<li><a id="btnAlbumName">앨범명에서</a></li>
				<input type="hidden" id="categoryType">
			</ul>
			
			<ul>
				<li><a id="li_date">최신순</a></li>
				<li><a id="li_ganada">가나다순</a></li>
			</ul>
		
			<div id="contsSc">
	
			<div>
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
					<tbody id="songList">
					<%
						for (int i = 0; i < song_list.size(); i++) {
							SearchBean sb = (SearchBean) song_list.get(i);	
					%>
						<tr>
							<td><div><input type="checkbox"></div></td>
							<td><div><%=(i+1) %></div></td>
							<td><div><%=sb.getMusic_name() %></div></td>
							<td><div><%=sb.getSinger_name() %></div></td>
							<td><div><%=sb.getAl_name() %></div></td>
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
			
			</div>
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
		$('#li_date').click(function(){
			$('#sort').val("최신순");
			ajax();
		});
		$('#li_ganada').click(function(){
			$('#sort').val("가나다순");
			ajax();
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
 					
 					text+='<tr><td><div><input type="checkbox"></div></td>';
 					text+='<td><div>1</div></td>';
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
	
	</body>
</html>