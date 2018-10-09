var slideIndex = 1;

showBanner(slideIndex);

function  plusBanner(n) {
	showBanner(slideIndex += n);
}

function showBanner(n) {
	var i;
	var x = document.getElementsByClassName("btn_banner");
	
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