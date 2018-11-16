<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String email_id = (String) session.getAttribute("email_id");
	MemberDAO mdao = new MemberDAO();
	int level = mdao.getLevel(email_id);
%>

<div id="wrap">
	<div id="header" class="main">
		<div id="header_wrap" class="pr_none">
			<!-- 메인 컨텐츠 가운데 정렬을 위한 pr_none 클래스 추가 -->

			<div id="gnb" class="clfix">
				<!-- 로고 -->
				<h1>
					<a href="./main.mi" title="레몬 Lemon 로고 - 홈으로 이동" class="mlog">
						<img src="./assets/img/menu/menu_logo.png" alt="레몬 Lemon 로고 이미지">
					</a>
				</h1>
				<!-- 로고 -->

				<!-- 통합검색 영역 -->
				<form id="searchFrm" method="get" action="./UniSearch.sc" >
				<fieldset>
					<legend>통합검색영역</legend>
					<input type="text" title="검색 입력 편집창" name="search"
						id="top_search" style="width: 249px">
					<input type="hidden" name="keywordLink" id="keywordLink" value="">
					<input type="hidden" name="sort" id="sort" value="최신순">
					<button type="submit" class="btn_icon search_m" title="검색" >
						<span class="odd_span">검색</span>
					</button>						
				</fieldset>				
				</form>
				
				<!-- //통합검색 영역 -->
				<c:set var="realtime" value="${sessionScope.realtime}"/>
				<!-- 실시간 검색어 -->
				<div class="realtime_soar_keyword">
					<a class="title"
						style="display: inline-block;">급상승 키워드</a>
					<div class="keyword_overlay">
						<ol style="overflow: hidden; height: 20px;">
							<!-- 롤링 영역 -->
								<c:forEach var="psearch" items="${realtime}" varStatus="status">
									<li class="testx" style="top: 0px; display: none;">
								<strong class="order bg${status.index+1} on">${status.index+1} 
									<span class="gubun">.</span>
									<span class="none"> 위</span>
								</strong>
								<a href="/Lemon/UniSearch.sc?search=${psearch.sc_keyword}&sort=최신순" class="ellipsis"
									title="${psearch.sc_keyword} - 페이지 이동">${psearch.sc_keyword}</a>
									<c:if test="${psearch.sc_rank==9999999}">
						<span class="wrap_rank new">
									<span class="icon">새진입</span>
								</span>
										</c:if>
									<c:if test="${psearch.sc_rank>0}">
									<span class="wrap_rank up">
									<span class="icon">순위상승수</span>
									<span class="num">${psearch.sc_rank}</span>
								</span>
										</c:if>
									<c:if test="${0 eq psearch.sc_rank}">
						<span class="wrap_rank static">
									<span class="icon">순위 동일</span>
								</span>
										</c:if>
									<c:if test="${psearch.sc_rank<0}">
								<span class="wrap_rank down">
									<span class="icon">순위하락수</span>
									<span class="num">${psearch.sc_rank}</span>
								</span>
										</c:if>
					
							</li>
								</c:forEach>	
							
							<!-- //롤링 영역 -->
						</ol>
						<script type="text/javascript">
						$('.realtime_soar_keyword').mouseover(function(){
							$('.realtime_soar_keyword').addClass('d_hover');
							$('.keyword_overlay').addClass('active');
						});
						$('.keyword_overlay').mouseleave(function(){
							$('.realtime_soar_keyword').removeClass('d_hover');
							$('.keyword_overlay').removeClass('active');
							
						});
						
						for (var i = 0;i<9999 ; i++) {
							  (function (i) {
							    setTimeout(function () {
							      var j=i%10;
							      if(j==0){
							    	  $('.testx').eq(9).css('display','none');
									$('.testx').eq(0).css('display','list-item');
							      }else if(j==1){
									$('.testx').eq(0).css('display','none');
									$('.testx').eq(1).css('display','list-item');
							      }else if(j==2){
							    	  $('.testx').eq(1).css('display','none');
										$('.testx').eq(2).css('display','list-item');
							      }else if(j==3){
							    	  $('.testx').eq(2).css('display','none');
										$('.testx').eq(3).css('display','list-item');
							      }else if(j==4){
							    	  $('.testx').eq(3).css('display','none');
										$('.testx').eq(4).css('display','list-item');
							      }else if(j==5){
							    	  $('.testx').eq(4).css('display','none');
										$('.testx').eq(5).css('display','list-item');
							      }else if(j==6){
							    	  $('.testx').eq(5).css('display','none');
										$('.testx').eq(6).css('display','list-item');
							      }else if(j==7){
							    	  $('.testx').eq(6).css('display','none');
										$('.testx').eq(7).css('display','list-item');
							      }else if(j==8){
							    	  $('.testx').eq(7).css('display','none');
										$('.testx').eq(8).css('display','list-item');
							      }else if(j==9){
							    	  $('.testx').eq(8).css('display','none');
										$('.testx').eq(9).css('display','list-item');
							      }
							    }, 3000*i);
							  })(i);
							};
						</script>
					</div>
				</div>
			</div>
			<!-- //실시간 검색어 -->

			<!-- 배너 영역 -->
			<div class="cmn_banner">
				<div class="banner_bxslider">
					<a title="ITWILL 7강의실 1조" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="./assets/img/common/b3.png"
							alt="">
					</a>
					<a title="김성일 김수정 우다솜" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="./assets/img/common/b1.png"
							alt="">
					</a>
					<a title="김시현 부지연 최우성" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="./assets/img/common/b2.png"
							alt="">
					</a>
				</div>
				<div class="gnb_banner_btn">
					<a class="btn prev d_btn_ctrl" title="이전 이벤트 보기">이전 이벤트 보기</a>
					<a class="btn next d_btn_ctrl" title="다음 이벤트 보기">다음 이벤트 보기</a>
				</div>
			</div>
			<!-- 배너 영역 -->

			<!-- 메뉴 -->
			<div id="menu">
				<ul>
					<li class="menu1">
						<a  onclick="LemonPlayerList();" class="cur_menu mlog">
							<span class="menu_bg menu01">플레이리스트</span>
						</a>
					</li>
				
					<li class="menu1">
						<a href="./LemonLatest_Chart.ct" class="cur_menu mlog">
							<span class="menu_bg menu01">레몬차트</span>
						</a>
					</li>
					<li class="menu5">
						<a href="./AdminArtistChanelInfo.ac" class="cur_menu mlog">
							<span class="menu_more menu05">스타포스트</span>
						</a>
					</li>
					<li class="menu6">
						<a href="./magazineList.maga" class="cur_menu mlog">
							<span class="menu_more menu06">매거진</span>
						</a>
					</li>
					<li class="menu7">
						<a href="./noticeInit.nt" class="cur_menu mlog">
							<span class="menu_more menu04">공지사항</span>
						</a>
					</li>
					
					<% if(email_id == null) { %> 
					<li class="menu8">
						<a class="cur_menu mlog">
							<span class="menu_bg menu07">마이레몬</span>
						</a>
					</li>
					<%} else { %>
					<li class="menu8">
						<a href="./ChooseMemberUpdate.mb" class="cur_menu mlog">
							<span class="menu_bg menu07">마이레몬</span>
						</a>
					</li>
					<% } 
					
						if(email_id != null) {
							if(email_id.equals("admin")) { %> 
					<li class="menu9">
						<a href="./MusicUpload.ams" class="cur_menu mlog">
							<span class="menu_bg menu08">업로드</span>
						</a>
					</li>
					<%	}
					} %>
					
				</ul>
			</div>
			<!-- 메뉴 -->
		</div>
	</div>
	<script type="text/javascript">
		function LemonPlayerList(){
			window.open("./LemonPlayerList.mp","a","width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
		}
	</script>
<div style="clear: both;"></div> 