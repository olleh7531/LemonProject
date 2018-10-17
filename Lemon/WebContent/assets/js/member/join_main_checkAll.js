/* 전체 선택 클릭시 모든 이용 약관 체크 */
/* 전체 선택에서 다른 체크박스 클릭시 전체 선택 해제 */
/* 전체 선택에서 다시 클릭시 모든 이용 약관 해제 */
function allCheck(obj) {
	/*$("#joinCheckAll").click(function() {
		$bChk = $(this).is(':checked');
		if (this.checked) {
			$(":checkbox").attr("checked", $bChk);
		} else {
			$(":checkbox").attr("checked", "");
		}
	});*/

	$("[name=joinCheck]").prop("checked", $(obj).prop("checked"));
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheck(obj) {
	var allObj = $("[name=joinCheckAll]");
	var objName = $(obj).attr("name");

	if ($(obj).prop("checked")) {
		checkBoxLength = $("[name=" + objName + "]").length;
		checkedLength = $("[name=" + objName + "]:checked").length;

		if (checkBoxLength == checkedLength) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	} else {
		allObj.prop("checked", false);
	}
}

$(function() {
	$("[name=joinCheckAll]").click(function() {
		allCheck(this);
	});
	$("[name=joinCheck]").each(function() {
		$(this).click(function() {
			oneCheck($(this));
		});
	});
});