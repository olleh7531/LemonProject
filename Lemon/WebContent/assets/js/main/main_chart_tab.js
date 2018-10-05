 $(document).ready(function() {
   $(".chart_tab li").click(function() {
     var list = $(this).index();
     
     $(".chart_tab li").removeClass("on");
     
     $(this).addClass("on");

     $(".chart_tab_content > li").hide();
     
     $(".chart_tab_content > li").eq(list).show();
   });
 });