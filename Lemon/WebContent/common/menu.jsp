<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- 				<form style="display: none" id="searchFrm" method="get" action=""> -->
<!-- 					<input type="hidden" name="q"> <input type="hidden" name="section"> -->
<!-- 				</form> -->
								
				
<!-- 				<fieldset>
					<legend>통합검색영역</legend>
					<input type="text" title="검색 입력 편집창" placeholder="" name=""
						id="top_search" style="width: 249px">
					<input type="hidden" name="keywordLink" id="keywordLink" value="">
					<button type="button" style="display: none;"
						id="top_search_autocomplete_toggle"
						class="btn_icon btn_auto close" title="자동검색 펼침">
						<span class="odd_span">자동검색 펼침</span>
					</button>
					open/close 클래스 사용
					<button type="button" class="btn_icon search_m" title="검색" onclick="location='./search.sc'">
						<span class="odd_span">검색</span>
					</button>
					<div class="auto_complete" id="top_search_autocomplete">
						<div class="auto_complete_cont" style="display: block;">
							자동완성 레이어
						</div>
					</div>
					<div class="auto_complete" id="top_search_autocomplete_template"
						style="display: none;">
						자동완성 레이어 템플릿
						텍스트 결과
						<ul class="text_result">
							<li>
								<a href="#" class="autocomplete-label"></a>
							</li>
						</ul>
						섬네일 결과
						<ul class="thumb_result">
							<li class="cate"></li>
							<li class="class02">
								<a href="#">
									<span class="thumb_40">
										<span class="thumb_frame"></span>
										<img class="autocomplete-img" width="40" height="40" alt="">
									</span>
									<span class="info">
										<span class="autocomplete-label"></span><br>
										<span>
											<span class="f11 autocomplete-info"></span>
										</span>
									</span>
								</a>
							</li>
						</ul>
						검색어가 없을 때
						<ul class="text_result">
							<li class="result_none">
								<span>해당글자로 시작하는 단어가 없습니다.</span>
							</li>
						</ul>
					</div>
				</fieldset>
				<form style="display: none" id="searchFrm" method="get" action="">
					<input type="hidden" name="q"> <input type="hidden" name="section">
				</form> -->
				<!-- //통합검색 영역 -->
<c:set var="realtime" value="${sessionScope.realtime}"/>
				<!-- 실시간 검색어 -->
				<div class="realtime_soar_keyword">
					<a href="/search/trend/index.htm" class="title"
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
								<a href="" class="ellipsis"
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
									<c:if test="${psearch.sc_rank<0}">
								<span class="wrap_rank down">
									<span class="icon">순위하락수</span>
									<span class="num">${psearch.sc_rank}</span>
								</span>
										</c:if>
									<c:if test="${psearch.sc_rank==0}">
						<span class="wrap_rank static">
									<span class="icon">순위 동일</span>
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
						<a href="/search/trend/index.htm" class="keyword_more" title="실시간 순위">
							<span>더보기 
								<span></span>
							</span>
						</a>
					</div>
				</div>
			</div>
			<!-- //실시간 검색어 -->

			<!-- 배너 영역 -->
			<div class="cmn_banner">
				<div class="banner_bxslider">
					<a href="" title="라이브원(소유) 사전알림 당일 - 페이지 이동" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20181002062810.png"
							alt="">
					</a>
					<a href="" title="이용권(니니즈 10월) - 페이지 이동" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20180928071055.png"
							alt="">
					</a>
					<a href="" title="게토레이 5차 - 페이지 이동" class="d_item mlog">
						<img class="btn_banner" width="280" height="75"
							src="https://cdnimg.melon.co.kr/svc/images/main/imgUrl20180912115049.png"
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
						<a href="./LemonChart.ct" class="cur_menu mlog">
							<span class="menu_bg menu01">레몬차트</span>
						</a>
					</li>
					<li class="menu2">
						<a href="./LemonLatest_Chart.ct" class="cur_menu mlog">
							<span class="menu_bg menu02">최신</span>
						</a>
					</li>
					<li class="menu3">
						<a href="" class="cur_menu mlog">
							<span class="menu_bg menu03">장르</span>
						</a>
					</li>
					<li class="menu4">
						<a href="" class="cur_menu mlog">
							<span class="menu_more menu05">멜론DJ</span>
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
					<li class="menu8">
						<a href="" class="cur_menu mlog">
							<span class="menu_bg menu07">마이뮤직</span>
						</a>
					</li>
					<li class="menu9">
						<a href="./MusicUpload.ams" class="cur_menu mlog">
							<span class="menu_bg menu08">업로드</span>
						</a>
					</li>
				</ul>
			</div>
			<!-- 메뉴 -->
		</div>
	</div>
<div style="clear: both;"></div> 