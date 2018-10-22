$(function() {
	/*------------------------------------------*/
	/*               활동년대 체크 박스                            */
	/*------------------------------------------*/
	// #all_check 요소의 상태가 변한 경우
	$("#aca_active_years_all_check").change(function() {
		// 전체선택 체크박스의 체크상태 판별
		var is_check = $(this).is(":checked");
		
		// 하위 체크박스에 체크상태 적용
		$(".aca_active_years_check").prop("checked", is_check);
	});
});