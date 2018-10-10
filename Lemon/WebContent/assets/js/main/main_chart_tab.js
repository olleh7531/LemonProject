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
				/*var src;
				var img = $(this).chialdren("img");
				
				if ($(this).hasClass("on")) {
					src = img.attr("src").replace("_off.", "_on.");
				} else {
					src = img.attr("src").replace("_on.", "_off.");
				}

				img.attr("src", src);*/
				
				/* 탭 클릭하였을 때 
				li.on a.tab_link {
					position: absolute;
					z-index: 1;
					margin-top: -1px;
					padding-top: 7px;
					border-top: 2px solid #EDAE06;
				}

				 차트 이름 
				a.tab_link.realtime {
					top: 0;
					left: 0;
					cursor: pointer;
				}

				a.tab_link.realtime span {
					display: inline-block;
					height: 14px;
					width: 50px;
				}

				a.tab_link.pop {
					position: absolute;
					top: 0;
					left: 93px;
					cursor: pointer;
				}

				a.tab_link.pop span {
					display: inline-block;
					height: 14px;
					width: 25px;
				}

				a.tab_link.artist {
					position: absolute;
					top: 0;
					left: 186px;
					cursor: pointer;
				}

				a.tab_link.artist span {
					display: inline-block;
					height: 14px;
					width: 62px;
				}

				 탭 클릭 글자 색상 
				li.on a.tab_link.realtime span {
					color: #EDAE06;
					font-weight: bold;
				}

				li.on a.tab_link.pop span {
					color: #EDAE06;
					font-weight: bold;
				}

				li.on a.tab_link.artist span {
					color: #EDAE06;
					font-weight: bold;
				}

				.chart .list_wrap {
					display: none;
					width: 278px;
					position: absolute;
					top: 28px;
					left: 0;
					border: 1px solid #dfe6e8;
					border-width: 0 1px;
				}

				.chart li.on div.list_wrap {
					display: block;
				}*/
				
				var span;
				var sapn_color = $(this).chialdren("img");
				
				if ($(this).hasClass("on")) {
					span = sapn_color.attr("src").replace("_off.", "_on.");
				} else {
					span = sapn_color.attr("src").replace("_on.", "_off.");
				}

				sapn_color.attr("src", src);
			});
		});

		// 맨 첫번째 탭버튼 클릭처리
		tabBtn.eq(0).click();
	});
});