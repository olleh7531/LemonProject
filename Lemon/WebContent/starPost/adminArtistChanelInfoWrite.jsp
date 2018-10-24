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
<link rel="stylesheet" type="text/css" href="./assets/css/common/jquery-ui.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/common/jquery-ui.js"></script>
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_admin.js"></script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	<form action="./AStartPostInfoWriteAction.asp" method="post" enctype="multipart/form-data" name="form" >
		<table border="1">
			<tr>
				<td>가수 이름</td>
				<td>
					<input type="text" name="singerName" class="singerName">
				</td>
			</tr>
			<tr>
				<td>가수 사진</td>
				<td>
					<input type="file" name="singerPicture">
				</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>
					<input type="text" name="birth_calendar" class="birth_calendar">
				</td>
			</tr>
			<tr>
				<td>데뷔</td>
				<td>
					<input type="text" name="debut_calendar" class="debut_calendar">
				</td>
			</tr>
			<tr>
				<td>활동년대</td>
				<td>
					<fieldset>
						<legend>아티스트 활동 년대</legend>
						<p>
							<!-- 전체 선택용 체크박스 -->
							<input type="checkbox" id="active_years_all_check" value="Y">
							<label for="active_years_all_check"> 전체선택</label>
						</p>
						<p>
							<!-- 개별 항목들에 대한 체크박스 -->
							<input type="checkbox" name="active_years"
								id="active_years_1990" class="active_years_check"
								value="1990">
								<label for="active_years_1990">1990</label>
							<input type="checkbox" name="active_years"
								id="active_years_2000" class="active_years_check"
								value="2000">
								<label for="active_years_2000">2000</label>
							<input type="checkbox" name="active_years"
								id="active_years_2010" class="active_years_check"
								value="2010">
								<label for="active_years_2010">2010</label>
						</p>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>유형</td>
				<td>
					<!-- http://victoryan.tistory.com/85 -->
					<!-- https://blog.naver.com/jung20619/221104836168 -->
					<!-- http://jindo.dev.naver.com/docs/jindo-component/1.8.0/doc/external/classes/jindo.SelectBox.html -->
					<!-- https://blog.naver.com/horu_kaya/221033455801 -->
					<select name="solo_group" size="1">
						<option disabled="disabled">솔로/그룹</option>
						<option value="solo" class="sologroup_solo">솔로</option>
						<option value="group" class="sologroup_group">그룹</option>
					</select>
					<select name="gender" size="1">
						<option disabled="disabled">성별</option>
						<option value="woman">여성</option>
						<option value="man">남성</option>
						<option value="mixed_gender">혼성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
					<fieldset>
						<legend>노래 장르</legend>
						<!-- 한국대중음악 발라드 댄스 랩/힙합 R&B/Soul 인디음악 록/메탈 트로트 포크/블루스 -->
						<p>
							<!-- 전체 선택용 체크박스 -->
							<input type="checkbox" id="song_genres_all_check" value="Y">
							<label for="song_genres_all_check"> 전체선택</label>
						</p>
						<p>
							<!-- 개별 항목들에 대한 체크박스 -->
							<input type="checkbox" name="song_genres"
								id="song_genres_ballade" class="song_genres_check"
								value="ballade">
								<label for="song_genres_ballade">발라드</label>
							<input type="checkbox" name="song_genres"
								id="song_genres_dance" class="song_genres_check"
								value="dance">
								<label for="song_genres_dance">댄스</label>
							<input type="checkbox" name="song_genres"
								id="song_genres_raphiphop" class="song_genres_check"
								value="raphiphop">
								<label for="song_genres_raphiphop">랩/힙합</label>
							<input type="checkbox" name="song_genres"
								id="song_genres_randbsoul" class="song_genres_check"
								value="randbsoul">
								<label for="song_genres_randbsoul">R&B/Soul</label>
							<input type="checkbox" name="song_genres"
								id="song_genres_indie" class="song_genres_check"
								value="indie">
								<label for="song_genres_indie">인디음악</label>
						</p>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>소속사명</td>
				<td>
					<input type="text" name="agency_name" class="agency_name">
				</td>
			</tr>
			<tr>
				<td>소속그룹</td>
				<td>
					<input type="text" name="affiliate_group" class="affiliate_group">
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="제출">
	</form>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
