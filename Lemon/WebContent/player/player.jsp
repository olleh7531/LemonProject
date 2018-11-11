<%@page import="com.lamon.musicplayer.db.MusicPlayerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Amazing Audio Player | HTML5 Audio Player for Your
	Website</title>
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
	// request.setAttribute("arr", arr);

	ArrayList<MusicPlayerBean> muplayer = (ArrayList) request.getAttribute("arr");
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
							<li data-artist="pinkzebra"
								data-title="In The Moment of Inspiration"
								data-album="AudioJungle" data-info=""
								data-image="http://snote88.dothome.co.kr/assets/img/img.jpg"
								data-duration="230">
								<div class="amazingaudioplayer-source"
									data-src="http://snote88.dothome.co.kr/assets/audio/aaa.mp3"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="http://snote88.dothome.co.kr/assets/audio/aaa.mp3"
									data-type="audio/ogg" />
							</li>
							<li data-artist="pinkzebra"
								data-title="Inspiring Ideas into Motion"
								data-album="AudioJungle" data-info=""
								data-image="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/sunny-day.jpg"
								data-duration="137">
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Inspiring%20Ideas%20into%20Motion.mp3"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Inspiring%20Ideas%20into%20Motion.ogg"
									data-type="audio/ogg" />
							</li>
							<li data-artist="pinkzebra" data-title="Peaceful Dawn"
								data-album="AudioJungle" data-info=""
								data-image="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/desert-sunrise.jpg"
								data-duration="129">
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Peaceful%20Dawn.mp3"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Peaceful%20Dawn.ogg"
									data-type="audio/ogg" />
							</li>
							<li data-artist="pinkzebra" data-title="Photos and Memories"
								data-album="AudioJungle" data-info=""
								data-image="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/dandelion.jpg"
								data-duration="133">
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Photos%20and%20Memories.mp3"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Photos%20and%20Memories.ogg"
									data-type="audio/ogg" />
							</li>
							<li data-artist="pinkzebra" data-title="Soaring Spirit"
								data-album="AudioJungle" data-info=""
								data-image="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/tulips.jpg"
								data-duration="130">
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Soaring%20Spirit.mp3"
									data-type="audio/mpeg" />
								<div class="amazingaudioplayer-source"
									data-src="https://amazingaudioplayer.com/wp-content/uploads/amazingaudioplayer/8/audios/Soaring%20Spirit.ogg"
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
