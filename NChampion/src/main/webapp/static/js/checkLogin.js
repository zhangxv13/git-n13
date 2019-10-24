var ok1=false,ok2=false,ok3=false,ok4=false,ok5=false,ok6=false,ok7=false,ok8=false,ok9=false,ok10=false,ok11=false,ok12=false,ok13=false,ok14=false,ok15=false;
function checklogin_name(){
	var a=$("input[name=login_name ]").val();
	
	$("#login_name").html("");
	if(a==""){
		$("#login_name").html("账号不能为空").css("color","red");ok1=false;
	}else{
		ok1=true;
	}
}
function checkpassword(){
	var a=$("input[name=password]").val();
	$("#password").html("");
	if(a==""){
		$("#password").html("密码不能为空").css("color","red");ok2=false;
	}else{
		ok2=true;
	}
}

/**
 * 登录提交事件（出发所有表单事件）
 * @returns {Boolean}
 */
function sub(){
	$("input").trigger("blur");
	$("select").trigger("blur");
	//alert(ok1+""+ok2+""+ok3+""+ok4+""+ok5+""+ok6+""+ok7+""+ok8+""+ok9+""+ok10+""+ok11+""+ok12);
	if(ok1==true&&ok2==true){
		$("#fm1").submit();
		return true;
	}
	return false;
	
}
