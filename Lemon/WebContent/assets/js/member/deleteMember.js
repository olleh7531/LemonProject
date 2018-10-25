// 이용약관 동의 체크
function memberOut() {
	var isOutAgree = document.getElementById("isOutAgree");

	if(isOutAgree.checked == true){
		var chkMemDel = confirm('확인을 누르시면 탈퇴가 완료됩니다.');
		
		if(chkMemDel == true){	
			return true;
		}
	}else{
		alert('안내사항을 확인하셨다면 동의해주세요.');
		return false;
	}
		
	return false;
}