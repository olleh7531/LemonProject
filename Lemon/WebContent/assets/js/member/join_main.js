function frmCheck() {
	/* 한 개씩 클릭시 */
	
	if ($("#userTermsAgree").is(":checked") == false) {
		alert("이용약관에 동의하셔야 합니다.");
		$("#userTermsAgree").focus();
		return;
	}
	if ($("#privacyTermsAgree").is(":checked") == false) {
		alert("개인정보 수집 및 이용에 대한 안내에 동의합니다.");
		$("#privacyTermsAgree").focus();
		return;
	}
	if ($("#mailTermsAgree").is(":checked") == false) {
		alert("레몬 소식, 이벤트 등 홍보/알림 메일 수신에 동의합니다.");
		$("#mailTermsAgree").focus();
		return;
	}
	if ($("#bugsprivacyTermsAgree").is(":checked") == false) {
		alert("레몬 홍보성 개인정보 수집/이용에 동의합니다.");
		$("#bugsprivacyTermsAgree").focus();
		return;
	}
	if ($("#bugsInfoTermsAgree").is(":checked") == false) {
		alert("레몬 홍보성 제3자 정보 제공에 동의합니다.");
		$("#bugsInfoTermsAgree").focus();
		return;
	}

//	$("#frm").attr("action", "../../jsp/member/join.jsp");
//	$("#frm").submit();
}