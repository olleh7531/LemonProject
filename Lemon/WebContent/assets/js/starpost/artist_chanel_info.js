$(function() {
	/*------------------------------------------*/
	/*                 데뷔날짜                                      */
	/*------------------------------------------*/
	var calendarFrom = {
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ], // 월 이름
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ], //
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		prevText : '이전 달', // prev 아이콘의 툴팁.
		nextText : '다음 달', // next 아이콘의 툴팁.
		currentText: '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
		// tepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		weekHeader : 'Wk',
		dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		autoSize : false, // 오토리사이즈(body등 상위태그의 설정에 따른다)
		changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시
		changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시
		showMonthAfterYear : true, // 년 뒤에 월 표시
		buttonImageOnly : true, // 버튼에 있는 이미지만 표시
		buttonText : '달력선택', // 버튼 텍스트 표시
		buttonImage : 'assets/img/artistChanel/calendar_btn.gif', // 버튼 이미지
		showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시
		closeText: '닫기',  // 닫기 버튼 패널
		showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		showAnimation: "Drop", //애니메이션을 적용
		showOtherMonths: true, // 다른 달 보여줌
		selectOtherMonths: true, // 다른 달 선택 가능
		yearRange : '1990:2020' // 1990년부터 2020년까지
	};

	$(".singer_debut_day").datepicker(calendarFrom);

	// 이미지버튼
	$("img.ui-datepicker-trigger").attr("style",
			"margin-left:5px; vertical-align:middle; cursor:pointer;");

	// style적용
	$("#ui-datepicker-div").hide(); // 자동으로 생성되는 div객체 숨김

	/*------------------------------------------*/
	/*                   생일                                        */
	/*------------------------------------------*/
	var calendarFrom = {
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ], // 월 이름
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ], //
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		prevText : '이전 달', // prev 아이콘의 툴팁.
		nextText : '다음 달', // next 아이콘의 툴팁.
		currentText: '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
		tepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		weekHeader : 'Wk',
		dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		autoSize : false, // 오토리사이즈(body등 상위태그의 설정에 따른다)
		changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시
		changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시
		showMonthAfterYear : true, // 년 뒤에 월 표시
		buttonImageOnly : true, // 버튼에 있는 이미지만 표시
		buttonText : '달력선택', // 버튼 텍스트 표시
		buttonImage : 'assets/img/artistChanel/calendar_btn.gif', // 버튼 이미지
		showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시
		closeText: '닫기',  // 닫기 버튼 패널
		showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		showAnimation: "Drop", //애니메이션을 적용
		showOtherMonths: true, // 다른 달 보여줌
		selectOtherMonths: true, // 다른 달 선택 가능
		yearRange : '1990:2020' // 1990년부터 2020년까지
		// 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시
		// numberOfMonths: [1,1],
	};

	$(".singer_birth").datepicker(calendarFrom);

	// 이미지버튼
	$("img.ui-datepicker-trigger").attr("style",
			"margin-left:5px; vertical-align:middle; cursor:pointer;");

	// style적용
	$("#ui-datepicker-div").hide(); // 자동으로 생성되는 div객체 숨김
	
	/*------------------------------------------*/
	/*                노래 장르 체크 박스                          */
	/*------------------------------------------*/
	// #all_check 요소의 상태가 변한 경우
	$("#singer_song_genres_all_check").change(function() {
		// 전체선택 체크박스의 체크상태 판별
		var is_check = $(this).is(":checked");

		// 하위 체크박스에 체크상태 적용
		$(".singer_song_genres_check").prop("checked", is_check);
	});

	/*------------------------------------------*/
	/*           솔로/그룹, 성별 셀렉트 박스                     */
	/*------------------------------------------*/
	$("input").focus(function() {
		idx = $("select option").index($("select option:selected"));
		if (idx == 0) {
			alert("재질을 선택하세요");
			$("select").focus();
		}
	});
});