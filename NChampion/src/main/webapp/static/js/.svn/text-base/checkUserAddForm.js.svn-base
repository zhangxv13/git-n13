var ok1=false,ok2=false,ok3=false,ok4=false,ok5=false,ok6=false,ok7=false,ok8=false,ok9=false,ok10=false,ok11=false,ok12=false,ok13=false,ok14=false,ok15=false;
function checklogin_name(){
	var a=$("input[name=login_name ]").val();
	
	if(a.length>0){
		var b = a.substring(0,1);
	}
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
		var fromVals={"login_name":a};
		$.post("/glory/rest/getUSerByName",fromVals,function(data,state){
			 //这里显示从服务器返回的数据
			 if(data.flag == 1){
				 $("#login_name").html("登录名已存在").css("color","red");ok1=false;
			 }else{
				 $("#login_name").html("√").css("color","green");ok1=true;
			 }
		},
			 "json"
		);
		
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

function checkpassword2(){
	var a=$("input[name=password2]").val();
	$("#password2").html("");
	if(a==""){
		$("#password2").html("不能为空").css("color","red");ok3=false;
	}else if(a.length<6){
		$("#password2").html("长度最少6位").css("color","red");ok3=false;
	}else if(a.length>16){
		$("#password2").html("长度最多15位").css("color","red");ok3=false;
	}else if($("#p1").val()!=$("#p2").val()){
		$("#password2").html("两次输入密码不一致").css("color","red");ok3=false;
	}else{
		$("#password2").html("√").css("color","green");ok3=true;
	}
}

function checkusername(){
	var a=$("input[name=username ]").val();
	$("#username").html("");
	if(a==""){
		$("#username").html("不能为空").css("color","red");ok4=false;
	}else if(a.length<2){
		$("#username").html("长度最少2位").css("color","red");ok4=false;
	}else if(a.length>11){
		$("#username").html("长度最多10位").css("color","red");ok4=false;
	}else{
		$("#username").html("√").css("color","green");ok4=true;
	}
}

function checkrole(){
	var a=$("#s1").val();
	$("#role").html("");
	if(a==0){
		$("#role").html("请选择角色").css("color","red");ok5=false;
	}else{
		$("#role").html("√").css("color","green");ok5=true;
	}
}

/**
 * 新增学生提交事件（出发所有表单事件）
 * @returns {Boolean}
 */
function sub(){
	$("input").trigger("blur");
	$("select").trigger("blur");
	/*alert(ok1+""+ok2+""+ok3+""+ok4+""+ok5+""+ok6+""+ok7+""+ok8+""+ok9+""+ok10+""+ok11+""+ok12);*/
	if(ok1==true&&ok2==true&&ok3==true&&ok4==true&&ok5==true){
		var a=$("#s1").val();
		$("#role").html("");
		if(a==2){
			$("#role").html("√").css("color","green");
			var obj = document.getElementsByName('category');
			var count = obj.length;
			var j = 0;
			for (var i = 0; i < count; i++) {
				if (obj[i].checked) {
					j++;
				}
			}
			if (j == 0) {
				//alert("种类至少选择一个！！");
				$("#category").html("种类至少选择一个").css("color","red");
				return false;
			}else{
				//$("#category").html("种类至少选择一个").css("color","red");
				$("#category").html("√").css("color","green");
			}
			var obj = document.getElementsByName('area');
			var count = obj.length;
			var j = 0;
			for (var i = 0; i < count; i++) {
				if (obj[i].checked) {
					j++;
				}
			}
			if (j == 0) {
				//alert("地点至少选择一个！！");
				$("#area").html("地点至少选择一个").css("color","red");
				return false;
			}else{
				//$("#category").html("种类至少选择一个").css("color","red");
				$("#area").html("√").css("color","green");
			}
			
			
		}
		$("#form1").submit();
		return true;
	}
	
	return false;
	
}
$(function(){
	
	var date = new Date();
	year = date.getFullYear();
	months = date.getMonth()+1;
	days = date.getDate();
	$('#dt').val(year+'-'+months+'-'+days);
	$('#dt-b').val(year+'-'+months+'-'+(days+1));
	$('#s1').change(function(){
		let x = $("#s1").find('option:selected').val();
		
		if(x == 2){
			$('.xxgl').css('display',"block");
			//$(".time").append('<div class="begin">开始时间：<input type="" name="starttime" id="dt" value="" readonly="readonly" placeholder="选择日期"/><div id="dd"></div></div><div class="end">结束时间：<input type="" name="endtime" id="dt-b" value=""  readonly="readonly" placeholder="选择日期"/><div id="dd-b"></div></div>');
			var date = new Date();
			year = date.getFullYear();
			months = date.getMonth()+1;
			days = date.getDate();
			$('#dt').val(year+'-'+months+'-'+days);
			$('#dt-b').val(year+'-'+months+'-'+(days+1));
		}else{
			$('.xxgl').css('display',"none");
		}
	});
	
	$('.time').on('click','.days',function(){
		var x = $('#dt').val();
		setTimeout(function(){
			var y =  $('#dt-b').val();
			var begin = x.split('-');
			var end = y.split('-');
			if(begin[1]<10){
				begin[1]='0'+begin[1];
			};
			if(begin[2]<10){
				begin[2]='0'+begin[2];
			};
			if(end[1]<10){
				end[1]='0'+end[1];
			};
			if(end[2]<10){
				end[2]='0'+end[2];
			};
			if((end[0]+end[1]+end[2])-(begin[0]+begin[1]+begin[2])<=0){
				$('#dt-b').val('');
				alert('请选择正确的结束时间');
			}
		},100)
	})

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


