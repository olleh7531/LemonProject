<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"	href="./assets/css/magazine/table.css">
<!-- 메인페이지 css -->

<link rel="stylesheet" type="text/css"	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript"	src="./assets/js/menu/main_search_real_time.js"></script>
<script type="text/javascript" src="./assets/js/main/main_new_album.js"></script>
<script type="text/javascript" src="./assets/js/main/main_event.js"></script>
<script type="text/javascript" src="./assets/js/main/main_hot_issue.js"></script>
<script type="text/javascript" src="./assets/js/main/main_chart.js"></script>
<script type="text/javascript" src="./assets/js/main/main_login.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async	defer></script>


<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(document).ready(function() {
		var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 

		//Editor Setting
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors, // 전역변수 명과 동일해야 함.\
			elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "./assets/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				//입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});
		// 전송버튼 클릭이벤트

		$("#savebutton").click(function() {
			//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

			//이부분에 에디터 validation 검증
			if (validation()) {
				$("#frm").submit();
			}
			//}
		})
	});

	// 필수값 Check function validation(){ var contents =
	function validation() {
		var contents = $.trim(oEditors[0].getContents());
		if (contents === '<p>&bnsp;</p>' || contents === '') {
			// 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음.
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}
		return true;
	}
	</script>

</head>
<body>
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<div id="cont_wrap" class="clfix">
	<div id="conts_section" class="pr_none">
		<h1>글쓰기</h1>
			<form action="./magazineBoardWriteAction.maga" method="post" id="frm">
				<table class="type09">
					<thead>
						<tr>
							<th scope="cols">제목</th>
							<td><input type="text" name="ma_subject"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">내용</th>
							<td><textarea name="smarteditor" id="smarteditor" cols="100"
									style="width: 766px; height: 412px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<center>
					<input type="button" id="savebutton" class="button" value="글쓰기">
					<input type="button" class="button" value="글목록" onclick="">
				</center>
			</form>
		</div>
	</div>
</body>
</html>