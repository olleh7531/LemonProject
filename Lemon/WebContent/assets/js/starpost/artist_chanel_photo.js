// 포토 글 쓸 때 가수 번호 입력 시 가수 이름 출력
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

// 사진 리스트 뿌려주고 사진 선택 시 선택한 사진 내용 가져올 때
function photo_content() {
	$.ajax({
		type : "post", // method = "post" 방식으로 출력
		url : "./ArtistChanel.ac", // 아티스트 채널 포토 jsp 파일 주소 불러오기
		dataType : 'json',
		data : {
			// 변수 : "" -> ajax 변수명 
			// photo_content_ajax 일 때만 내용 보이게 한다
			photo_content_ajax : "photo_content_ajax",
			
			// 포토 번호 num : ar_num
			ar_num : $('#ar_num').find('img').attr('title'),
			
			// 아티스트 번호 : si_num
			artist : $('#artist').val(), // .val() 문자
		},
		success : function(data) { // data 가져오는 것이 성공하였을 때
			// 사진 리스트 지운다(안 보이게함)
			$('.photo_list_div').empty();
			
			// 사진 리스트 선택 시 선택한 사진 내용 뿌려준다
			$(data).each(function(index) {
				var content = "";				
				
				if(index == 0) {
					/*----------------------------------*/
					/*　　　　　　　　　포토 내용 보기　　　　　　　 */
					/*----------------------------------*/
					// 영역
					content += '<!-- 포토 리스트 -->';
					content += '<div class="section_photo ">';
					
					
					// 포토 현재 개수 / 전체 개수 영역
					content += '';
					content += '<div class="sort_info clfix">';
					
					// 포토 현재 개수 / 전체 개수
					content += '<div class="wrap_sort fl_left">';
					content += '<p class="photo_count">';
					content += '<strong>1</strong>/';
					content += '<em id="totCnt">239</em>';
					content += '</p>';
					content += '</div>';
					
					// 전체 목록 보기
					content += '<div class="fl_right">';
					content += '<a href="" title="전체 목록보기" class="btn btn_big short">';
					content += '<span class="odd_span">';
					content += '<span class="even_span">전체 목록보기</span>';
					content += '</span>';
					content += '</a>';
					content += '</div>';
					
					// 포토 현재 개수 / 전체 개수 / 전체 목록 보기 영역 끝
					content += '</div>';
					
					
					/*----------------------------------*/
					/*　　　　　　　　 　포토 슬라이더　　　　　　　 */
					/*----------------------------------*/
					
					// 영역
					content += '<div class="photo_list02">';
					content += '<ul id="photo_slider">';
					
					
					
					// 뿌려주기 종료
					content += '</ul>';
					
					// 이전 버튼
					content += '<button type="button" title="이전" class="btn_photo_pre disabled" disabled="disabled">';
					content += '<span class="odd_span">';
					content += '<span class="even_span">이전</span>';
					content += '</span>';
					content += '</button>';
					
					// 다음 버튼
					content += '<button type="button" title="다음" class="btn_photo_next"">';
					content += '<span class="odd_span">';
					content += '<span class="even_span">다음</span>';
					content += '</span>';
					content += '</button>';
					
					// 영역 종료
					content += '</div>';
					
					
					/*----------------------------------*/
					/*　　　　　슬라이더 선택한 사진 내용 보기 　　　 */
					/*----------------------------------*/
					
					// 내용 + 댓글 영역
					content += '<div class="photo_detail_view">';
					
					
					// 내용 영역
					content += '<div class="photo_detail_list_ajax d_photo_list">';
					
					
					content += '<div class="photo_detail_list">';
					
					// 이미지 확대보기
					content += '<div class="photo_detail_image">';
					content += '<a href="" title="이미지 확대보기" class="thumb">';
					content += '<span class="wrap_vertical"></span>';
					content += '<img id="photoViewLayer" src="./upload/starpost/singerPhoto/' + this.ar_photo + '" alt="">';
					content += '<span class="icon_viewlk_image"></span>';
					content += '</a>';
					content += '</div>';
					
					
					// 좋아요 / 조회수 / 내용 / 등록일 / 리뷰 영역
					content += '<div class="photo_detail_info">';
					
					// 좋아요 / 조회수
					content += '<div class="photo_info_view">';
					
					
					// class="on" 추가시 활성
					content += '<a class="btn_like_big d_btn" title="[D-1] 10주년 투어콘서트 <이 지금 dlwlrma> Teaser Poster #5 좋아요" href="">';
					content += '<span class="icon">좋아요</span>';
					content += '<strong class="none">총건수</strong> 2536'
					content += '</a>';
					content += '<em class="bar">|</em>';
					content += '<span class="cnt_view">조회 ';
					content += '<strong>' + this.ar_readcount + '</strong>';
					content += '</span>';
					content += '</div>';
					
					// 사진 내용
					content += '<div class="photo_info_text">';
					content += this.ar_content;
					content += '</div>';
					
					// 등록일 / 리뷰
					content += '<div class="photo_info_btm">';
					content += '<p class="date">';
					content += '<span>등록일</span>';
					content += '<strong>' + this.ar_registerdate + '</strong>';
					content += '</p>';
					content += '<p class="review">';
					content += '<span>리뷰</span> ';
					content += '<strong>';
					content += '<a href="">29</a>개';
					content += '</strong>';
					content += '</p>';
					content += '</div>';
					
					// 좋아요 / 조회수 / 내용 / 등록일 / 리뷰 영역 종료
					content += '</div>';
					
					// 사진 내용 종료
					content += '</div>';
					
					/*----------------------------------*/
					/*　　　　　　　　　　　　댓글 　　　 　　　　　　*/
					/*----------------------------------*/
					// content += '';
					
					/*----------------------------------*/
					/*　　　　　　　　　　　　종료 　　　 　　　　　　*/
					/*----------------------------------*/
					// 사진 내용 종료
					content += '</div>';
					
					// 사진 내용 종료
					content += '</div>';
					
					// 사진 내용 종료
					content += '</div>';
					
					// 사진 내용 종료
					content += '</div>';
					
					$('.photo_list_div').append(content);
				}
				else if(index < 9) {
					// 사진 반복 뿌려주기 ( 8개 )
					// 현재 보고 있는 사진 class = "on" (1개)
					content += '<li class="on photo_content_bxslider">';
					content += '<div class="thumb_wrap">';
					content += '<a href="" class="thumb" title="">';
					content += '<img src="./upload/starpost/singerPhoto/' + this.ar_photo + '" alt="아티스트">';
					content += '<span class="wrap_vertical"></span>';
					content += '<span class="bor"></span>';
					content += '</a>';
					content += '</div>';
					content += '</li>';
					
					// 포토 리스트 class = ex_height 확인하기
					// 반복 뿌려주기(7개)
					/*content += '<li class="">';
					content += '<div class="thumb_wrap">';
					content += '<a href="" class="thumb ex_height" title="">';
					content += '<img src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/49/457/80049457_1000.jpg/melon/resize/104/quality/80/optimize" alt="아티스트">';
					content += '<span class="wrap_vertical"></span>';
					content += '<span class="bor"></span>';
					content += '</a>';
					content += '</div>';
					content += '</li>';*/
					
					$('#photo_slider').append(content);
				}
			});
		},
		error : function(xhr, status, error) { // 에러났을 때
			alert("error : " + error);
		}
	});
}

// 사진 슬라이더 선택 후 밑에 사진 내용 뿌려주기
/*$('.photo_content_bxslider').bxSlider({
  buildPager: function(slideIndex){
    switch(slideIndex){
      case 0:
        return '<img src="/images/thumbs/tree_root.jpg">';
      case 1:
        return '<img src="/images/thumbs/houses.jpg">';
      case 2:
        return '<img src="/images/thumbs/hill_fence.jpg">';
      case 3:
          return '<img src="/images/thumbs/hill_fence.jpg">';
      case 4:
          return '<img src="/images/thumbs/hill_fence.jpg">';
      case 5:
          return '<img src="/images/thumbs/hill_fence.jpg">';
      case 6:
          return '<img src="/images/thumbs/hill_fence.jpg">';
      case 7:
          return '<img src="/images/thumbs/hill_fence.jpg">';
      case 8:
          return '<img src="/images/thumbs/hill_fence.jpg">';
    }
  }
});*/