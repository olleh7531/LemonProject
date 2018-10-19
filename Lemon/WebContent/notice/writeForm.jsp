<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./assets/js/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="./assets/js/se2/js/HuskyEZCreator.js"></script>
	<script src="./assets/js/jquery-3.1.1.min.js"></script>
	<!-- Mainly scripts -->
	
	<script type="text/javascript">
		$(document).ready(function() {
			var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 
			// Editor Setting 
			nhn.husky.EZCreator.createInIFrame({  
				oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
				elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함. 
				sSkinURI : "./assets/js/se2/SmartEditor2Skin.html", // Editor HTML 
				fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
				htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true,
				}
			}); // 전송버튼 클릭이벤트 
			$("#submit_btn").click(function() { //if(confirm("저장하시겠습니까?")) { // id가 smarteditor인 textarea에 에디터에서 대입 
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); // 이부분에 에디터 validation 검증 
				$("#frm").submit();
			})
		});
	</script>
</head>

<body>
	<form action="./NoticeWriteAction.nt" method="post" id="frm">
		<select name="category">
			<option hidden>분류</option>
			<option value="서비스 소식">서비스 소식</option>
			<option value="서비스 오픈">서비스 오픈</option>
			<option value="서비스 종료">서비스 종료</option>
			<option value="서비스 점검">서비스 점검</option>
			<option value="안내">안내</option>
		</select>
		
		<input type="text" name="subject" placeholder="제목"> <br>
		
		<textarea name="content" id="smarteditor" rows="10" cols="100" style="width: 100%; height: 412px;" class="summernote"></textarea>
		<br> 
		<input type="button" id="submit_btn" value="글쓰기">
	</form>
</body>
</html>