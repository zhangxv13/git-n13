var allshen = "";
var allshi = "";
var allxian = "";

function getSheng(sheng) {
	$.ajax({
		url : url+"findAllShen",
		dataType : "JSON",
		success : function(lists) {
			for ( var shen in lists) {
				allshen += "<option value=" + lists[shen].code + ">"
						+ lists[shen].name + "</option>";
			}
			$("#" + sheng).append(allshen);
		}
	});
}
function changeShen(shenCode, sheng, shi, xian) {
	shi = '#' + shi;
	xian = '#' + xian;
	$.ajax({
		url : url+"findShiByShen",
		data : "shenCode=" + shenCode,
		dataType : "JSON",
		success : function(lists) {
			$(shi).empty(); // 清空市option
			$(xian).empty(); // 清空县option
			allshi = "<option>请选择</option>"; // 清空市变量
			allxian = "<option>请选择</option>"; // 清空县变量
			for ( var i in lists) {
				allshi += "<option value=" + lists[i].code + ">" // 给市变量赋值
						+ lists[i].name + "</option>";
			}
			$(shi).append(allshi); // 添加市option
			$(xian).append(allxian); // 添加县option
		}
	});
}
function changeShi(shiCode, sheng, shi, xian) {
	xian = '#' + xian;
	$.ajax({
		url : url+"findXianByShi",
		data : "shiCode=" + shiCode,
		dataType : "JSON",
		success : function(lists) {
			$(xian).empty();
			allxian = "<option>请选择</option>";
			for ( var i in lists) {
				allxian += "<option value=" + lists[i].code + ">"
						+ lists[i].name + "</option>";
			}
			$(xian).append(allxian);
		}
	});
}
//------------------------------------------
function getDate(){
	var year='';
	for(var i=2000;i<2051;i++){
		year +='<option value='+i+'>&nbsp;&nbsp;'+i+'</option>';
	}
	$("#year").append(year);
}
function changeYear(){
	if($("#year").val()!="请选择"){
		$("#month").empty();
		$("#day").empty();
		var month='<option selected value="请选择">请选择</option>';
		for(var i=1;i<13;i++){
			month +='<option value='+i+'>&nbsp;&nbsp;'+i+'</option>';
		}
		$("#month").append(month);
		$("#day").append('<option selected value="请选择">请选择</option>');
	}else{
		$("#month").empty();
		$("#day").empty();
		$("#month").append('<option selected value="请选择">请选择</option>');
		$("#day").append('<option selected value="请选择">请选择</option>');
	}
}
function changeMonth(){
	if($("#year").val()!="请选择"){
		var year=$("#year").val();
		var month=$("#month").val();
		var mydate=new Date(year,month,1);
		var count=new Date(mydate.getTime()-864e5).getDate();
		$("#day").empty();
		var day='<option selected value="请选择">请选择</option>';
		for(var i=1;i<count+1;i++){
			day +='<option value='+i+'>&nbsp;&nbsp;'+i+'</option>';
		}
		$("#day").append(day);
	}else{
		$("#day").empty();
		$("#day").append('<option selected value="请选择">请选择</option>');
	}
}
//------------------------------------------
function getKind(){
	$.ajax({
		url:url+"getKind",
		dataType:"JSON",
		success:function(obj){
			$("#nzw_spacies").empty();
			var spacies='';
			for(var i in obj){
				spacies+='<option value='+obj[i].id+'>&nbsp;&nbsp;'+obj[i].crop_species+'</option>';
			}
			$("#nzw_spacies").append(spacies);
		}
	});
}