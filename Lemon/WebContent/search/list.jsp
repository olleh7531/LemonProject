<%@page import="com.lemon.search.db.SearchBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lemon.search.db.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		List resultList = (List) request.getAttribute("resultList");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer)request.getAttribute("count")).intValue();
		int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
		

		System.out.println(endPage);
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div id="contsSc">
			
			<ul>
				<li><a href="#">정확도순</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="#">가나다순</a></li>
			</ul>
			
			<h1><b>총 <%=count %> 건</b></h1>
			
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
					  <a href="./search.sc?search=<%=search%>&pageNum=<%=startPage-pageBlock%>"> [이전]</a>
					<%
				}
				// 1~10,11~20,21~30,....
				for(int i = startPage;i<=endPage;i++){
					%>
					  <a href="./search.sc?search=<%=search%>&pageNum=<%=i%>">[<%=i %>]</a>
					<%
				}
				// 다음
				if(endPage < pageCount){
					%>
					    <a href="./search.sc?search=<%=search%>&pageNum=<%=startPage+pageBlock%>">[다음]</a> 
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
		});
		$('#li_date').click(function(){
			$('#sort').val("최신순");
		});
		$('#li_ganada').click(function(){
			$('#sort').val("가나다순");
		});
	}); 
	
	$.ajax({
		type : "POST", // method="POST" 방식으로 출력 
		url : "./search.sc", // id 체크하는 jsp 파일 주소 불러오기 
		data : {
			search : $('#top_search').val(),			
			sort : $('#sort').val(),
		},
		success : function(data) { // data를 가져오는 것이 성공하였을 때
		    alert(email+"주소로 인증메일을 발송하였습니다.");
			if(data == "fail"){
				alert("메일 발송이 실패하였습니다.")
			}else{
			alert("이메일 발송 성공");
			data = data.trim();
			document.getElementById("code").value=data;
				
			}
		},
		error : function(xhr, status, error) { // 에러났을 때
			alert("error : " + error);
		}
	});
	</script>
	</body>
</html>