<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="./assets/js/jquery.tablednd.js"></script>

	<script type="text/javascript">
    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 1000;
 
    $(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            $(this).css('border', '4px dashed #eeb024');
//             dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
//             dropZone.css('background-color','#FFFFFF');
            $(this).css('border', '4px solid #eeb024');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
//             dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
//             dropZone.css('background-color','#FFFFFF');
            $(this).css('border', '4px solid #eeb024');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(fileObject){
        var files = null;
 
        if(fileObject != null){
            // 파일 Drag 이용하여 등록시
            files = fileObject;
        }else{
            // 직접 파일 등록시
            files = $('#multipaartFileList_' + fileIndex)[0].files;
        }
        
        // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
                // 파일 이름
                var fileName = files[i].name;
                
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
                var fileSize = files[i].size/1024/1024;
                fileSize = fileSize.toFixed(2);
                
                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                    // 확장자 체크
                    alert("등록 불가 확장자");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize += fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    //alert(fileList[fileIndex].name);
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize);
 
                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
    	
    
    	var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";;
        html += "    <td class='musicfile' >";
        html +=         fileName + " / " + fileSize + "MB "  + "<button onclick='deleteFile(" + fIndex + "); return false;' class='btn'><svg class='octicon octicon-x' viewBox='0 0 12 16' version='1.1' width='12' height='16' aria-hidden='true'><path fill-rule='evenodd' d='M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z'></path></svg></button>";
        html += "    </td>";
        html += "</tr>";


 		
        $('#m_upload_table').append(html);
	    $("#m_upload_table").tableDnD();
		$('input[name=album_num]').on('keyup', function(e) {
			var trackn_classname = $(this).parent().next().find('input[name=track_num]').attr('class');
			if((e.keyCode == 8||e.keyCode == 46)&&$(this).val()==""){
			$(this).parent().next().find('input[name=track_num]').val("");
			}else{
			var albumn_val = $(this).val();
			  $(this).parent().next().find('input[name=track_num]').attr('class',albumn_val);
			$('.'+albumn_val+'').each(function(index){
				$(this).val(index+1);
			});
			if(trackn_classname!="track_num"){
				$('.'+trackn_classname+'').each(function(index){
				$(this).val(index+1);
			});
					}
			}
			});


    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];
        
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
 
    // 파일 등록
    function uploadFile(){
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);

        // 파일이 있는지 체크
        if(uploadFileList.length == 0){
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }
        
        // 용량을 500MB를 넘을 경우 업로드 불가
        if(totalFileSize > maxUploadSize){
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }
            
        if(confirm("등록 하시겠습니까?")){
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm');
            var formData = new FormData(form);
      
            for(var i = 0; i < uploadFileList.length; i++){
                
            	var filesName = 'musicfile'+i;
            	formData.append(filesName, fileList[uploadFileList[i]]);
            }
            
/* 			var num;
             $('input[name=album_num]').each(function(index){
            	var infor = $(this).val();
            	 infor = infor +','+$(this).parent().next().find('input[name=track_num]').val();
            	 infor = infor +','+$(this).parent().next().next().find('input[name=music_name]').val();
            	 infor = infor +','+$(this).parent().next().next().next().find('input[name=singer_name]').val();
            	 infor = infor +','+$(this).parent().next().next().next().next().find('textarea[name=lyrics]').val();
			num='musicinfor'+index;
            	formData.append(num , infor);
            });  */
            
            $.ajax({
            	url:"./MusicUploadAction.ams",
                data:formData,
                type:'POST',
                enctype:'multipart/form-data',
                processData:false,
                contentType:false,
                dataType:'json',
                cache:false,
                success:function(result){
                    if(result == 1){
                        alert("성공");
                        location.reload();
                    }else{
                        alert("실패");
                        location.reload();
                    }
                }
            });
        }
    }






</script>
	<link rel="stylesheet" type="text/css" href="./assets/css/board/musicUpload.css" />
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"> <!-- 메인 / 메뉴 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
	<link rel="shortcut icon" href="./assets/img/common/favicon.png">

	<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/menu.jsp"/>
<!-- 헤더 -->
<!-- 본문 -->
	<form name="uploadForm" id="uploadForm" enctype="multipart/form-data"
		method="post">
					<div id="dropZone">파일을 드래그 하세요</div>
				<div id="m_upload_box"> 
		<div class="music_div">파일이름 / 크기(MB)</div>
		 </div>
		<table id="m_upload_table">
		
		</table>
	</form>
	<a href="#" onclick="uploadFile(); return false;" class="btn bg_01">파일 업로드</a>
<!-- 본문 -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>