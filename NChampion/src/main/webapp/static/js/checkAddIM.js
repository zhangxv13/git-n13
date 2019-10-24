var ok1=false,ok2=false,ok3=false,ok4=false,ok5=false,ok6=false,ok7=false,ok8=false,ok9=false,ok10=false,ok11=false,ok12=false,ok13=false,ok14=false,ok15=false;
function checksample_id(){
	var a=$("input[name=sample_id ]").val();
	$("#sample_id").html("");
	var cc =  isalphanumber(a)
	var ceshi = isalphanumberzhongwen(a);
	var ss =  a.length;
	if(a=="" ){
		$("#sample_id").html("不能为空").css("color","red");ok1=false;
	}else if  (ceshi == true ){
		$("input[name=sample_id ]").val() = "";
		$("#sample_id").html("编号格式不正确！！！！！").css("color","red");ok1=false;
	}else if  (cc == false){
		$("#sample_id").html("编号格式不正确").css("color","red");ok1=false;
	}else if  (ss < "5" || ss > "15"){
		$("#sample_id").html("编号长度不正确").css("color","red");ok1=false;
	}else{
		$("#sample_id").html("√").css("color","green");ok1=true;
	}
}
function isalphanumber(str){  
	var result=str.match(/^([a-zA-Z])+([a-zA-Z0-9-])+([a-zA-Z0-9-])$/); 
	if(result==null) return false; 
	return true;
}



function checkcrop_category_id(){
	var a=$("#cptype").val();
	
	$("#crop_category_id").html("");
	if(a==0){
		$("#crop_category_id").html("不能为空").css("color","red");ok2=false;
	}else{
		$("#crop_category_id").html("√").css("color","green");ok2=true;
	}
}

function checkbreed(){
	var a=$("#cptypess").val();
	
	$("#breed").html("");
	if(a==0){
		$("#breed").html("不能为空").css("color","red");ok3=false;
	}else{
		$("#breed").html("√").css("color","green");ok3=true;
	}
}

function checkprovince(){
	var a=$("#shen").val();
	var b=$("#shi").val();
	var c=$("#xian").val();
	var ss= $("#shen option:selected").text();
	var ee= $("#shi option:selected").text();
	var rr= $("#xian option:selected").text();
	console.log(ss,ee,rr)
	document.getElementById("provinces").value = ss;
	document.getElementById("city").value = ee;
	document.getElementById("county").value = rr;
	$("#province").html("");
	if(a==0||b==0 || c==0 ){
		$("#province").html("不能为空").css("color","red");ok4=false;
	}else{
		$("#province").html("√").css("color","green");ok4=true;
	}
}





function checksampling_people(){
	var a=$("input[name=sampling_people ]").val();

	$("#sampling_people").html("");

	if(a==0){
		$("#sampling_people").html("不能为空").css("color","red");ok7=false;
	}else{
		$("#sampling_people").html("√").css("color","green");ok7=true;
	}
}

function checkseasonal(){
	var a=$("#seasonal1").val();
	
	$("#seasonal").html("");
	if(a==""){
		$("#seasonal").html("不能为空").css("color","red");ok8=false;
	}else{
		$("#seasonal").html("√").css("color","green");ok8=true;
	}
}

function checkdescription(){
	var a=$("#description1").val();
	
	$("#description").html("");
	if(a==""){
		$("#description").html("不能为空").css("color","red");ok9=false;
	}else{
		$("#description").html("√").css("color","green");ok9=true;
	}
}

function checkpollution_rate(){
	var a=$("input[name=pollution_rate ]").val();
	var cc = isalphanumberzhongwen(a)
	$("#pollution_rate").html("");
	if(a==0){
		$("#pollution_rate").html("不能为空").css("color","red");ok10=false;
	}else if(a>100){
		$("#pollution_rate").html("不能超过100%").css("color","red");ok10=false;
	}else if  (cc == false){
		$("#pollution_rate").html("字符输入有误").css("color","red");ok10=false;
	}else{
		$("#pollution_rate").html("√").css("color","green");ok10=true;
	}
}

function isalphanumberzhongwen(str){  
	var result=str.match(/(^[0-9]{1,3}$)|(^[0-9]{1,3}[\.][0-9]{1,2}$)/); 
	if(result==null) return false; 
	return true;
}
	
function checktoxin_id(){
	var a=$("#toxin_id1").val();
	
	$("#toxin_id").html("");
	if(a==0){
		$("#toxin_id").html("不能为空").css("color","red");ok11=false;
	}else{
		$("#toxin_id").html("√").css("color","green");ok11=true;
	}
}

function checktoxin_count(){
	var a=$("input[name=toxin_count ]").val();
	var cc = isalphanumberzhongwen(a)
	$("#toxin_count").html("");
	if(a==0){
		$("#toxin_count").html("不能为空").css("color","red");ok12=false;
	}else if  (cc == false){
		$("#toxin_count").html("字符输入有误").css("color","red");ok1=false;
	}else{
		$("#toxin_count").html("√").css("color","green");ok12=true;
	}
}

	
$(function(){
	//毒素菌株信息
	$(".add-con").on("focus",".sample",function(){
		$(".sample").each(function(){
				if($(this).val() =="" ){
					$(this).siblings(".err").text("内容不能为空")
					ok13=false
				}else if( isalphanumber($(this).val()) == false){
					$(this).siblings(".err").text("编码格式不正确")
					ok13=false
				}else if(  $(this).val().length < "5" || $(this).val().length > "15"){
					$(this).siblings(".err").text("长度不正确")
					ok13=false
				}
		})
	})
	$(".add-con").on("blur",".sample",function(){
		$(".sample").each(function(){
				if($(this).val() == "" ){
					$(this).siblings(".err").text("内容不能为空").css("color","#f00")
					ok13=false
				}else if( isalphanumber($(this).val()) == false){
					$(this).siblings(".err").text("编码格式不正确")
					ok13=false
				}else if(  $(this).val().length < "5" || $(this).val().length > "15"){
					$(this).siblings(".err").text("长度不正确")
					ok13=false
				}else{
					$(this).siblings(".err").text("√").css("color","#0f0")
					ok13=true
				}
		})
	});
		$(".add-con").on("focus",".num",function(){
		$(".num").each(function(){
			if($(this).val() =="" ){
				$(this).siblings(".err").text("内容不能为空")
				ok14=false
			}else if( isalphanumber($(this).val()) == false){
				$(this).siblings(".err").text("编码格式不正确")
				ok14=false
			}else if(  $(this).val().length < "5" || $(this).val().length > "15"){
				$(this).siblings(".err").text("长度不正确")
				ok14=false
			}
		})
	})
	$(".add-con").on("blur",".num",function(){
		$(".num").each(function(){
			if($(this).val() == "" ){
				$(this).siblings(".err").text("内容不能为空").css("color","#f00")
				ok14=false
			}else if( isalphanumber($(this).val()) == false){
				$(this).siblings(".err").text("编码格式不正确")
				ok14=false
			}else if(  $(this).val().length < "5" || $(this).val().length > "15"){
				$(this).siblings(".err").text("长度不正确")
				ok14=false
			}else{
				$(this).siblings(".err").text("√").css("color","#0f0")
				ok14=true
			}
		})
	})
})



/**
 * 新增学生提交事件（出发所有表单事件）
 * @returns {Boolean}
 */
function sub(){
	
	

	
	
	
	
	
	
	
	
	$("input").trigger("blur");
	$("select").trigger("blur");
	$("#seasonal1").trigger("blur");
	$("#description1").trigger("blur");
	var ss =  $(".sample").length;
	console.log(ss)
	
	if(ss>0){
		console.log(ok1==true,ok2==true,ok3==true,ok4==true,ok5==true,ok7==true,ok8==true,ok9==true,ok10==true,ok11==true,ok12==true,ok13==true,ok14==true)
		if(ok1==true&&ok2==true&&ok3==true&&ok4==true&&ok7==true&&ok8==true&&ok9==true&&ok10==true&&ok11==true&&ok12==true&&ok13==true&&ok14==true){
			var aa = [];
			$("select[name='toxin_id']").each(function(){
				var ab=$(this).val();
				console.log(ab)
				aa.push(ab);
			})
		    for(var i=0;i<aa.length;i++){
		    	for(var j=0;j<i;j++){
		    		if(aa[i]===aa[j]){
		    			alert('毒素种类不能重复！');
		    			return false;
		    		}
		    	}
		    }
			document.getElementById('search_form').submit();
			return true;
		}	
	}else{
		console.log(ok1==true,ok2==true,ok3==true,ok4==true,ok5==true,ok7==true,ok8==true,ok9==true,ok10==true,ok11==true,ok12==true)

		if(ok1==true&&ok2==true&&ok3==true&&ok4==true&&ok7==true&&ok8==true&&ok9==true&&ok10==true&&ok11==true&&ok12==true){
			var aa = [];
			$("select[name='toxin_id']").each(function(){
				var ab=$(this).val();
				console.log(ab)
				aa.push(ab);
			})
		    for(var i=0;i<aa.length;i++){
		    	for(var j=0;j<i;j++){
		    		if(aa[i]===aa[j]){
		    			alert('毒素种类不能重复！');
		    			return false;
		    		}
		    	}
		    }
			document.getElementById('search_form').submit();
			return true;
		}
		
	}
	

	
	return false;
	
}
