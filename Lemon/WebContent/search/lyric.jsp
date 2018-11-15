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
	
	
	<style>
	.wrap_list{
		display: inline-block;
		width: 100%;
		margin-bottom: 20px;
	}
	</style>
		

</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		List lyric_list = (List) request.getAttribute("lyric_list");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer)request.getAttribute("count")).intValue();
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(pageBlock);
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_con">			
			<div id="wrap_contsSc">	
				<c:set var="search" value="${requestScope.search}"/>
				<div style="text-align: left; padding-top: 29px; padding-bottom: 8px;">
					<strong>'${search}'</strong>에 대한 검색 결과입니다.
				</div>
				<input type="hidden" id="pageNum" value="1">			
	
				<!-- 메뉴 -->	
				<div id="menuSc">
					<div><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></div>
					<div><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></div>
					<div><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></div>
					<div><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></div>
					<div class="current"><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></div>
					<div style="display:none; clear: both;"></div>
				</div>
				
				
			
				<!-- 검색 결과 -->		
				<div id="contsSc">	
				<%if(count!=0){ %>
					<div style="float: right;">
					<ul id="tabSc" style="font-size: 12px; color:gray; margin-top:10px; margin-bottom:10px">
						<li class="tcurrent" style="display: inline;"><a id="li_weight">정확도순 |</a></li>
						<li style="display: inline;"><a id="li_date">최신순 |</a></li>
						<li style="display: inline;"><a id="li_ganada">가나다순</a></li>
					</ul>
					</div>
					<div style="display: none; clear: both;"></div>
					<h3 class="titleSc">가사<span style="color: gray;">(<%=count %>)</span></h3>
					
					
					<div class="wrap_list">
					
					<%
					 for(int i=0;i<lyric_list.size();i++){
						SearchBean sb =(SearchBean) lyric_list.get(i);				 
					%>
					
					<div><b><%=sb.getMusic_name() %></b></div>
					<div style="    display: block;
		    						margin-bottom: 4px;
		   							white-space: nowrap;
		    						text-overflow: ellipsis;
		   							overflow: hidden;"><%=sb.getLyrics() %></div>
					<div><%=sb.getSinger_name() %> | <%=sb.getAl_name() %></div>
					<hr>
					
					<%
						}
							if( count != 0 ){
					%>
						<div style="text-align: center;">
					<%
				// 이전
				if(startPage>pageBlock){
					%>
					  <a id="prev" class="<%=startPage-pageBlock %>"> [이전]</a>
					<%
				}
				// 1~10,11~20,21~30,....
				for(int i = startPage;i<=endPage;i++){
					%>
					  <a class="xxx">[<%=i %>]</a>
					<%
				}
				// 다음
				if(endPage < pageCount){
					%>
					    <a id="next" class="<%=startPage+pageBlock %>">[다음]</a> 
					<%	
				}
				 %>
				</div>
				<%
			}
							%>
					</div>
				
				<%}else{ %>
				<h3 class="titleSc">가사</h3>
				<div style="margin-top: 100px; margin-bottom: 100px;">
					<div style="text-align: center;"><strong>'${search}'</strong>(으)로 검색한 결과가 없습니다.	</div>
					<ul style="text-align: center; margin-top: 26px;">
						<li>검색어의 철자와 띄어쓰기가 정확한지 확인해 주세요.</li>
						<li>검색어의 단어수를 줄이거나, 보다 일반적인 단어 등 다른 검색어를 입력해 보세요.</li>
					</ul>
				</div>
				<div style="border-top: 1px solid #ccc;"></div>
				<%} %>
				
			
				</div>
				<!-- 검색 결과 -->
			</div>
			
			
			
			<!-- 차트 -->
	 		<div id="contsCh">			
				<jsp:include page="../board/searchChart.jsp"></jsp:include>	
			</div>
			<!-- 차트 -->
			
			<div style="display:none; clear: both;"></div>	
		</div>
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#top_search').val("${search}");
		$('#li_weight').click(function(){
			$('#sort').val("정확도순");	
			$('#pageNum').val(1);
			ajax();
		});
		$('#li_date').click(function(){
			$('#sort').val("최신순");
			$('#pageNum').val(1);
			ajax();
		});
		$('#li_ganada').click(function(){
			$('#sort').val("가나다순");
			$('#pageNum').val(1);
			ajax();
		});
		$('#prev').click(function(){
 			$('#pageNum').val($(this).attr('class'));
 			ajax();
		});
		$('#next').click(function(){
 			$('#pageNum').val($(this).attr('class'));
 			ajax();
		});
		$('.xxx').click(function(){
			$('#pageNum').val($(this).text().replace("[","").replace("]",""));
			ajax();
		});
		
	}); 
	
	function ajax(){
		
	$.ajax({
		type : "POST", // method="POST" 방식으로 출력 
		url : "./LyricSearch.sc", // id 체크하는 jsp 파일 주소 불러오기 
		dataType: 'json',
		data : {
			search : $('#top_search').val(),			
			sort : $('#sort').val(),
			test : "test",
 			pageNum : $('#pageNum').val(),
		},
		success : function(data) { // data를 가져오는 것이 성공하였을 때

		$('.wrap_list').empty();
			$(data).each(function(index){
					
			var text="";
				if(data.length-1!=index){
					text+='<div><b>'+this.music_name+'</b></div>';
					text+='<div style="    display: block;';
					text+='	margin-bottom: 4px;';
					text+='	white-space: nowrap;';
					text+='	text-overflow: ellipsis;';
					text+='	overflow: hidden;">'+this.lyrics+'</div>';
					text+='<div>'+this.singer_name+' | '+this.al_name+'</div>';
					text+='<hr>';
					$('.wrap_list').append(text);
				}else{
					text+='<div style="text-align: center;">';
					if(this.startPage>this.pageBlock){
						  text+='<a id="prev" class="'+(this.startPage-this.pageBlock)+'">[이전]</a>'
					}
					// 1~10,11~20,21~30,....
					for(var i = this.startPage;i<=this.endPage;i++){
						  text+='<a class="xxx">['+i+']</a>';
					}
					// 다음
					if(this.endPage < this.pageCount){
						    text+='<a id="next" class="'+(this.startPage+this.pageBlock)+'">[다음]</a>' 
					}
					text+='</div>';
					$('.wrap_list').append(text);
				}					
					
					$('#prev').click(function(){
						$('#pageNum').val($(this).attr('class'));
						ajax();
					});
					$('#next').click(function(){
						 $('#pageNum').val($(this).attr('class'));
						 ajax();
					});
					$('.xxx').click(function(){
						 $('#pageNum').val($(this).text().replace("[","").replace("]",""));
						 ajax();
					});
				});
						
		},
		error : function(xhr, status, error) { // 에러났을 때
			alert("error : " + error);
		}
	});
	}
	</script>
	
	<!-- 메뉴 Script -->
	<script type="text/javascript" src="./assets/js/search/menuSc.js"></script>
	
	</body>
</html>

