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