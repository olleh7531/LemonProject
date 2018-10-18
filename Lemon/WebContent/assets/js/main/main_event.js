// http://godlvkhj.tistory.com/60
// http://gpresss.tistory.com/19

$(document).ready(function() {
	var mySlider = $('.event_list').bxSlider({
		mode : 'horizontal',// 가로 방향 수평 슬라이드
		speed : 1000, // 이동 속도를 설정
		pager : true, // 현재 위치 페이징 표시 여부 설정
		moveSlides : 1, // 슬라이드 이동시 개수
		slideWidth : 236, // 슬라이드 너비
		minSlides : 1, // 최소 노출 개수
		maxSlides : 1, // 최대 노출 개수
		// slideMargin : 5, // 슬라이드간의 간격
		auto : true, // 자동 실행 여부
		autoHover : true, // 마우스 오버시 정지 여부
		controls : false, // 이전 / 다음 버튼 노출 여부
		autoControls : true, // 시작 / 중지 컨트롤
		adaptiveHeight: false, // 높이에 따라 반응
		responsive : true // 자동 크기 조절 활성화, 고정 너비 슬라이더 사용하는 경우 유용
	});
});