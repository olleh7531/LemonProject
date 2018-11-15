<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/jquery-ui.css">
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/common/jquery-ui.js"></script>
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_info.js"></script>

<style type="text/css">
#wrap_conts {
   width: 100%;
   text-align: center;
}

#conts {
   display: inline-block;
   width: 1008px;
   min-height: auto;
   padding-top: 30px;
   padding-bottom: 90px;
}

#star_submit {
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 4px 10px;
    font-weight: bold;
    color: #fff;
    outline: 0;
    margin-left: 13px;
}

#star_submit:HOVER {
	background-color: #EDAE06;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	<div id="wrap_conts">
		<div id="conts">
			<form action="./ArtistChanelInfoWrtieAction.ac" method="post"
				enctype="multipart/form-data" name="form">
				<table id="star_tb" border="1" style="margin: auto;">
					<tr>
						<td>가수 이름(예명)</td>
						<td style="text-align: left;"><input type="text" name="singer_name" class="singer_name">
						</td>
					</tr>
					<tr>
						<td>본명</td>
						<td style="text-align: left;"><input type="text" name="singer_real_name"
							class="singer_real_name"></td>
					</tr>
					<tr>
						<td>가수 사진</td>
						<td style="text-align: left;"><input type="file" name="singer_picture"
							class="singer_picture"></td>
					</tr>
					<tr>
						<td>생일</td>
						<td style="text-align: left;"><input type="text" name="singer_birth"
							class="singer_birth"></td>
					</tr>
					<tr>
						<td>데뷔 날짜</td>
						<td style="text-align: left;"><input type="text" name="singer_debut_day"
							class="singer_debut_day"></td>
					</tr>
					<tr>
						<td>데뷔 곡</td>
						<td style="text-align: left;"><input type="text" name="singer_debut_song"
							class="singer_debut_song"></td>
					</tr>
					<tr>
						<td>솔로/그룹</td>
						<td style="text-align: left;"><select name="singer_solo_group" size="1">
								<option disabled="disabled">솔로/그룹</option>
								<option value="솔로" class="singer_solo_group_solo">솔로</option>
								<option value="그룹" class="singer_solo_group_group">그룹</option>
						</select></td>
					</tr>
					<tr>
						<td>그룹 번호</td>
						<td style="text-align: left;"><input type="text" name="singer_group_num"
							class="singer_group_num"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td style="text-align: left;"><select name="singer_gender" size="1">
								<option disabled="disabled">성별</option>
								<option value="여성">여성</option>
								<option value="남성">남성</option>
								<option value="혼성">혼성</option>
						</select></td>
					</tr>
					<tr>
						<td>장르</td>
						<td style="text-align: left;">
							<fieldset>
								<legend>노래 장르</legend>
								<!-- 한국대중음악 발라드 댄스 랩/힙합 R&B/Soul 인디음악 록/메탈 트로트 포크/블루스 -->
								<p>
									<!-- 전체 선택용 체크박스 -->
									<input type="checkbox" id="singer_song_genres_all_check" value="Y"> 
									<label for="song_genres_all_check">전체선택</label>
								</p>
								<p>
									<!-- 개별 항목들에 대한 체크박스 -->
									<input type="checkbox" name="singer_song_genres"
										id="song_genres_ballade" class="singer_song_genres_check"
										value="발라드"> <label for="song_genres_ballade">발라드</label>
									<input type="checkbox" name="singer_song_genres"
										id="song_genres_dance" class="singer_song_genres_check"
										value="댄스"> <label for="song_genres_dance">댄스</label>
									<input type="checkbox" name="singer_song_genres"
										id="song_genres_raphiphop" class="singer_song_genres_check"
										value="랩/힙합"> <label for="song_genres_raphiphop">랩/힙합</label>
									<input type="checkbox" name="singer_song_genres"
										id="song_genres_randbsoul" class="singer_song_genres_check"
										value="R&B/Soul"> <label for="song_genres_randbsoul">R&B/Soul</label>
									<input type="checkbox" name="singer_song_genres"
										id="song_genres_indie" class="singer_song_genres_check"
										value="인디음악"> <label for="song_genres_indie">인디음악</label>
									<input type="hidden" name="s_song_genres" id="zz" value="">
								</p>
								<script type="text/javascript">
									function artist_changel_submit() {
										var arr = "";
										
										$(function() {
											$("input[name=singer_song_genres]")
													.each(
															function() {
																if ($(this)
																		.is(
																				":checked")) {
																	arr += $(
																			this)
																			.val()
																			+ ", ";
																}
															});

											$("input[name=s_song_genres]").val(
													arr);

											$(form).submit();
										});
									}
								</script>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td>소속사명</td>
						<td style="text-align: left;"><input type="text" name="singer_agency_name"
							class="singer_agency_name"></td>
					</tr>
				</table>
				<br>
				<br>
				<button type="button" id="star_submit" name="submit0"
					onclick="artist_changel_submit()">제출</button>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
