/* 가수 번호 입력 시 가수 이름 출력 */
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