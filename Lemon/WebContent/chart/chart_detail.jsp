<%@page import="java.util.ArrayList"%>
<%@page import="com.lemon.chart.db.ChartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">

<link rel="stylesheet" type="text/css" href="./assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="./assets/css/chart/chart.css">
<link rel="stylesheet" type="text/css" href="./assets/css/chart/chartCapy.css">

<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type='text/javascript' src="./assets/js/player/jquery.js"></script>
<script type="text/javascript" src="./assets/js/chart/chartCheckBox.js"></script>
<style type="text/css">
.wrap_cmt_cntt {
	display: block;
	position: relative;
	padding: 15px 0 7px;
	padding-left: 235px;
}

.wrap_cmt_cntt .wrap_nicnmname {
	overflow: hidden;
	float: left;
	width: 196px;
	margin-left: -235px;
	padding: 0 15px 0 24px;
}

.wrap_cmt_cntt .wrap_nicnmname .thumb_wrap {
	position: relative;
	display: inline-block;
	float: left;
	padding-right: 23px;
}

.list_cmt .ellipsis {
	display: inline-block;
	overflow: hidden;
	vertical-align: middle;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.list_cmt ul li {
	border-top: 1px solid #e6e6e6;
}

.wrap_cmt_cntt .wrap_nicnmname .ellipsis a {
	color: #999;
}
</style>
</head>
<%
	//request.setAttribute("cb", cb);
	ChartBean cb = (ChartBean) request.getAttribute("cb");
	ArrayList MusizList = (ArrayList) request.getAttribute("MusizList");
	String email_id = (String) session.getAttribute("email_id");
	String img_user = (String) session.getAttribute("img_user");

	String mu_num = request.getParameter("mu_num");
%>
<body>
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<script type="text/javascript">	
		$(document).ready( function() {
			commentselect(<%=mu_num%>);
		});
	
		function goodMusic(num){
			//alert(num);
			$.ajax({
				type : "POST",
				url : "./GoodMusicAction.go",
				data: {
					go_num: num
				},
				success : function(data) {
					if(data == 0){
						alert("좋아요 반영되었습니다.");
						location.reload();
					}else if(data == 1){
						alert("좋아요 취소되었습니다.");
						location.reload();
					}
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			}) 
			
		}
		function comment_log(email_id){
			if(email_id == null){
				alert("로그인 해주세요.");
			}
		}
		function comment_insert(num){
			
			$.ajax({
				type : "POST",
				url : "./MusicCommentAction.mcm",
				data: {
					comment : $("#comment").val(),
					mu_num : num
				},
				success : function(data) {
					if(data == 1){
						  $("#comment").val("");
						  commentselect(num);
					  }
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			}) 
		}
				
		
		function commentselect(num){
			
			$.getJSON("./MusicCommentSelect01.mcm",{mu_num : num }, function(data) {
				//alert(data); d_cmtpgn_cmt_list_wrapper
				var html;
				$(data).each(function(index,item){
					var content = item.content;
					html = "<li data-cmt-id='' data-cmt-owner='off' class='first_child' style='height: 100px;'>"+
											"<div class='wrap_cmt_cntt d_cmtpgn_cmt_wrapper'>"+
												"<div class='wrap_nicnmname d_cmtpgn_cmt_member_wrapper'>"+
													"<span class='none'>작성자</span> <span class='thumb_wrap'>"+
														"<a class='thumb d_cmtpgn_user' data-member-key=''	style='cursor: pointer; text-decoration: none;'>"+
															"<img  src='./upload/member/img/"+item.img+"' width='54' height='54' alt='''>"+
															"<span class='thumb_frame'></span>"+
														"</a>"+
													"</span>"+
													"<div class='ellipsis' style='max-width: 102px;'>"+
														"<a class='thumb d_cmtpgn_user' data-member-key='' style='cursor: pointer; text-decoration: none;'>"+
															"<span class='d_cmtpgn_member_nickname' title='"+item.nickname+"'>"+
															item.nickname+
															"</span>"+
														"</a>"+
													"</div>"+
												"</div>"+	
												"<div class='wrap_cntt d_cmtpgn_cmt_cont_wrapper'>"+
													"<div class='cntt'>"+
														"<div class='cmt_text d_cmtpgn_cmt_full_contents' style='-ms-word-break: break-all; word-break: break-all; word-break: break-word; word-wrap: break-word; -webkit-hyphens: auto; -ms-hyphens: auto; hyphens: auto; display: block'>"+
															"<div class='cmt_cont'>"+
																"<span class='none'>내용</span>"+
																content+
															"</div>"+
														"</div>"+
													"</div>"+
													"<div>"+
														"<span class='none'>작성일자</span>"+
														"<span class='date'>"+
															"<span>"+item.time+"</span>"+
															"<span class='time'></span>"+
														"</div>"+
													"</div>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</li>"
				});
				$( "#d_cmtpgn_cmt_list_wrapper ul").append(html);
			})
		}
	</script>
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="pr_none">
			<div class="page_header">
				<h2 class="title">앨범 정보</h2>
			</div>

			<div class="section_info">
				<div class="wrap_info">
					<div class="thumb">
						<a href="#" title="" class="image_typeAll" id="d_album_org"> <img
							onerror="WEBPOCIMG.defaultAlbumImg(this);" width="282"
							height="282"
							src="./musicUpload/albumcover/<%=cb.getAl_art_img()%>" alt="">
							<span class="bg_album_frame"></span>
						</a>
						<button type="button" title="듣기" class="button_icons type05 play"
							onclick="">
							<span class="none">듣기</span>
						</button>
						<!-- [DP] 앨범보기 -->
						<div class="l_popup album_prev" id="d_almumcover"></div>
						<!-- //[DP] 앨범보기 -->
					</div>
					<div class="entry">
						<div class="info">
							<span class="gubun"> [<%=cb.getMusic_genre()%>]
							</span>
							<div class="song_name">
								<strong class="none">앨범명</strong>
								<%=cb.getAl_name()%>
							</div>
							<div class="artist">
								<a href="#" title="" class="artist_name"><span><%=cb.getAl_singer_name() %></span>
								</a>
							</div>
						</div>
						<div class="meta">
							<dl class="list">
								<dt>발매일</dt>
								<dd><%=cb.getAl_release()%></dd>
								<dt>장르</dt>
								<dd><%=cb.getMusic_genre()%></dd>
								<!-- <dt>발매사</dt>
								<dd>로엔엔터테인먼트</dd>
								<dt>기획사</dt>
								<dd>울림 엔터테인먼트</dd> -->
							</dl>
						</div>
						<div class="button d_album_like">
							<!-- <button type="button" class="button_etc like type02" id="btnLike"
								title="" data-album-no="" data-album-menuid="" data-target-id="">
								<span class="odd_span">좋아요</span> <span id="d_like_count"
									class="cnt">2,057</span>
							</button> -->
							<!-- <button type="button" title="앨범다운" class="btn" onclick="#">
								<span class="button_icons download type03"></span> <span
									class="text">앨범다운</span> <span
									class="button_icons arrow_link02"></span>
							</button>

							<button type="button" title="FLAC앨범다운" class="btn " onclick="#">
								<span class="button_icons download type03"></span> <span
									class="text">FLAC앨범다운</span> <span
									class="button_icons arrow_link02"></span>
							</button>

							<button type="button" title="선물하기" class="btn" onclick="#">
								<span class="button_icons type03 gift"></span> <span
									class="text">선물하기</span> <span
									class="button_icons arrow_link02"></span>
							</button> -->

						</div>
						<div class="share">
							<dl>
								<dt>
									<div class="grade">
										<span class="bullet_icons star"><span class="progress"
											id="contt_evalscore01_view" style="width: 81.08408600000001%"
											title="평점 5점 만점"><span class="none">0.0점</span></span></span> <span
											class="cnt" id="gradPointLayer">4.1</span>
									</div>
								</dt>
								<dd>
									<a href="#none" data-control="dropdown"> <span class="text"
										id="gradCountLayer">1,439명</span> <span
										class="button_icons arrow_link02"></span>
									</a>
									<!-- [DP] 별점평가 레이어 -->
									<div class="l_popup small" id="d_starRate"
										style="right: 0; top: 28px; width: 259px; display: none;"
										data-zindex-target="div.grad_area">
										<div class="l_cntt">
											<dl class="box_evalscore">
												<dt>별을 클릭하여 앨범을 평가해 주세요.</dt>
												<dd>
													<span class="wrap_evalscore02"> <span
														class="contt_evalscore02"> <label for="score01"
															class="score01 on"> <span><input
																	type="radio" id="score01" name="score"></span> <span>0.5점</span>
														</label> <label for="score02" class="score02 on"> <span><input
																	type="radio" id="score02" name="score"></span> <span>1점</span>
														</label> <label for="score03" class="score03 on"> <span><input
																	type="radio" id="score03" name="score"></span> <span>1.5점</span>
														</label> <label for="score04" class="score04 on"> <span><input
																	type="radio" id="score04" name="score"></span> <span>2점</span>
														</label> <label for="score05" class="score05 on"> <span><input
																	type="radio" id="score05" name="score"></span> <span>2.5점</span>
														</label> <label for="score06" class="score06"> <span><input
																	type="radio" id="score06" name="score"></span> <span>3점</span>
														</label> <label for="score07" class="score07"> <span><input
																	type="radio" id="score07" name="score"></span> <span>3.5점</span>
														</label> <label for="score08" class="score08"> <span><input
																	type="radio" id="score08" name="score"></span> <span>4점</span>
														</label> <label for="score09" class="score09"> <span><input
																	type="radio" id="score09" name="score"></span> <span>4.5점</span>
														</label> <label for="score10" class="score10"> <span><input
																	type="radio" id="score10" name="score"></span> <span>5점</span>
														</label>
													</span> <span class="text_evalscore02"> <span class="none">선택평점</span>
															<strong id="d_rate">2.5</strong> <span class="score">/
																<span class="none">총 평점</span>5
														</span>
													</span>
													</span>
													<div class="wrap_btn_c mt20">
														<button type="button" title="앨범 별점 평가 확인"
															class="button_rbox green" data-role="ok">
															<span class="cnt">확인</span>
														</button>
														<button type="button" title="앨범 별점 평가 취소"
															class="button_rbox d_close">
															<span class="cnt">취소</span>
														</button>
													</div>
												</dd>
											</dl>
										</div>
										<button type="button" class="btn_close">
											<span class="odd_span">닫기</span>
										</button>
										<span class="shadow"></span>
									</div>
									<!-- //[DP] 별점평가 레이어 -->
								</dd>
								<dt>댓글</dt>
								<dd>
									<a href="javascript:goReview();"> <span id="revCnt"
										class="text">520개</span> <span
										class="button_icons arrow_link02"></span>
									</a>
								</dd>
								<dt>공유</dt>
								<dd>
									<div class="wrap_sns">
										<button type="button" title="친구에게 음악메시지 보내기"
											class="bullet_icons sns frend" onclick="">
											<span class="none">친구</span>
										</button>
										<button type="button" title="페이스북" id="albumFacebook"
											class="bullet_icons sns facebook" data-menuid="28010101">
											<span class="none">페이스북</span>
										</button>
										<button type="button" title="트위터" id="albumTwitter"
											class="bullet_icons sns twitter" data-menuid="28010101">
											<span class="none">트위터</span>
										</button>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="page_header">
				<h5 class="title">
					수록곡 <span class="sum">(7)</span>
				</h5>
			</div>
			<form action="#">
				<div class="service_list_song" style="margin-bottom: 35px;">
					<div class="wrap_btn_tb top">

						<button type="button" title="선택된 곡 듣기" class="button_rbox"
							onclick="">
							<i class="fa fa-play" style="color: #969696;"></i><span
								class="cnt">듣기</span>
						</button>
						<button type="button" title="선택된 곡 담기" class="button_rbox"
							onclick="checkMusicList()">
							<i class="fa  fa-plus" style="color: #969696;"></i><span
								class="cnt">담기</span>
						</button>
						<button type="button" title="선택된 곡 다운로드" class="button_rbox"
							onclick="">
							<i class="fa  fa-download " style="color: #969696;"><span
								class="cnt"></i>다운</span>
						</button>


					</div>
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
										<span class="rank">번호</span>
									</div>
								</th>
								<th scope="col">
									<div class="wrap none">앨범이미지</div>
								</th>
								<th scope="col">
									<div class="wrap none">곡 상세가기</div>
								</th>
								<th scope="col">
									<div class="wrap pd_l_12">곡정보</div>
								</th>
								<!-- <th scope="col">
									<div class="wrap pd_l_12">앨범</div>
								</th> -->
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
								for (int i = 0; i < MusizList.size(); i++) {
									ChartBean mcb = (ChartBean) MusizList.get(i);
									int a = i + 1;
							%>
							<tr>
								<td>
									<div class="wrap t_right">
										<input type="checkbox" title="Make Up (Feat. Crush) 곡 선택"
											class="input_check " name="input_check"
											value="<%=mcb.getMu_num()%>">
									</div>
								</td>

								<td>
									<div class="wrap t_center" style="color: #000;">
										<span class="rank "><%=a%></span>
									</div>
								</td>
								<td style="width: 60px;">
									<div class="wrap">
										<a href="#" title="Sun And Moon Part.1" class="image_typeAll">
											<img onerror="WEBPOCIMG.defaultAlbumImg(this);" width="60"
											height="60"
											src="./musicUpload/albumcover/<%=mcb.getAl_art_img()%>"
											alt=""> <span class="bg_album_frame"></span>
										</a>
									</div>
								</td>
								<td>
									<div class="wrap" style="text-align: center;">
										<a href="#" class="btn button_icons type03 song_info"><a
											href="#"><i class="fa fa-file-text-o"></i></a></a>
									</div>
								</td>
								<td>
									<div class="wrap">
										<div class="wrap_song_info">
											<div class="ellipsis rank01">
												<span> <a href="#" title="<%=mcb.getMusic_name()%>"><%=mcb.getMusic_name()%></a>
												</span>
											</div>
											<br>
											<div class="ellipsis rank02">
												<a href="#" title="샘김 (SAM KIM) - 페이지 이동"><%=mcb.getMusicfile().split("-")[0]%></a>
											</div>

										</div>
									</div>
								</td>
								<!-- <td>
									<div class="wrap">
										<div class="wrap_song_info">
											<div class="ellipsis rank03">
												<a href=#
													"
													title="Sun And Moon Part.1 - 페이지 이동">Sun
													And Moon Part.1</a>
											</div>
										</div>
									</div>
								</td> -->
								<td>
									<div class="wrap" style="text-align: center">
										<button type="button" class="button_etc like"
											title="Make Up (Feat. Crush) 좋아요" data-song-no="31376041"
											data-song-menuid="18030123"
											onclick="goodMusic(<%=mcb.getMu_num()%>)">
											<span class="odd_span"><i class="fa fa-heart-o"></i><span
												class="cnt"><%=mcb.getMu_good()%></span></span>
										</button>
									</div> <!--<a href="#"><i class="fa  fa-heart-o"></i>222</a>-->
								</td>
								<td>
									<div class="wrap t_center">
										<button type="button" title="듣기" class="button_icons play"
											onclick="LemonPlayer(<%=mcb.getMu_num()%>,<%=mcb.getAlbum_num()%>)">
											<i class="fa fa-play"></i><span class="none">듣기</span>
										</button>
									</div>
								</td>
								<td>
									<div class="wrap t_center">
										<button type="button" title="담기" class="button_icons scrap"
											onclick="location.href='./UserPlaylistUP.ct?mu_num=<%=mcb.getMu_num()%>'">
											<i class="fa  fa-plus"></i><span class="none">담기</span>
										</button>
									</div>
								</td>
								<td>

									<div class="wrap t_center">
										<button type="button" title="다운로드"
											class="button_icons download "
											onclick="location.href='./chart/file_down.jsp?file_name=<%=mcb.getMusicfile()%>'">
											<i class="fa  fa-download "></i><span class="none">다운로드</span>
										</button>
									</div>

								</td>
								<td>
									<div class="wrap t_center">
										<button type="button" title="뮤직비디오"
											class="button_icons video ">
											<i class="fa  fa-youtube-play"></i><span class="none">뮤직비디오</span>
										</button>
									</div>
								</td>
							</tr>
							<%
								}
							%>

						</tbody>

					</table>
				</div>
			</form>
			<div class="section_albuminfo">
				<div class="page_header">
					<h5 class="title">앨범소개</h5>
				</div>
				<div class="cont_albuminfo">
					<div class="dtl_albuminfo" id="d_video_summary"
						style="height: 141px;" tabindex="0">
						<div>
							<div>
								<strong>3년만의 LYn의 정규 앨범 #10</strong>
							</div>
							<div>&nbsp;</div>
							<div>깊어진 감성, 마음을 감동시키는 가사와 노래.</div>
							<div>꾸준히 우리 곁에서 노래하며 아름다운 감동을 주었던 LYn이 더욱 깊어진 음악으로 돌아왔다.</div>
							<div>이번 정규 10집 ‘#10’은 그동안 LYn이 우리에게 들려주었던 음악들을 한 장의 앨범에
								담아내기 위해 많은 시간 곡을 작업하고 가사를 쓰며 노력을 기울인 LYn의 음악적인 전부를 담았다.</div>
							<div>&nbsp;</div>
							<div>타이틀곡 '이별의 온도'는 LYn과 싱어송라이터 박새별의 공동작업을 통하여 수없이 노래하고
								수정하여 탄생하게 된 감성적인 발라드 곡이다.</div>
							<div>&nbsp;</div>
							<div>이번 앨범의 1번 트랙을 장식하고 있는 '노래뿐이라서'는 지난 5월에 선공개 된 '엄마의 꿈'으로
								LYn과 호흡을 맞추며 많은 감동을 주었던 프로듀싱팀 JPG와 LYn이 공동으로 작곡하고, LYn이 작사를 하여
								LYn의 음악적 색채를 깊게 표현해주고 있다. 매 앨범마다 우리 마음에 동화되어 있는 듯한 가사로 노래에 빠져들게
								했던 LYn은 이번에도 전곡 작사에 참여하여 첫 트랙에서부터 마지막 트랙까지 노래의 단어 하나하나 감성을 전하고
								있다.</div>
							<div>&nbsp;</div>
							<div>또한 이번 앨범에는 그동안 LYn과 함께 작업하며 많은 사랑을 받았던 대표 곡들을 만들어냈던
								황성제, 하정호, 황찬희 작곡가 등이 참여하며 LYn의 정규 10집 ‘#10’에 더욱 많은 공을 들였다.</div>
							<div>정규 10집을 발매하는 LYn은 앞으로도 가슴깊이 남는 음악으로 우리에게 진한 여운과 감동을 전할
								것이다.</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>01. 노래뿐이라서</div>
							<div>Lyrics by LYn Composed by LYn, JPG(정수민, 서미래) Arranged
								by 정수민</div>
							<div>&nbsp;</div>
							<div>LYn과 프로듀싱팀 JPG가 공동으로 작곡한 곡으로 피아노와 오케스트레이션으로
								구성되었으며,LYn의 섬세한 노래를 들을 수 있는 도입부와 호소력 짙은 LYn만의 감성이 후반부로 갈수록 더욱
								돋보인다. 마음을 위로해주는 진심어린 가사가 인상적인 곡이다.</div>
							<div>&nbsp;</div>
							<div>02. 이별의 온도 Title</div>
							<div>Lyrics by LYn, 박새별 Composed by 박새별 Arranged by 박새별,
								박인영</div>
							<div>&nbsp;</div>
							<div>많은 연인들의 사랑의 온도가 같은 호흡으로 가는 것은 아니다.서로의 온도가 다를 때에</div>
							<div>이별이 다가오고,이별 후엔 처음엔 덤덤하다가도 사무치듯 그리움과 후회가 밀려오게 된다.</div>
							<div>‘이별의 온도’는 이러한 감정의 흐름처럼 잔잔하게 시작하다가 고조될수록 폭발하는 듯한</div>
							<div>미련과 후회,슬픔과 그리움을 노래하는 곡이다.기본에 충실한 어쿠스틱 악기 구성을</div>
							<div>바탕으로 진중하고 수려한 박인영의 오케스트레이션,그리고 LYn의 애절한 목소리가 합쳐져 근래 드문
								슬프고 시원한 정통 발라드곡이 완성되었다.</div>
							<div>&nbsp;</div>
							<div>03. 별처럼</div>
							<div>Lyrics by LYn Composed &amp; Arranged by 황찬희, Simon
								Petrèn</div>
							<div>&nbsp;</div>
							<div>‘통화 연결음’을 작업했던 황찬희 작곡가와 Dirty Loops, 샤이니 등 국내외 여러
								아티스트들과 공동작업을 통하여 이름을 빛낸 작곡가 Simon Petrèn이 이번 LYn의 앨범을 위하여 쓴
								곡으로,영화 같은 LYn의 가삿말과아름다운 멜로디,도입부에 귀를 기울이게 되는 피아노와 기타 그리고 후반부의 화려한
								스트링 라인이 조화롭게 이루어진 발라드 곡이다.</div>
							<div>&nbsp;</div>
							<div>04. 두 마음에 빛이 나</div>
							<div>Lyrics by LYn Composed by 허성진, Se.A Arranged by 허성진</div>
							<div>&nbsp;</div>
							<div>서정적인 기타선율과 LYn의 섬세한 감성이 돋보이는 곡이다.</div>
							<div>&nbsp;</div>
							<div>05. 말해봐</div>
							<div>Lyrics by LYn Composed by JPG(황성제, 서미래, 정동윤) Arranged
								by 황성제</div>
							<div>&nbsp;</div>
							<div>‘엄마의 꿈’에 참여한 프로듀싱팀 JPG의 곡으로 순수한 사랑을 꿈꾸는 소녀의 마음을
								익살스러운가사로 표현하고, 린 특유의 사랑스러운 보컬로 곡의 완성도를 더했다. 또한 풍성한 코러스 라인이 이 곡의
								매력을 더해준다.</div>
							<div>&nbsp;</div>
							<div>06. 뻔한 노래</div>
							<div>Lyrics by LYn Composed &amp; Arranged by
								HA&amp;GO(하정호, 고영환)</div>
							<div>&nbsp;</div>
							<div>심플한 R&amp;B리듬에 리얼베이스와 신스베이스가 어우러져 그루비하게 움직이고 비트감 있는
								스트링이 곡 전체를 감싸고 있는 곡이다.</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>07. 너는, 책</div>
							<div>Lyrics by LYn Composed &amp; Arranged by 톰이랑제리, 진민호</div>
							<div>&nbsp;</div>
							<div>‘끝을 알지 못하고 겁 없이 읽었어’라는가사처럼만남에서 멀어지는 과정을 책 읽는 것에 비유한
								노래로, 사랑할수록 초라해지는 한 여자의 마음을 섬세한 멜로디와 몽환적이고 세련된 편곡으로 표현하였다.</div>
							<div>&nbsp;</div>
							<div>08. 취한 밤</div>
							<div>Lyrics by LYn Composed by 하동균 Arranged by 하동균, 고태영</div>
							<div>&nbsp;</div>
							<div>소규모의 악기 편성으로 감성을 극대화한 곡이다.</div>
							<div>&nbsp;</div>
							<div>09. 엄마의 꿈</div>
							<div>Lyrics by LYn Composed by JPG(황성제, 정동윤, 서미래) Arranged
								by황성제</div>
							<div>&nbsp;</div>
							<div>지난 5월 선공개 된 곡으로 소박한 피아노 연주와 기타 선율이 감성적인 LYn의 목소리와 어우러져
								따뜻한 여운을 남기는 곡이다. 엄마의 생신에 의미 깊은 곡을 선물하고 싶었다는 LYn이 직접 작사 하였으며 작업에
								참여한 모두가 눈시울을 붉혔다고 한다.</div>
							<div>&nbsp;</div>
							<div>10. 이별의 온도(Inst)</div>
							<div>Composed by 박새별 Arranged by 박새별, 박인영</div>
							<div>&nbsp;</div>
							<div>LYn 10th album #10 Credit</div>
							<div>&nbsp;</div>
							<div>&nbsp;</div>
							<div>Executive Producer ㅣ 325 Entertainment &amp; Contents</div>
							<div>Producer ㅣ LYn</div>
							<div>&nbsp;</div>
							<div>Executive Supervisor ㅣ Kim Bum Jun</div>
							<div>Supervisor ㅣ Heo Young Du at 325 E&amp;C</div>
							<div>New Businessㅣ Lee Na won at 325 E&amp;C</div>
							<div>&nbsp; A&amp;R Operation ㅣ Lee Jin Ho</div>
							<div>Recording Engineer ㅣ Jung Ki Hong (Asst. Choi Dyne,
								Lee Chan Mi) at Seoul Studio (Track 1~10)</div>
							<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Lee Chang
								Sun at Prelude Studio (Track 3, 5)&nbsp; &nbsp;&nbsp;</div>
							<div>Mixing Engineer ㅣ Jung Ki Hong (Asst. Choi Dyne, Lee
								Chan Mi) at Seoul Studio (Track 1~10)</div>
							<div>Mastering Engineer ㅣ Cheon Hoon at Sonic Korea</div>
							<div>&nbsp;</div>
							<div>Artist Management ㅣ Kang Sung Won at 325 E&amp;C</div>
							<div>Artist Development ㅣ Park hae in at 325 E&amp;C</div>
							<div>Media Planning ㅣ Hwang Jung Ki at JG Star</div>
							<div>&nbsp;</div>
							<div>Art Work &amp; Design ㅣ Kim Dae Hong at Tada Studio</div>
							<div>Photography ㅣ Jung Ji Eun at Agency VOTT</div>
							<div>&nbsp;</div>
							<div>Stylist ㅣ Choi You Lim (Asst. Summer) at Anew</div>
							<div>Makeup ㅣ Eun Jung at Style Floor</div>
							<div>Hair ㅣ Woo Hyun at Culture and Nature</div>
							<div>&nbsp;</div>
							<div>Music Video ㅣ Bang Jae Yeob (Asst. Lee Seok Beom , Yun
								Byeol , Min Ji Hye) at Bang Jae Yeob FILM</div>
							<div>&nbsp;</div>
							<div>Printed ㅣ M tech</div>
						</div>
					</div>
					<!-- //앨범소개글 -->
					<button type="button" title=" 앨범소개 더보기" class="button_more arrow_u"
						id="d_video_button" style="display: inline-block;">
						<span class="text" id="text">펼치기<i class='fa fa-angle-down'></i></span>
						<i class="button_icons etc arrow_d"></i> <input type="checkbox"
							id="aaa" style="display: none">
					</button>
				</div>
			</div>
			<div class="section_movie">
				<div class="page_header">
					<h5 class="title">관련 비디오</h5>
				</div>

				<div class="service_list_video type03 d_video_list">


					<ul style="display: block;">

						<li>
							<div class="thumb">
								<a href="#" title="꽃 (LIKE A FLOWER) - 페이지 이동"
									class="image_typeAll"> <img
									onerror="WEBPOCIMG.defaultMvImg(this);" width="237"
									height="139"
									src="https://cdnimg.melon.co.kr/cm/mv/images/wide/501/92/226/50192226_640.jpg/melon/resize/480/quality/80/optimize"
									alt="">
								</a>
							</div>
							<div class="entry">
								<div class="info">
									<a href="#" class="ellipsis album_name" title="비디오상세 이동">꽃
										(LIKE A FLOWER)</a> <span class="ellipsis artist"> <a
										href="javascript:melon.link.goArtistDetail('861430');"
										title="엔플라잉 (N.Flying) - 페이지 이동" class="artist_name">엔플라잉
											(N.Flying)</a>
									</span>

								</div>
								<div class="meta">
									<span class="view" title="조회"><span
										class="bullet_icons cnt_view"></span><i class="fa fa-eye cnt">1,561
									</i></span> <i class="bar"></i>
									<button type="button" id="btnLikeMv" class="button_etc like"
										title="꽃 (LIKE A FLOWER) 좋아요" data-video-no="50192226"
										data-video-menuid="28010101">
										<span class="odd_span"> 좋아요</span> <i
											class="fa fa-heart-o cnt"> 31</i>
									</button>
								</div>
							</div>
						</li>



						<li>
							<div class="thumb">
								<a href="#" title="꽃 (LIKE A FLOWER) (Teaser) - 페이지 이동"
									class="image_typeAll"> <img
									onerror="WEBPOCIMG.defaultMvImg(this);" width="237"
									height="139"
									src="https://cdnimg.melon.co.kr/cm/mv/images/wide/501/92/017/50192017_640.jpg/melon/resize/480/quality/80/optimize"
									alt="">
								</a>
							</div>
							<div class="entry">
								<div class="info">
									<a href="#" class="ellipsis album_name" title="비디오상세 이동">꽃
										(LIKE A FLOWER) (Teaser)</a> <span class="ellipsis artist">
										<a href="javascript:melon.link.goArtistDetail('861430');"
										title="엔플라잉 (N.Flying) - 페이지 이동" class="artist_name">엔플라잉
											(N.Flying)</a>
									</span>

								</div>
								<div class="meta">
									<span class="view" title="조회"><span
										class="bullet_icons cnt_view"></span><i class="fa fa-eye cnt">1,648</i></span>
									<i class="bar"></i>
									<button type="button" id="btnLikeMv" class="button_etc like"
										title="꽃 (LIKE A FLOWER) (Teaser) 좋아요"
										data-video-no="50192017" data-video-menuid="28010101">
										<span class="odd_span">좋아요</span> <i class="fa fa-heart-o cnt">
											44</i>
									</button>
								</div>
							</div>
						</li>

					</ul>


				</div>

				<div class="page">
					<span class="wrap_btn"> <a href="#" title="이전"
						class="btn page_prev disabled"><span class="odd_span">이전</span></a>
						<a href="#" title="다음" class="btn page_next disabled"><span
							class="odd_span">다음</span></a>
					</span>
				</div>




			</div>
			<div style="clear: both; margin-bottom: 35px;"></div>
			<div id="section_cmt" class="section_cmt">
				<div class="page_header">
					<h5 class="title">댓글</h5>
				</div>

				<div class="re_notice">
					<div style="border: 1px soild #000; height: 90px;">
						<table>
							<tr>
								<th>
									<div style="width: 54px; height: 54px; margin-right: 20px;">
										<%
											if (email_id != null) {
												if (img_user.equals(null)) {
										%><img src="./assets/img/main/chart/user.jpeg" width="54"
											height="54" style="border-radius: 50%;">
										<%
											} else {
										%>
										<img src="./upload/member/img/<%=img_user%>" width="54"
											height="54" style="border-radius: 50%;">
										<%
											}
											} else {
										%><img src="./assets/img/main/chart/user.jpeg" width="54"
											height="54" style="border-radius: 50%;">
										<%
											}
										%>
									</div>
								</th>
								<th><textarea
										style="height: 68px; width: 780px; resize: none;" id="comment"
										onkeyup="comment_log(<%=email_id%>)"></textarea></th>
								<th>
									<button
										style="margin-left: 20px; width: 72px; height: 80px; background-color: #F8F8F8; border: 1px solid #BDBDBD;"
										onclick="comment_insert(<%=mu_num%>)">등록</button>
								</th>
							</tr>
						</table>
					</div>
					<div class="thumb_wrap"></div>

				</div>
				<div class="cm_count"
					style="border-bottom: 1px solid #C1C1C1; display: flex;">
					<div class="cm_left">
						<strong style="font-size: 10px;"> 총 <span
							class="cm_point">00</span>개
						</strong>
					</div>
				</div>

				<!-- <div style="width: 100%; height: 30px; border: 1px solid #000;"></div>	 -->
				<div class="list_cmt" id="d_cmtpgn_cmt_list_wrapper" style="">
					<ul style="">

					</ul>
				</div>
			</div>

		</div>
	</div>

	<!-- 내용 -->

	<!-- footer -->
	<script>
		$(document).ready(function() {
			$("#d_video_button").click(function() {
				var checkBox = document.getElementById("aaa");
				if (checkBox.checked == true) {
					$("#d_video_summary").removeClass("on");
					$("#text").html("펼치기<i class='fa fa-angle-down'></i>");
					document.getElementById("aaa").checked = false;
				} else {
					$("#d_video_summary").addClass("on");
					$("#text").html("접기<i class='fa fa-angle-up'></i>");
					document.getElementById("aaa").checked = true;
				}
			});
		});
	</script>
	<script type="text/javascript">
		function LemonPlayer(mu_num,album_num){
			window.open("./LemonPlayer.mp?musicNum="+mu_num+"&album="+album_num+"","a","width=320,height=315,top=300,left=200,scrollbars=no,resizable=no,location=no,toolbar=no,menubar=no")
		}
	</script>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>