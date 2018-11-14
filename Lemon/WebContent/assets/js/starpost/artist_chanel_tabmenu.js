// 탭 클릭 후 새로고침 하였을 때 기존 탭 내용 가져오기 & 탭 클릭 시 색상 바꾸기
$(function() {
	// index 값 0으로 초기화
	var index = 0;
	
	// 쿠키에 저장된 index값이 있다면 가져온다
	if($.cookie("index")) {
		index = $.cookie("index");
	}
	
	// .tab_content요소를 모두 숨긴 후 index에 해당하는 요소만 보이게 한다.
	$(".tab_content").hide().eq(index).show();
	
	// .artist_chanel_tab li 자식 요소 li 중 index에 해당하는 요소에
	// on 클래스 추가하고 on css 추가
	$(".artist_chanel_tab li").eq(index).addClass("on");
	 
	$('ul.artist_chanel_tab li').click(function() {
		$('ul.artist_chanel_tab li').removeClass('on');
		// $('.tab_content').removeClass('current');
		
		// 색상 변경
		// $('.artist_chanel_tab li').removeClass("on");
		$(this).addClass("on");
		
		$(".tab_content").hide()
		
		var activeTab = $(this).attr('data-tab');
		
		$('#' + activeTab).fadeIn();
		
		// 현재 활성화된 탭의 index값을 index 변수에 저장
		// 쿠키 유효기간은 30일
		$.cookie("index", $(this).index(), {
			expires:30
		});
	})
});