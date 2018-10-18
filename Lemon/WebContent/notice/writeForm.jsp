<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./assets/js/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript">
		$(document).ready(function() {
			var oEditors = [];
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
				elPlaceHolder : "smartEditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
				sSkinURI : "./se2/SmartEditor2Skin.html", // Editor HTML 
				fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
				htParams : {
					bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				}
			});			
			
			// 전송버튼 클릭이벤트
			$("#submit_btn").click(function() {
				oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
				//if(confirm("저장하시겠습니까?")) { // id가 smarteditor인 textarea에 에디터에서 대입
				if (validation()) { // 이부분에 에디터 validation 검증 
					$("#frm").submit();
				}
			})
		}); 
		
		// 필수값 Check 
		function validation() {
			var contents = $.trim(oEditors[0].getContents());
			if (contents === '<p>&bnsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
				alert("내용을 입력하세요.");
				oEditors.getById["smartEditor"].exec('FOCUS'); 
				return false;
			}
			return true;
		}
	</script> -->
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
				sSkinURI : "./se2/SmartEditor2Skin.html", // Editor HTML 
				fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
				htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true,
				}
			}); // 전송버튼 클릭이벤트 
			$("#savebutton").click(function() { //if(confirm("저장하시겠습니까?")) { // id가 smarteditor인 textarea에 에디터에서 대입 
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); // 이부분에 에디터 validation 검증 
				if (validation()) {
					$("#frm").submit();
				} //} 
			})
		}); // 필수값 Check 
		function validation() {
			var contents = $.trim(oEditors[0].getContents());
			if (contents === '<p>&bnsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
				alert("내용을 입력하세요."); oEditors.getById['smarteditor'].exec('FOCUS'); return false;
			}
			return true;
		}
	</script>
</head>

<body>
	<h1>WebContent/notice/writeForm.jsp</h1>
	<h1>게시판 글쓰기</h1>
	
	<form action="./NoticeWriteAction.bo" method="post" id="frm">
		제목 : <input type="text" name="subject"><br>
		내용 : <!-- <textarea name="smartEditor" id="smartEditor" rows="10" cols="100" style="width:766px; height:412px;"> </textarea> -->
		<textarea name="content" id="smarteditor" rows="10" cols="100" style="width: 100%; height: 412px;" class="summernote"></textarea>
		<br> <input type="button" id="submit_btn" value="글쓰기">
	</form>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>INSPINIA | Dashboard</title>


<body onload="Idcheck()">
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg dashbard-1"
			style="padding-left: 0px;">
			<div class="row" style="margin-top: 40px;">
				<div class="col-lg-12">
					<div class="wrapper wrapper-content">
						<div class="row">
							<div class="col-lg-11 animated fadeInRight"
								style="margin-top: 20px;">
								<div class="mail-box-header">
									<h2>글 작성하기</h2>
								</div>
								<form
									action="../Pro/writePro.jsp?pageNum=<%=pageNum%>&type=<%=type%>"
									method="post" id="frm">
									
									<div class="mail-box">
										<div class="mail-body">

											<div class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-2 control-label"></label>
													<div class="col-sm-10" style="margin-left: -5px;">
														<input type="text" class="form-control" name="subject"
															placeholder="제목을입력 하세요.">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label" for="secret"></label>
													<div class="col-sm-10" style="margin-left: -5px;">
														<label class="col-sm-1 control-label" for="secret">비밀<br>
															글 작성
														</label>
														<div class="col-sm-11">
															<input type="checkbox" class="form-control" id="secret"
																name="secret" value="1">
														</div>
													</div>
												</div>
											</div>

										</div>
										<div class="col-sm-2"></div>
										<div class="mail-text h-200 col-sm-10">

											
											<div class="clearfix"></div>
										</div>
										<div class="mail-body text-right tooltip-demo">
											
											<button class="btn btn-sm btn-primary" id="savebutton">
												<i class="fa fa-pencil"></i> 작성
											</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	
</body> --%>