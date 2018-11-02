// 이용약관 동의 체크
function chkAgree() {
	var userTermsAgree = document.getElementById("userTermsAgree");
	var privacyTermsAgree = document.getElementById("privacyTermsAgree");
				
	if(userTermsAgree.checked == true){
		if(privacyTermsAgree.checked == true){
			return true
		}
		alert("개인정보 약관을 확인해주세요");
		return false;
	}
	alert("이용약관을 확인해주세요");				
	return false;
}