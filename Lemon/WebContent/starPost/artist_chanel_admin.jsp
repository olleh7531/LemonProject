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

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_admin.js"></script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	활동 정보<br><br>
	<form action="" name="aca_form">
		<table border="1">
			<tr>
				<td>가수 이름</td>
				<td>아이유</td>
			</tr>
			<tr>
				<td>데뷔</td>
				<td>2008.09.18</td>
			</tr>
			<tr>
				<td>활동년대</td>
				<td>
					<fieldset>
						<legend>아티스트 활동 년대</legend>
						<p>
							<!-- 전체 선택용 체크박스 -->
							<input type="checkbox" id="aca_active_years_all_check" value="Y">
							<label for="aca_active_years_all_check"> 전체선택</label>
						</p>
						<p>
							<!-- 개별 항목들에 대한 체크박스 -->
							<input type="checkbox" name="aca_active_years"
								id="aca_active_years_1990" class="aca_active_years_check"
								value="1990">
								<label for="aca_active_years_1990">1990</label>
							<input type="checkbox" name="aca_active_years"
								id="aca_active_years_2000" class="aca_active_years_check"
								value="2000">
								<label for="aca_active_years_2000">2000</label>
							<input type="checkbox" name="aca_active_years"
								id="aca_active_years_2010" class="aca_active_years_check"
								value="2010">
								<label for="aca_active_years_2010">2010</label>
						</p>
						<input type="submit" value="제출">
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>유형</td>
				<td>
					<!-- http://victoryan.tistory.com/85 -->
					<select name="solo_group" size="1">
							<optgroup label="솔로/그룹" selected>
								<option value="solo">솔로</option>
								<option value="group">그룹</option>
							</optgroup>
					</select>
					<select name="gender" size="1">
							<optgroup label="성별" selected>
								<option value="woman">여성</option>
								<option value="man">남성</option>
								<option value="mixed_gender">혼성</option>
							</optgroup>
					</select>
				</td>
			</tr>
		</table>
		
		<br><br>
		노래 장르<br><br>
		<table border="1">
			<tr>
				<td>
					<fieldset>
						<legend>노래 장르</legend>
						<!-- 한국대중음악 발라드 댄스 랩/힙합 R&B/Soul 인디음악 록/메탈 트로트 포크/블루스 -->
						<p>
							<!-- 전체 선택용 체크박스 -->
							<input type="checkbox" id="aca_song_genres_all_check" value="Y">
							<label for="aca_song_genres_all_check"> 전체선택</label>
						</p>
						<p>
							<!-- 개별 항목들에 대한 체크박스 -->
							<input type="checkbox" name="aca_song_genres"
								id="aca_song_genres_1990" class="aca_song_genres_check"
								value="1990">
								<label for="aca_active_years_1990">발라드</label>
							<input type="checkbox" name="aca_song_genres"
								id="aca_song_genres_2000" class="aca_song_genres_check"
								value="2000">
								<label for="aca_active_years_2000">댄스</label>
							<input type="checkbox" name="aca_song_genres"
								id="aca_song_genres_2010" class="aca_song_genres_check"
								value="2010">
								<label for="aca_active_years_2010">랩/힙합</label>
							<input type="checkbox" name="aca_song_genres"
								id="aca_song_genres_2010" class="aca_song_genres_check"
								value="2010">
								<label for="aca_active_years_2010">R&B/Soul</label>
							<input type="checkbox" name="aca_song_genres"
								id="aca_song_genres_2010" class="aca_song_genres_check"
								value="2010">
								<label for="aca_active_years_2010">인디음악</label>
						</p>
					</fieldset>
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
