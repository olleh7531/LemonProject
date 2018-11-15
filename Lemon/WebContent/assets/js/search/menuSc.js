	/* 메뉴 관련 */
	$(function() {
		$('#menuSc div').click(function() {
			$('#menuSc div').removeClass('current');
			$(this).addClass('current');s
		})
	});
	
	$(function() {
		$('#tabSc li').click(function() {
			$('#tabSc li').removeClass('tcurrent');
			$(this).addClass('tcurrent');
		})
	});