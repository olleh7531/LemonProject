
$(document).ready(function(){
   $('.btn_new_album').each(function(){
      $(this).find('li').each(function(){
         $(this).hover(function() {
            $(this).find(".overlay").css('display','block');
            $(this).find('.singer').css('display','none');
         }, function() { // 차트에 마우스 오버가 아닌 경우
            $(this).find(".overlay").css('display','none');
            $(this).find('.singer').css('display','block');
            });
      });
   });
});

var slideIndex = 1;

showNewAlbum(slideIndex);

function plusNewAlbum(n) {
	showNewAlbum(slideIndex += n);
}

function showNewAlbum(n) {
	var i;
	var x = document.getElementsByClassName("btn_new_album");
	
	if (n > x.length) {
		slideIndex = 1
	}
	
	if (n < 1) {
		slideIndex = x.length
	}
	
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";  
	}
	
	x[slideIndex-1].style.display = "block";  
}