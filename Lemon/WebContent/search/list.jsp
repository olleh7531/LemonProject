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
	
	<style type="text/css">
	/*탭 메뉴 관련*/
	/* 탭 영역 */
	.tab {		
		position: relative;
		width: 1008px;
		margin-top: 15px;
		border-top: 2px solid #838383;
		border-bottom: 1px solid #dbdbdb;
		background: #eaefeb;
	}
	
	/* 탭 메뉴 */
	/* Float the list items side by side */
	.tab li {
		float: left;
		width: 110px;
		border-right: 1px solid #dbdbdb;
		border-left: 1px solid #ffffff;
		height: 34px;
	}
	/* Style the links inside the list items */
	.tab li a {		
		display: block;
		position: relative;
		padding: 10px 0 7px 0px;
		color: #1b1b1b;
		text-align: center;
	}
	
	.tab li.current a{		
		z-index: 3;
		border-bottom: 1px solid #fff;
		background-color: #fff;
		font-weight: bold;
		height: 17px;
		color: #EDAE06;
	}

	.tabcontent.current {
		display: block;
	}
	
	.tabcontent {
		display: none;
		color: #333333;
		padding: 6px 12px;
	}
	
	.tab:after {
		content: "";
		display: block;
		clear: both;
		height: 0;
 		visibility: hidden;
	}
	/*탭 메뉴 관련*/
	
	
	
	h3.title{
		margin-bottom: 12px;
	    color: #1a1a1a;
	    font-weight: bold;
 	    font-size: 18px; 
	    line-height: 24px;
	    font-family: "맑은 고딕", "Malgun Gothic", "Apple Gothic", sans-serif;
	}
	
	h3.title span.cnt{
		color: #666;
	}
	
	.wrap_cntt{
		border-top: 1px solid #ccc;
	} 
	
	</style>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div><p>에 대한 검색 결과입니다.</p></div>
			<div id="contsSc">
			
			<ul class="tab">
				<li data-tab="section_unisearch" class="current"><a href="#">통합검색</a></li>
				<li data-tab="section_artist"><a href="#">아티스트</a></li>
				<li data-tab="section_song"><a href="#">곡</a></li>
				<li data-tab="section_album"><a href="#">앨범</a></li>
				<li data-tab="section_vdo"><a href="#">영상</a></li>
				<li data-tab="section_lyric"><a href="#">가사</a></li>
				<li data-tab="section_dj"><a href="#">DJ플레이리스트</a></li>
				<li data-tab="section_musicstory"><a href="#">멜론매거진</a></li>
				<li data-tab="section_customer"><a href="#">고객지원</a></li>
			</ul>
	
			<div id="section_unisearch" class="tabcontent current">
				<h3 class="title">
					통합검색
					<span class="cnt">(482)</span>
				</h3>
				
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
	
			<div id="section_artist" class="tabcontent">
				<h3 class="title">
					아티스트
					<span class="cnt">(482)</span>
				</h3>
				<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
			</div>
	
			<div id="section_song" class="tabcontent">
				<h3 class="title">
					곡
					<span class="cnt">(482)</span>
				</h3>
				<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
			</div>
	
			<div id="section_album" class="tabcontent">
				<h3 class="title">
					앨범
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			
			<div id="section_vdo" class="tabcontent">
				<h3 class="title">
					영상
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
	
			<div id="section_lyric" class="tabcontent">
				<h3 class="title">
					가사
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			
			<div id="section_dj" class="tabcontent">
				<h3 class="title">
					DJ플레이리스트
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			
			<div id="section_musicstory" class="tabcontent">
				<h3 class="title">
					멜론매거진
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			
			<div id="section_customer" class="tabcontent">
				<h3 class="title">
					고객지원
					<span class="cnt">(482)</span>
				</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
				
			
<!-- 			<div class="section_artist"> -->
<!-- 				<h3 class="title">아티스트 -->
<!-- 					<span class="cnt">(482)</span> -->
<!-- 				</h3> -->
<!-- 				<div class="wrap_cntt">aaaaa</div> -->
<!-- 				<div class="btn_link"> -->
<!-- 					<a href="#"> -->
<!-- 						<span></span> -->
<!-- 						<span></span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->

				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			$('.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				
				$('.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
				
				
				// 색상 변경
				/* $('.tab li').removeClass("current"); */
				/* $(this).addClass("current"); */
			})
		});
	</script>
	
	</body>
</html>