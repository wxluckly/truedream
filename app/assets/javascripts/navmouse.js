$(function(){
	function navMouse(){
		$(".nav-ul li a").mouseover(function(){
			var navW = $(this).find('span').width();
			var emW = Math.floor(navW);
			$(this).find('em').css({"display":"inline-block","min-width":emW+"px","_width":emW+"px"});
			$(this).find('span').hide().next('em').show();
		});
		$(".nav-ul li a").mouseout(function(){
			$(this).find('span').show().next('em').hide();
		});
		if (screen.width < 768) {
			$(".nav-ul li a").unbind("mouseover");
			$(".nav-ul li a").unbind("mouseout");
		};
	};
	navMouse();
})