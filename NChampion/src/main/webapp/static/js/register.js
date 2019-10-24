$(function(){
	$(".qrpwd input").blur(function(){
		var x = $(".pwd input").val();
		var y = $(".qrpwd input").val();
		if(x !== y){
			$(".qrpwd span").html("2次密码不一致")
		}
	})
})
