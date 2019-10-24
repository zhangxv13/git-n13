var ok1=false,ok2=false,ok3=false,ok4=false,ok5=false,ok6=false,ok7=false,ok8=false,ok9=false,ok10=false,ok11=false,ok12=false,ok13=false,ok14=false,ok15=false;
function checklogin_name(){
	var a=$("input[name=login_name ]").val();
	if(a.length>0){
		var b = a.substring(0,1);
	}
	var id = $("#idd").val();
	/*var fromVals={"login_name":a};*/
	$("#login_name").html("");
	if(a==""){
		$("#login_name").html("不能为空").css("color","red");ok1=false;
	}else if(!/[a-z]|[A-Z]{1}/.test(b)){
		$("#login_name").html("必须以字母开头").css("color","red");ok1=false;
	}else if(a.length<6){
		$("#login_name").html("长度最少6位").css("color","red");ok1=false;
	}else if(a.length>15){
		$("#login_name").html("长度最多15位").css("color","red");ok1=false;
	}else{
		$.ajax({
			url:"/glory/rest/getUserNameE",
			data:"logName="+a+"&id="+id,
			success:function(res){
				if(res==1){
					 $("#login_name").html("登录名已存在").css("color","red");ok1=false;
				 }else if(res==0){
					 $("#login_name").html("√").css("color","green");ok1=true;
					 
				 }
			}
		});
		/*$.post("/glory/rest/getUSerByName",fromVals,function(data,state){
			 //这里显示从服务器返回的数据
			 //获取
			 var user = data.currentuser;
			 var id2 = user.id;
			 alert(user+""+id2+""+id);
			 if(data.flag == 1){
				 if(id != id2){
					 $("#login_name").html("登录名已存在").css("color","red");ok1=false;
				 }else{
					 $("#login_name").html("√").css("color","green");ok1=true;
					 
				 }
			 }
		},
			 "json"
		);*/
	}
}
function checkpassword(){
	var a=$("input[name=password]").val();
	$("#password").html("");
	if(a==""){
		$("#password").html("不能为空").css("color","red");ok2=false;
	}else if(a.length<6){
		$("#password").html("长度最少6位").css("color","red");ok2=false;
	}else if(a.length>16){
		$("#password").html("长度最多15位").css("color","red");ok2=false;
	}else{
		$("#password").html("√").css("color","green");ok2=true;
	}
}



function checkusername(){
	var a=$("input[name=username ]").val();
	$("#username").html("");
	if(a==""){
		$("#username").html("不能为空").css("color","red");ok4=false;
	}else if(a.length<2){
		$("#username").html("长度最少2位").css("color","red");ok4=false;
	}else if(a.length>10){
		$("#username").html("长度最多10位").css("color","red");ok4=false;
	}else{
		$("#username").html("√").css("color","green");ok4=true;
	}
}

/*function checkrole(){
	var a=$("#s1").val();
	$("#role").html("");
	if(a==0){
		$("#role").html("请选择角色").css("color","red");ok5=false;
	}else{
		$("#role").html("√").css("color","green");ok5=true;
	}
}*/
$(function(){
	/*aa*/
	/*if($("#s1").find('option:selected').val()==2){
		$('.xxgl').css('display',"block");
		var date = new Date();
		year = date.getFullYear();
		months = date.getMonth()+1;
		days = date.getDate();
		$('#dt').val(year+'-'+months+'-'+days);
		$('#dt-b').val(year+'-'+months+'-'+(days+1));
	}else{
		$('.xxgl').css('display',"block");
	}*/
	
	/*/日历/*/
	
	$(function(){
		$('.xxgl').css('display',"block");
		var date = new Date();
		year = date.getFullYear();
		months = date.getMonth()+1;
		days = date.getDate();
		$('#dt').val(year+'-'+months+'-'+days);
		$('#dt-b').val(year+'-'+months+'-'+(days+1));
		
		
		//日历
		$('#dd').calendar({
	        trigger: '#dt',
	        zIndex: 999,
			format: 'yyyy-mm-dd',
	        onSelected: function (view, date, data) {
	           
	        },
	        onClose: function (view, date, data) {
	         
	        }
	    });
	    $('#dd-b').calendar({
	        trigger: '#dt-b',
	        zIndex: 999,
			format: 'yyyy-mm-dd',
	        onSelected: function (view, date, data) {
	            
	        },
	        onClose: function (view, date, data) {
	       
	        }
	    });
		
		
	})
	
//	$('#s1').change(function(){
//		let x = $("#s1").find('option:selected').val();
//		
//		if(x == 2){
//			$('.xxgl').css('display',"block");
//			var date = new Date();
//			year = date.getFullYear();
//			months = date.getMonth()+1;
//			days = date.getDate();
//			$('#dt').val(year+'-'+months+'-'+days);
//			$('#dt-b').val(year+'-'+months+'-'+(days+1));
//		}else{
//			$('.xxgl').css('display',"none");
//		}
//	});

	});
/**
 * 新增用户提交事件（出发所有表单事件）
 * @returns {Boolean}
 */
function sub(){
	$("input").trigger("blur");
	$("select").trigger("blur");
/*	alert(ok1+""+ok2+""+ok3+""+ok4+""+ok5+""+ok6+""+ok7+""+ok8+""+ok9+""+ok10+""+ok11+""+ok12);
*/	if(ok1==true&&ok2==true&&ok4==true){
		$("#form1").submit();
		return true;
	}
	return false;
	
}
