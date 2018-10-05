var html = '';

if (isMelonLogin()) {
	var prodName;
	
	if (getProdName() != "") {
		var prodNames = getProdName().replace(/,/g, "</span>, <span>");
		
		prodName = '<a href="javascript:melon.menu.goMyPage();" title="이용권보유현황">'
					+ '<span class="box_name"><strong><span>'
					+ prodNames
					+'</span></strong> 사용중</span>'
					+ '</a>';
	} else {
		prodName = "보유중인 이용권이 없습니다.";
	}

	// var memId = getMemberId();
	var memId = getDisplayId();
	
	// 카카오계정이 아닌경우에만 @도메인 영역 삭제처리
	if(memId.indexOf("@") != -1 && getMemberType() != '1'){
		memId = memId.split("@")[0];
	}
	
	var fromMPS = getCookie("MPS"); // 멜론 플레이어에서 왔는지 확인.
	var fromMPSYn = fromMPS == null || fromMPS.indexOf("MELONPLAYER") < 0;
	
	var gradeImg = "";
	var gradeName = "";
	var gradeImageUrl = "";
	
	try {
		gradeName = getGrade();
		gradeImageUrl = getGradeImageUrl();
		gradeImageUrl = gradeImageUrl.replace('http:','');
	
		if(gradeImageUrl != '') {
			gradeImg = "<span class=\"icon_grade\"><img src=\""
						+gradeImageUrl
						+"\" width=\"18\" height=\"18\" alt=\""
						+gradeName
						+"\" /></span>";
		}
		
		// 카카오연동확인
		if(getMemberType() == '1'){
			gradeImg += '<span class="icon_grade"><img src="//cdnimg.melon.co.kr/resource/image/web/common/icon_kakao.png" width="18" height="18" alt="kakao"></span>';
		}
	}
	catch (e) {
		
	}
	
	html = [
		'<div class="logout_wrap">',
		'<div class="mem_info">',
		'<strong><a href="https://member.melon.com/muid/web/help/myinfointro_inform.htm" class="id_area">'
			+ gradeImg
			+ memId
			+ '</a>님</strong>',
		'<a href="https://member.melon.com/muid/web/help/myinfointro_inform.htm" title="내정보" class="bg_none" ><span>내정보</span></a>',
		'<div class="mem_btn" id="d_facebook_mem_btn">',
		'</div>',
		fromMPSYn ? '<a href="javascript:MELON.WEBSVC.POC.login.gnbLogout();" onclick="MELON.WEBSVC.POC.login.gnbLogout();" title="로그아웃" class="btn_logout"><span>로그아웃</span></a>' : '',
		'</div>',
		getProdName() == "" ? '<span class="btn_buy"><a href="javascript:melon.menu.cm.goPamphlet();" title="이용권구매" >이용권구매</a></span>' : '',
		'<div class="mem_used">',
		'<strong class="product_name">'
			+prodName
			+'</strong>',
		'<ul>',
		'<li class="nth1">',
		'<a href="javascript:melon.link.goMyCupon();">',
		'<span><span class="label">쿠폰</span><span class="nm">'
			+getCouponCnt()
			+'</span></span>',
		'</a>',
		'</li>',
		'<li class="nth2">',
		'<a href="javascript:melon.link.goMelonCash();">',
		'<span><span class="label">캐쉬</span><span class="nm">'
			+getMelonCash().replace(/(\d)(?=(?:\d{3})+$)/g, "$1,")
			+'</span></span>',
		'</a>',
		'</li>',
		'<li class="nth3">',
		'<a href="javascript:melon.link.goPresentSong();">',
		'<span><span class="label">선물</span><span class="nm">'
			+getMemberGiftCnt()
			+'</span></span>',
		'</a>',
		'</li>',
		'</ul>',
		'</div>',
		'</div>'
	].join('');
			
	document.write(html);
	
	var facebookConnectYn = getFacebookConnectYn();
	
	// Cookie에 페이스북 연동 관련 값이 있으면 아래 ajax는 호출하지 않는다.
	if(facebookConnectYn == "" || typeof facebookConnectYn == "undefined") {
		try {
			$.ajax({
				url: "",
				type : 'GET',
			}).done(function(json) {
				facebookConnectYn = json.facebookConnectYn;
				
				var facebookConnection = "Y" != facebookConnectYn;
				printFacebookBtn(facebookConnection);
			}).fail(function() {
				printFacebookBtn(true);
			});
			
		} catch(e){
			printFacebookBtn(true);
		}
	}
	else {
		var facebookConnection = "Y" != facebookConnectYn;
		printFacebookBtn(facebookConnection);
	}
}
else {
	html = [
		'<div class="login_wrap" id="gnbLoginDiv">',
		'<div class="inbox">',
		'<fieldset>',
		'<legend>로그인 영역</legend>',
		'<div class="input_area">',
		'<input type="text" placeholder="아이디" name="memberId" class="text_id_main" title="아이디 입력 편집창" style="width:184px"'
			+(getCookie('saveId')?'value="'
			+getCookie('saveId')+'"':'')
			+' onkeypress="if(event.keyCode == 13){MELON.WEBSVC.POC.login.gnbLogin();}" />',
		'<input type="password" placeholder="비밀번호" name="memberPwd" title="비밀번호 입력 편집창" class="text_password_main" style="width:184px" onkeypress="if(event.keyCode == 13){MELON.WEBSVC.POC.login.gnbLogin();}" />',
		'<div class="save_id"><input type="checkbox" name="saveId" id="id_save01"'
			+(getCookie('saveId')?'checked="checked"':'')
			+' class="" /><label for="id_save01">아이디 저장</label></div>',
		'<button type="button" class="btn_main_login" title="로그인" onclick="if(event.keyCode != 13){MELON.WEBSVC.POC.login.gnbLogin();}" onkeypress="if(event.keyCode == 13){MELON.WEBSVC.POC.login.gnbLogin();}"><span class="odd_span"><span class="even_span">로그인</span></span></button>',
		'</div>',
		'<div class="main_kakao_login"><a href="javascript:MELON.WEBSVC.POC.login.menuLogin();">카카오 로그인</a></div>',
		'<div class="wrap_member">',
		'<a href="javascript:MELON.WEBSVC.POC.link.goIdSearch();" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a><a href="javascript:MELON.WEBSVC.POC.link.goJoin();" title="회원가입">회원가입</a>',
		'</div>',
		'</fieldset>',
		'</div>',
		'</div>'
	].join('');
	
	document.write(html);
}
	
function  printFacebookBtn(facebookConnection) {
	var btnHtml = facebookConnection ? '<button type="button" class="btn_info sns_facebook" title="페이스북 연동하기" onclick="goConnectSns();"><span>페이스북 연동하기</span></button>' : '<button type="button" class="btn_info sns_facebook" title="페이스북 해제하기" onclick="goConnectSns();"><span class="cancel">페이스북 해제하기</span></button>';
	$('#d_facebook_mem_btn').html(btnHtml);
}