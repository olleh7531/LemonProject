$(document).ready(function() {
	$(".wrap_chart_tab").each(function() {
		var tab = $(this).children("ul");
		var tabBtn = tab.children("li").children("a");
		var content = tabBtn.nextAll();

		// 탭버튼을 클릭했을때
		tabBtn.click(function() {
			// 이미 on 상태면 pass
			if ($(this).hasClass("on"))
				return;

			// 모든 컨텐츠 부분을 안보이게 한뒤
			content.hide();

			// 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
			$(this).nextAll().show();

			// 모든탭 버튼에 있던 on 클래스를 빼고
			tabBtn.removeClass("on");
			
			// 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
			$(this).addClass("on");

			// 탭버튼를 쭉 돌면서 on 클래스가 있는 버튼만 on 색상으로 바꾸고
			// 나머지 버튼들은 off 색상로 바꾼다.
			tabBtn.each(function() {
				/*
				 * var src; var img = $(this).chialdren("img");
				 * 
				 * if ($(this).hasClass("on")) {
				 * 		src = img.attr("src").replace("_off.", "_on.");
				 * }
				 * else {
				 * 		src = img.attr("src").replace("_on.", "_off.");
				 * }
				 * 
				 * img.attr("src", src);
				 */
				
				 var src;
				 var menu_span = $(this).chialdren("span");
				 
				 if ($(this).hasClass("on")) {
				  		$("#tab_link").css("position", "absolute");
				  		$("#tab_link").css("z-index", "1");
				  		$("#tab_link").css("margin-top", "-1px");
				  		$("#tab_link").css("padding-top", "7px");
				  		$("#tab_link").css("border-top", "2px solid #EDAE06");
				  		$("#chart_tab_span").css("color", "#EDAE06");
				  		$("#chart_tab_span").css("font-weight", "bold");
				 }
				 else {
				  		// src = img.attr("src").replace("_on.", "_off.");
				 }
				 
				 menu_span.attr("class", $("#tab_link"));
			});
		});

		// 맨 첫번째 탭버튼 클릭처리
		tabBtn.eq(0).click();
	});
});