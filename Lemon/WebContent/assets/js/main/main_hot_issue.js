$(document).ready(function() {
	var mySlider = $('.hot_issue_bxslider').bxSlider({
		mode : 'horizontal',// 가로 방향 수평 슬라이드
		speed : 1000, // 이동 속도를 설정
		pager : false, // 현재 위치 페이징 표시 여부 설정
		// moveSlides : 1, // 슬라이드 이동시 개수 //슬라이드가 한번에 몇 개씩 움직이는지 여부
		// slideWidth : 223, // 슬라이드 너비
		minSlides : 12, // 최소 노출 개수
		maxSlides : 12, // 최대 노출 개수
		// slideMargin : 5, // 슬라이드간의 간격
		auto : false, // 자동 실행 여부
		autoHover : true, // 마우스 오버시 정지 여부
		controls : false, // 이전 / 다음 버튼 노출 여부
		autoControls : false, // 시작 / 중지 컨트롤
		adaptiveHeight: false, // 높이에 따라 반응
		responsive : false // 자동 크기 조절 활성화, 고정 너비 슬라이더 사용하는 경우 유용
	});

	// 이전 버튼을 클릭하면 이전 슬라이드로 전환
	$('.btn_pre').on('click', function() {
		mySlider.goToPrevSlide(); // 이전 슬라이드 배너로 이동
		return false; // <a>에 링크 차단
	});

	// 다음 버튼을 클릭하면 다음 슬라이드로 전환
	$('.btn_next').on('click', function() {
		mySlider.goToNextSlide(); // 다음 슬라이드 배너로 이동
		return false;
	});
});