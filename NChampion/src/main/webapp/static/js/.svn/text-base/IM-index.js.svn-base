/*全选*/
$(function() {
	//全选
	$("#checkbox1").click(function() {
		var iffalse = $(this).get(0).checked;
		$('tbody input[type = "checkbox"]').each(function() {
			$(this).prop("checked", iffalse);
		});
	});
	$('tbody input[type = "checkbox"]').click(function() {
		var ele = $('tbody input[type = "checkbox"]');

		for(var i = 0,
				let = ele.length; i <
			let; i++) {
			if(ele.eq(i).is(':checked')) {
				$("#checkbox1").prop("checked", true);
			}
			if(ele.eq(i).is(':checked') === false) {
				$("#checkbox1").prop("checked", false);
				break;
			}
		}
	});
	//删除提示
	$(".del").click(function(){
		if(confirm("确认删除？")){
				alert('删除成功')
			}else{
				alert("取消删除")
			}
	});
	//信息导入
	$(".xz-btn-b-1").click(function(){
		$(".file-info-b-1").trigger('click');
	});
	$(".file-info-b-1").change(function() {
		$(".vall-1").val($(".file-info-b-1").val());
	});
	
	$(".junzhu-b").click(function(){
		$(".junzhu-a").trigger('click');
	});
	$(".junzhu-a").change(function() {
		$(".vall-c").val($(".junzhu-a").val());
	});
//	$(".sc").click(function(){
//		$(".vall").html("");
//		$(".file-info-b").val("")
//		$(".vall").css("display","none");
//		$(".sc").css("display","none");
//	})
});


/*年月日联动*/
$('document').ready(function() {
	/*
	 * 生成级联菜单
	 */
	var i = 1950;
	var date = new Date();
	year = date.getFullYear(); //获取当前年份
	var dropList = "<option value='0'>请选择</option>";
	for(i; i < 2200; i++) {
		
			
			dropList = dropList + "<option value='" + i + "'>" + i + "</option>";
		
	}
	$('select[name=year]').html(dropList);//生成年份下拉菜单
	if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
		var ss = $("#qaz").val();
		var cc =  ss.split("-");
		var x=cc[0]
		
		$(".year option").each(function(){
			if($(this).val() == x){
				$(this).prop("selected",true)
			}
		})
	}
	$(".year").change(function(){
		if($(".year").val() == 0){
			$(".month").html("<option value='0'>请选择</option>");
			$(".day").html("<option value='0'>请选择</option>")
		}else{
			months = date.getMonth()
			var monthly = "<option value='0'>请选择</option>";
			for(month = 1; month < 13; month++) {
				
					monthly = monthly + "<option value='" + month + "'>" + month + "</option>";
				
			}
			$('select[name=month]').html(monthly); //生成月份下拉菜单
			if($(".year").val()==0){
				$(".month").html("<option value='0'>请选择</option>");
				$(".day").html("<option value='0'>请选择</option>");
			};
			if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
				var ss = $("#qaz").val();
				var cc =  ss.split("-");
				var x= parseInt(cc[1]) 
				
				$(".month option").each(function(){
					
					if($(this).val() == x){
						$(this).prop("selected",true)
					}

				})
			}
			var dayly = "<option value='0'>请选择</option>";
			days = date.getDate()
			for(day = 1; day <= 31; day++) {
				
				
					dayly = dayly + "<option value='" + day + "'>" + day + "</option>";
				

			}
			$('select[name=day]').html(dayly); //生成天数下拉菜单
			if($(".month").val()==0){
				$(".day").html("<option value='0'>请选择</option>");
			};
			if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
				var ss = $("#qaz").val();
				var cc =  ss.split("-");
				var x= parseInt(cc[1]) 
				
				$(".day option").each(function(){
					
					if($(this).val() == x){
						$(this).prop("selected",true)
					}

				})
			}
			/*
			 * 处理每个月有多少天---联动
			 */
			$('select[name=month]').change(function() {
				var currentDay = "<option value='0'>请选择</option>";
				var Flag = $('select[name=year]').val();
				var total
				var currentMonth = $('select[name=month]').val();
				switch(currentMonth) {
					case "1":
					case "3":
					case "5":
					case "7":
					case "8":
					case "10":
					case "12":
						total = 31;
						break;
					case "4":
					case "6":
					case "9":
					case "11":
						total = 30;
						break;
					case "2":
						if((Flag % 4 == 0 && Flag % 100 != 0) || Flag % 400 == 0) {
							total = 29;
						} else {
							total = 28;
						}
					default:
						break;
				}
				for(day = 1; day <= total; day++) {
					currentDay +="<option value='" + day + "'>" + day + "</option>";
				}
				$('select[name=day]').html(currentDay); //生成日期下拉菜单
				if($(".month").val()==0){
					$(".day").html("<option value='0'>请选择</option>");
				};
				if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
					var ss = $("#qaz").val();
					var cc =  ss.split("-");
					var x= parseInt(cc[1]) 
					
					$(".day option").each(function(){
						
						if($(this).val() == x){
							$(this).prop("selected",true)
						}

					})
				}
			})
		}	
	})
	months = date.getMonth()
	var monthly = "<option value='0'>123</option>";
	for(month = 1; month < 13; month++) {
		
			monthly = monthly + "<option value='" + month + "'>" + month + "</option>";
		
	}
	$('select[name=month]').html(monthly); //生成月份下拉菜单
	if($(".year").val()==0){
		$(".month").html("<option value='0'>请选择</option>");
		$(".day").html("<option value='0'>请选择</option>");
	};
	if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
		var ss = $("#qaz").val();
		var cc =  ss.split("-");
		var x= parseInt(cc[1]) 
		
		$(".month option").each(function(){
			
			if($(this).val() == x){
				$(this).prop("selected",true)
			}

		})
	};

	var dayly = "<option value='0'>请选择</option>";
	days = date.getDate()
	for(day = 1; day <= 31; day++) {
		
			dayly = dayly + "<option value='" + day + "'>" + day + "</option>";
		
	}
	$('select[name=day]').html(dayly); //生成天数下拉菜单
	if($(".month").val()==0){
		$(".day").html("<option value='0'>请选择</option>");
	};
	if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
		var ss = $("#qaz").val();
		var cc =  ss.split("-");
		var x= parseInt(cc[2]) 
		
		$(".day option").each(function(){
			if($(this).val() == x){
				$(this).prop("selected",true)
			}

		})
	}
	/*
	 * 处理每个月有多少天---联动
	 */
	$('select[name=month]').change(function() {
		var currentDay = "<option value='0'>请选择</option>";
		var Flag = $('select[name=year]').val();
		var total
		var currentMonth = $('select[name=month]').val();
		switch(currentMonth) {
			case "1":
			case "3":
			case "5":
			case "7":
			case "8":
			case "10":
			case "12":
				total = 31;
				break;
			case "4":
			case "6":
			case "9":
			case "11":
				total = 30;
				break;
			case "2":
				if((Flag % 4 == 0 && Flag % 100 != 0) || Flag % 400 == 0) {
					total = 29;
				} else {
					total = 28;
				}
			default:
				break;
		}
		for(day = 1; day <= total; day++) {
			currentDay +="<option value='" + day + "'>" + day + "</option>";
		}
		$('select[name=day]').html(currentDay); //生成日期下拉菜单
		if($(".month").val()==0){
			$(".day").html("<option value='0'>请选择</option>");
		};
		if($("#qaz").val() !== "" || $("#qaz").val() !== "0" ){
			var ss = $("#qaz").val();
			var cc =  ss.split("-");
			var x= parseInt(cc[2]) 
			
			$(".day option").each(function(){
				
				if($(this).val() == x){
					$(this).prop("selected",true)
				}

			})
		}
	})
})
