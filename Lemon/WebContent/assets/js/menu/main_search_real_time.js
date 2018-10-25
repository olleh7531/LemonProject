function layerControl_over() {
	var f1 = document.getElementById("layer1").style;
	var f2 = document.getElementById("layer2").style;
	
	f2.display = '';
	f1.display = 'none';
}

function layerControl_out() {
	var f1 = document.getElementById("layer1").style;
	var f2 = document.getElementById("layer2").style;
	
	f2.display = 'none';
	f1.display = '';
}