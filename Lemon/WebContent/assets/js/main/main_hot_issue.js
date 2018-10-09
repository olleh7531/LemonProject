var slideIndex = 1;

showHotIssue(slideIndex);

function plusHotIssue(n) {
	showHotIssue(slideIndex += n);
}

function showHotIssue(n) {
	var i;
	var x = document.getElementsByClassName("btn_hot_issue");
	
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