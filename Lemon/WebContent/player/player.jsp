<%@page import="com.lamon.musicplayer.db.MusicPlayerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Lemon Audio Player</title>
<link rel="shortcut icon" href="./assets/img/common/favicon.png">
<script type='text/javascript' src="./assets/js/player/jquery.js"></script>
<script src="http://snote88.dothome.co.kr/assets/js/jquery-3.0.0.min.js"></script>
<script type='text/javascript'
	src="./assets/js/player/lemonplayer-ver=1.1.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
}
</style>
</head>
<%
	//request.setAttribute("mpb", mpb);

	MusicPlayerBean mpb = (MusicPlayerBean) request.getAttribute("mpb");
%>
<body>
	<script>
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if (kcode == 8 || kcode == 116)
				event.returnValue = false;
		}
	</script>

	<div id="page" class="hfeed">
		<div id="main">
			<div id="primary">
				<div id="content" role="main">
					<!-- 필요 -->
					<link rel="stylesheet" type="text/css" media="all"
						href="./assets/css/player/lemonplayer.css" />
					<!-- 필요 -->
					<div id="amazingaudioplayer-8"
						style="display: block; position: relative; min-width: 300px; height: auto; margin: 0px auto 0px;">
						<ul class="amazingaudioplayer-audios" style="display: none;">

							<li data-artist="pinkzebra" data-title="<%=mpb.getMusic_name()%>"
								data-album="AudioJungle" data-info=""
								data-image="./musicUpload/albumcover/<%=mpb.getAl_art_img()%>"
								data-duration="230">
								<div class="amazingaudioplayer-source"
									data-src="./musicUpload/music/<%=mpb.getMusicfile()%>"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="./musicUpload/music/<%=mpb.getMusicfile()%>"
									data-type="audio/ogg" />
							</li>




						</ul>
					</div>
					<script src="./assets/js/player/initaudioplayer.js"></script>

				</div>
			</div>
		</div>
	</div>
</body>

</html>
