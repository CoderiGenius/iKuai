/*登录/注册的切换*/
$(".switchRegister").click(function() {
	$(".login").hide();
	$(".register").show();
	load_animation(".register .load_animation li");
});
$(".switchLogin").click(function() {
	$(".register").hide();
	$(".login").show();
	load_animation(".login .load_animation li");
});

$(".btn_login").click(function() {
	var login_name = $("#login_name").val();
	var login_pass = $("#login_pass").val();
	
	if (login_name == "" || login_pass == "") {
		return false;
	}
	
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "/users/signup",
		data : {
			login_name : login_name,
			login_pass : login_pass
		},
		success : function(data) {

			if (data.log == 1) {
				$(".error_font").html(data.msg).css({
					color : '#00ac4b'
				});
				window.location.href='/partners/center';
			} else {

				$(".error_font").html(data.msg).css({
					color : '#ff3500'
				});
				return false;
			}
		},
		error : function() {
			alert("登录失败，请重试！");
		}
	});
})

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
var InterValObj; // timer变量，控制时间
var count = 60; // 间隔函数，1秒执行
var curCount;// 当前剩余秒数
var code = ""; // 验证码
var codeLength = 6;// 验证码长度
function sendMessage() {
	curCount = count;
	var dealType; // 验证方式
	// 产生验证码
	for (var i = 0; i < codeLength; i++) {
		code += parseInt(Math.random() * 9).toString();
	}
	// 设置button效果，开始计时
	$("#btnSendCode").attr("disabled", "true");
	$("#btnSendCode").addClass("disabled");
	$("#btnSendCode").val("重新获取" + "(" + curCount + "s)");
	InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次

}
// timer处理函数
function SetRemainTime() {
	if (curCount == 0) {
		window.clearInterval(InterValObj);// 停止计时器
		$("#btnSendCode").removeAttr("disabled");// 启用按钮
		$("#btnSendCode").removeClass("disabled");
		$("#btnSendCode").val("重新获取验证码");
		code = ""; // 清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
	} else {
		curCount--;
		$("#btnSendCode").val("重新获取" + "(" + curCount + "s)");
	}
}

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


$('#login_pass').bind('keypress', function(e) {
	if(e.keyCode==13){
		var login_name = $("#login_name").val();
		var login_pass = $("#login_pass").val();
		
		if (login_name == "" || login_pass == "") {
			return false;
		}
		
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "/users/signup",
			data : {
				login_name : login_name,
				login_pass : login_pass
			},
			success : function(data) {

				if (data.log == 1) {
					$(".error_font").html(data.msg).css({
						color : '#00ac4b'
					});
					window.location.href='/partners/center';
				} else {

					$(".error_font").html(data.msg).css({
						color : '#ff3500'
					});
					return false;
				}
			},
			error : function() {
				alert("登录失败，请重试！");
			}
		});
	}
});