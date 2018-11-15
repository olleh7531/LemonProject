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
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/js/starpost/artist_chanel_photo.js"></script>
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
			<form action="./ArtistChanelPhotoWrtieAction.ac" method="post"
				enctype="multipart/form-data" name="form">
				<table border="1" style="margin: auto;">
					<tr>
						<td>가수 번호</td>
						<td style="text-align: left;"><input type="text" name="singer_photo_singer_num"
							class="singer_photo_singer_num" onblur="singerNumCheck()">
						</td>
					</tr>
					<tr>
						<td>가수 이름</td>
						<td style="text-align: left;"><input type="text" name="singer_photo_singer_name"
							class="singer_photo_singer_name"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td style="text-align: left;"><input type="text" name="singer_photo_title"
							class="singer_photo_title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="text-align: left;"><textarea name="singer_photo_content"
								class="singer_photo_content"></textarea></td>
					</tr>
					<tr>
						<td>사진</td>
						<td style="text-align: left;"><input type="file" name="singer_photo_photo"
							class="singer_photo_photo"></td>
					</tr>
				</table>
				<br>
				<br>
				<button type="submit" id="star_submit">제출</button>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
