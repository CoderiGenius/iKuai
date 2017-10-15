/*登录/注册的切换*/


/* 登录注册输入框内提示 */
function promptInpt() {
	$('.promptTxt').click(function() {
		// $(this).hide();
		$(this).parent().siblings(".inputTxt").focus();
	});
	$('.inputTxt').focus(function() {
		// $(this).siblings().children(".promptTxt").hide();
	}).blur(function() {
		if ($(this).val() == "") {
			$(this).siblings().children(".promptTxt").show();
		}
	});
}
/* inpt框内提示 end */

/* 复选框美化 */
function checkbox_adorn(a) {
	$(a).each(
			function() {
				var k = $(this).find("input");
				var s = $(this).find("span");

				function checkbox_selected() {
					k.is(':checked') ? s.css("background-position", "0 -28px")
							: s.css("background-position", "0 0")
				}
				;
				function checkbox_hover() {
					k.is(':checked') ? s.css("background-position", "0 -28px")
							: s.css("background-position", "0 -14px")
				}
				;

				checkbox_selected();
				k.change(function() {
					checkbox_hover();
				});
				$(this).hover(function() {
					checkbox_hover();
				}, function() {
					checkbox_selected();
				});
			});
}
/* 复选框美化-end */

/* 登陆 注册的div居中 */
function divMiddle(a) {
	var middles = $(a);
	var topHeight = $(window).height() > middles.outerHeight() ? ($(window)
			.height() - middles.outerHeight()) / 2 : 20;
	middles.css({
		"left" : ($(window).width() - middles.outerWidth()) / 2,
		"top" : topHeight
	});

};

/* 验证码交互 */

	// 设置button效果，开始计时



// timer处理函数


// 加载动画
function load_animation(acg) {
	$(".load_animation li").css({
		"opacity" : "0",
		"top" : "100px"
	});
	$(".login_logo").css({
		"opacity" : "0",
		"top" : "-100px"
	});
	$(".login_logo").animate({
		"opacity" : "1",
		"top" : "0"
	}, {
		duration : 800,
		easing : "easeOutQuad"
	});
	var tim = 0;
	$(acg).each(function() {
		tim += 300;
		$(this).delay(tim).animate({
			"opacity" : "1",
			"top" : "0"
		}, {
			duration : 500,
			easing : "easeOutCirc"
		}, function() {
			shtxt();
		})
	});
}

$(document).ready(function() {

	/* 加载动画 */
	load_animation(".login .load_animation li");

	/* 调用框内提示的方法 */
	promptInpt();

	/* 复选框美化 */
	checkbox_adorn(".checkbox");

	divMiddle(".login");
	divMiddle(".register");

});

$(window).resize(function() {
	/* div居中 */
	divMiddle(".login");
	divMiddle(".register");
	/* div居中-end */
});


