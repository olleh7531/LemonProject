$(function() {
	$('.artist_chanel_tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		
		$('.artist_chanel_tab li').removeClass('current');
		$('.tab_content').removeClass('current');
		
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
		
		// 색상 변경
		$('.artist_chanel_tab li').removeClass("on");
		$(this).addClass("on");
	})
});