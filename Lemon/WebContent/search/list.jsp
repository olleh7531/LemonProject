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
		List resultList = (List) request.getAttribute("resultList");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer)request.getAttribute("count")).intValue();
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(pageBlock);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
		<div><strong>'${search}'</strong>에 대한 검색 결과입니다.</div>
			<input type="hidden" id="pageNum" value="1">
			<%if(count!=0){ %>
			<ul>
				<li><a id="li_weight">정확도순</a></li>
				<li><a id="li_date">최신순</a></li>
				<li><a id="li_ganada">가나다순</a></li>
			</ul>
			<h1><b>총 <%=count %> 건</b></h1>
						<%}else{ %>
						<div style="text-align: center;"><strong>'${search}'</strong>(으)로 검색한 결과가 없습니다.	</div>
						<ul style="list-style: disc;    margin: 26px 0 0 276px;">
						<li style="list-style: disc;">검색어의 철자와 띄어쓰기가 정확한지 확인해 주세요.</li>
						<li style="list-style: disc;">검색어의 단어수를 줄이거나, 보다 일반적인 단어 등 다른 검색어를 입력해 보세요.</li>
						</ul>
						<%} %>
			<div id="contsSc">

			<%
			 for(int i=0;i<resultList.size();i++){
				SearchBean sb =(SearchBean) resultList.get(i);				 
			%>
			
			<div><b><%=sb.getMusic_name() %></b></div>
			<div style="    display: block;
    						margin-bottom: 4px;
   							white-space: nowrap;
    						text-overflow: ellipsis;
   							overflow: hidden;"><%=sb.getLyrics() %></div>
			<div><%-- ${list.singer_name} --%> | <%=sb.getAl_name() %></div>
			<hr>
			<%	 
			 }
			%>
				
			<%
			// 페이지 출력
			if( count != 0 ){
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
			}			
			%>
			
			
			</div>
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
		url : "./search.sc", // id 체크하는 jsp 파일 주소 불러오기 
		dataType: 'json',
		data : {
			search : $('#top_search').val(),			
			sort : $('#sort').val(),
			test : "test",
 			pageNum : $('#pageNum').val(),
		},
		success : function(data) { // data를 가져오는 것이 성공하였을 때

		$('#contsSc').empty();
			$(data).each(function(index){
					
			var text="";
				if(data.length-1!=index){
					text+='<div><b>'+this.music_name+'</b></div>';
					text+='<div style="    display: block;';
					text+='	margin-bottom: 4px;';
					text+='	white-space: nowrap;';
					text+='	text-overflow: ellipsis;';
					text+='	overflow: hidden;">'+this.lyrics+'</div>';
					text+='<div>| '+this.al_name+'</div>';
					text+='<hr>';
					$('#contsSc').append(text);
				}else{
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
					$('#contsSc').append(text);
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
	</body>
</html>