$(document).ready(function() {
	$(".wrap_chart_tab").each(function() {
		var tab = $(this).children("ul");
		var tabBtn = tab.children("li").children("a");
		var content = tabBtn.nextAll();

		// 탭버튼을 클릭했을때
		tabBtn.click(function() {
			// 이미 on 상태면 pass
			if ($(this).hasClass("tab_on"))
				return;

			// 모든 컨텐츠 부분을 안보이게 한뒤
			content.hide();

			// 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
			$(this).nextAll().show();

			// 모든탭 버튼에 있던 on 클래스를 빼고
			tabBtn.removeClass("tab_on");

			// 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
			$(this).addClass("tab_on");
		});

		// 맨 첫번째 탭버튼 클릭처리
		tabBtn.eq(0).click();
	});

	// 차트 1위 자동으로 active 효과주기
	$(".chart .list_wrap li:FIRST-CHILD").addClass("active");
	
	// 차트에 마우스 오버인 경우
	$(".rank_item").hover(function() {
		$(".chart .list_wrap li:FIRST-CHILD").removeClass("active");
		$(this).addClass("active");
	}, function() { // 차트에 마우스 오버가 아닌 경우
		$(this).removeClass("active");
		$(".chart .list_wrap li:FIRST-CHILD").addClass("active");
		}
	);
});