var ok1=false,ok2=false,ok3=false,ok4=false,ok5=false,ok6=false,ok7=false,ok8=false,ok9=false;
	$("input[name=account]").blur(function(){
		var a=$("input[name=account]").val();
		if(a.length>0){
			var b = a.substring(0,1);
		}
		$("input[name=account]").val(a.replace(/(^\s*)|(\s*$)/g,""));
		$("#account").html("");
		if(a==""){
			$("#account").html("不能为空").css("color","red");ok1=false;
		}else if(!/[a-z]|[A-Z]{1}/.test(b)){
			$("#account").html("必须以字母开头").css("color","red");ok1=false;
		}else if(a.length<6){
			$("#account").html("长度最少6位").css("color","red");ok1=false;
		}else{
			$.ajax({
				url:"../rest/user/getUserByName",
				data:"account="+a,
				success:function(res){
					if(res=='0'){
						ok1=true;
					}else{
						$("#account").html("帐号已存在").css("color","red");ok1=false;
					}
				}
			})
		}
	});
	$("input[name=pwd]").blur(function(){
		var a=$("input[name=pwd]").val();
		$("#pwd").html("");
		if(a==""){
			$("#pwd").html("不能为空").css("color","red");ok2=false;
		}else if(a.length<6){
			$("#pwd").html("长度最少6位").css("color","red");ok2=false;
		}else if($("input[name=pwd1]").val()!=""){
			if($("input[name=pwd]").val()!=$("input[name=pwd1]").val()){
				$("#pwd1").html("两次密码不一致").css("color","red");ok2=false;
			}else{
				ok2=true;
			}
		}else{
			ok2=true;
		}
	});
	$("input[name=pwd1]").blur(function(){
		var a=$("input[name=pwd1]").val();
		$("#pwd1").html("");
		if(a==""){
			$("#pwd1").html("不能为空").css("color","red");ok3=false;
		}else if(a.length<6){
			$("#pwd1").html("长度最少6位").css("color","red");ok3=false;
		}else if($("input[name=pwd]").val()!=""){
			if($("input[name=pwd]").val()!=$("input[name=pwd1]").val()){
				$("#pwd1").html("两次密码不一致").css("color","red");ok3=false;
			}else{
				ok3=true;
			}
		}else{
			ok3=true;
		}
	});
	$("input[name=name]").blur(function(){
		var a=$("input[name=name]").val();
		$("input[name=name]").val(a.replace(/(^\s*)|(\s*$)/g,""));
		$("#name").html("");
		if(a==""){
			$("#name").html("不能为空").css("color","red");ok4=false;
		}else if(a.length<2){
			$("#name").html("长度最少2位").css("color","red");ok4=false;
		}else{
			ok4=true;
		}
	});
//客户单位--	
	$("input[name=company]").blur(function(){
		var a=$("input[name=company]").val();
		$("input[name=company]").val(a.replace(/(^\s*)|(\s*$)/g,""));
		$("#company").html("");
		if(a==""){
			$("#company").html("不能为空").css("color","red");ok8=false;
		}else if(a.length<2){
			$("#company").html("长度最少2位").css("color","red");ok8=false;
		}else{
			ok8=true;
		}
	});
//客户单位地址--	
	/*$("input[name=address]").blur(function(){
		var a=$("input[name=address]").val();
		$("input[name=address]").val(a.replace(/(^\s*)|(\s*$)/g,""));
		$("#address").html("");
		if(a==""){
			$("#address").html("不能为空").css("color","red");ok9=false;
		}else if(a.length<2){
			$("#address").html("长度最少2位").css("color","red");ok9=false;
		}else{
			ok9=true;
		}
	});*/
	
		
	$("input[name=idcard]").blur(function(){
		var a=$("input[name=idcard]").val();
		$("#idcard").html("");
		if(a==""){
			$("#idcard").html("不能为空").css("color","red");ok5=false;
		}else if(!/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(a)){
			$("#idcard").html("身份证格式有误").css("color","red");ok5=false;
		}else{
			ok5=true;
		}
	});
	$("input[name=email]").blur(function(){
		var a=$("input[name=email]").val();
		$("#email").html("");
		if(a==""){
			$("#email").html("不能为空").css("color","red");ok6=false;
		}else if(!/(^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+$)|(^$)/.test(a)){
			$("#email").html("邮箱格式有误").css("color","red");ok6=false;
		}else{
			ok6=true;
		}
	});
	$("input[name=phone]").blur(function(){
		var a=$("input[name=phone]").val();
		$("#phone").html("");
		if(a==""){
			$("#phone").html("不能为空").css("color","red");ok7=false;
		}else if(!/^1[3|4|5|7|8]\d{9}$/.test(a)){
			$("#phone").html("手机号格式有误").css("color","red");ok7=false;
		}else{
			ok7=true;
		}
	});
	function tiJiao(){
		$("input").trigger("blur");
		if(ok1==true&&ok2==true&&ok3==true&&ok4==true&&ok5==true&&ok6==true&&ok7==true&&ok8==true){
			$("input[name=account]").val()
			$("input[name=pwd1]").val()
			//$("#leib").val() +"&application_direction="+$("#leib").val()
			$("input[name=name]").val()
			$("input[name=idcard]").val()
			$("input[name=email]").val()
			$("input[name=phone]").val()
			//l
			$("input[name=company]").val()
			$("input[name=address]").val()
			
			/* alert($("input[name=account]").val()+"-"+$("input[name=pwd1]").val()+"-"+$("#leib").val()+"-"+$("input[name=name]").val()
			+"-"+$("input[name=idcard]").val()+"-"+$("input[name=email]").val()+"-"+$("input[name=phone]").val()); */
			$.ajax({
				url:"../rest/user/registerCustomer",
				data:"login_name="+$("input[name=account]").val()+"&password="+$("input[name=pwd1]").val()
						+"&username="+$("input[name=name]").val()
						+"&idcard="+$("input[name=idcard]").val()+"&email="+$("input[name=email]").val()
						+"&phone="+$("input[name=phone]").val()+"&company="+$("input[name=company]").val()+"&address="+$("input[name=address]").val()+"&type="+$("input[name='type']:checked").val(),
				success:function(res){
					if(res=='1'){
						alert("提交成功，等待管理员审核...");
						window.location.href='../rest/page/login'
					}else if(res=='3'){
						alert("错误操作...");
						window.location.href='../rest/page/login'
					}else{
						alert("服务器繁忙，请稍候再试...");
						window.location.href='../rest/page/login'
					}
				}
			});
		}
	}