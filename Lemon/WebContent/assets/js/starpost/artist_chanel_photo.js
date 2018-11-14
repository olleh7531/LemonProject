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
			ar_num : this.ar_num,
			
			// 아티스트 번호
			ar_singer_num : this.ar_singer_num,
		},
		success : function(data) { // data 가져오는 것이 성공하였을 때
			// 사진 리스트 지우고 내용 뿌려준다
			$('.section_photo .d_photo_list').empty();
			
			$(data).each(function(index) {
				var content = "";
				
				
				
				text+='<div><b>'+this.music_name+'</b></div>';
				text+='<div style="    display: block;';
				text+='	margin-bottom: 4px;';
				text+='	white-space: nowrap;';
				text+='	text-overflow: ellipsis;';
				text+='	overflow: hidden;">'+this.lyrics+'</div>';
				text+='<div>| '+this.al_name+'</div>';
				text+='<hr>';
				$('#section_photo').append(text);
				
				
				
				if(data.length-1 != index) {
					/*----------------------------------*/
					/*　　　　　　　　　포토 내용 보기　　　　　　　 */
					/*----------------------------------*/
					// 영역
					content += '<div class="section_photo">';
					
					// 포토 현재 개수 / 전체 개수 영역
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
					content += '<ul>';
					
					// 사진 반복 뿌려주기
					// 현재 보고 있는 사진 class = "on"
					content += '<li class="on">';
					content += '<div class="thumb_wrap">';
					content += '<a href="" class="thumb" title="">';
					content += '<img src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/50/258/80050258_1000.jpg/melon/resize/104/quality/80/optimize" alt="아티스트">';
					content += '<span class="wrap_vertical"></span>';
					content += '<span class="bor"></span>';
					content += '</a>';
					content += '</div>';
					content += '</li>';
					
					// 포토 리스트 class = ex_height 확인하기
					// 반복 뿌려주기
					content += '<li class="">';
					content += '<div class="thumb_wrap">';
					content += '<a href="" class="thumb ex_height" title="">';
					content += '<img src="https://cdnimg.melon.co.kr/cm/photo/images/000/800/49/457/80049457_1000.jpg/melon/resize/104/quality/80/optimize" alt="아티스트">';
					content += '<span class="wrap_vertical"></span>';
					content += '<span class="bor"></span>';
					content += '</a>';
					content += '</div>';
					content += '</li>';
					
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
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					content += '';
					
					// 댓글
					content += '';
					
					$('.section_photo .d_photo_list').append(content);
				}
			});
		},
		error : function(xhr, status, error) { // 에러났을 때
			alert("error : " + error);
		}
	});
}