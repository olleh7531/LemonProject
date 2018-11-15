function checkMusicList() {
	// alert("확인");
	var input_check = document.getElementsByName("input_check");
	// alert(input_check.length);
	for (var i = 0; i < input_check.length; i++) {
		if (input_check[i].checked == true) {
			// alert(input_check[i].value);
			$.ajax({
				type : "POST",
				url : "./UserCheckBoxPlaylist.ct",
				data : {
					mu_num : input_check[i].value
				},
				success : function(data) {
					if (data == 2) {
						alert("로그인 해주세요");
						return false;
					} else if (data == 1) {
						alert("노래가 있습니다.");
						return false;
					} else {
						alert('추가 되었습니다.');
					}
				}

			})
		}

	}
}

function goodMusic(num) {
	$.ajax({
		type : "POST",
		url : "./GoodMusicAction.go",
		data : {
			go_num : num
		},
		success : function(data) {
			if (data == 0) {
				alert("좋아요 반영되었습니다.");
				location.reload();
			} else if (data == 1) {
				alert("좋아요 취소되었습니다.");
				location.reload();
			}
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	})
}

function CheckMusicDownload() {
	var input_check = document.getElementsByName("input_check");
	var arrNumber;
	var saveList = [];

	for (var i = 0; i < input_check.length; i++) {
		if (input_check[i].checked == true) {
			saveList.push(input_check[i].value);
		}
	}
	
	$.ajax({
		type : "POST",
		url : "./file_down.ct", // file_down.java 페이지 이동
		data : {
			"mu_num" : saveList
		},
		success : function(file_name) {
			var MusicAddress = "./chart/file_downs.jsp?file_name=";
			location.href = MusicAddress+file_name;
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	})
}
