// 가수 번호 입력 시 가수 이름 출력
function singerNumCheck() {
	$.ajax({
		// method = "post" 방식으로 출력
		type : "POST",
		
		// 가수 번호 체크하는 jsp 파일
		url : "./ArtistChanelPhotoWrtieCheckAction.ac",
	
		// <input type="text" name="singer_photo_singer_num" class="singer_photo_singer_num">
		// 값 불러와서 inputSingerNum에 대입
		data : {
			inputSingerNum : $('.singer_photo_singer_num').val()
		},
		
		// data 가져오는 것이 성공하였을 때
		success : function(data) {
			alert(data);
			// 가수 이름에 값 입력
			// <input type="text" name="singer_photo_singer_name" class="singer_photo_singer_name">
			$('.singer_photo_singer_name').val(data);
		},
		
		// 에러났을 때
		error : function(xhr, status, error) {
			alert("error : " + error);
		}
	});
}

// 사진 리스트 뿌려주고 내용 가져올 때
function photo_content() {
	$.ajax({
		type : "post", // method = "post" 방식으로 출력
		url : "./ArtistChanel.ac", // 아티스트 채널 포토 jsp 파일 주소 불러오기
		// dataType : 'json',
		data : {
			// <input type="text" id="id"> 값 불러와서 inputID에 대입 
			// 변수 : "" -> ajax 변수명 
			// .val() 문자
			// 포토 번호 num
			ar_num : "ar_num",
			
			// 아티스트 번호
			ar_singer_num : "ar_singer_num",
		},
		success : function(data) { // data 가져오는 것이 성공하였을 때
			// 사진 리스트 지우고 내용 뿌려준다
			$('.section_photo').empty();
			
			$(data).each(function(index) {
				var content = "";
				
				if(data.length-1 != index) {
					
				}
			});
		},
		error : function(xhr, status, error) { // 에러났을 때
			alert("error : " + error);
		}
	});
}