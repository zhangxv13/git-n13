$(function(){
	
	//点击任意地方隐藏下拉框
	$('.grzx_a').mouseout(function(){ 
		$('#dropdown_box').css("display","none");
	});
	$('.grzx_a').mouseover(function(){ 
		$('#dropdown_box').css("display","block");
	});
	
	
	
	//点击展开
	var showan=$(".showbox");
	var hidean=$(".hidebox");
	showan.click(function(){
		$(this).hide();
		$(this).siblings(".hidebox").show();
		$(this).parents(".seria_right").height("100px");
		
	})
	hidean.click(function(){
		$(this).hide();
		$(this).parents(".seria_right").height("30px")
		$(this).siblings(".showbox").show();
	})
	/*for(var i=0;i<showan.length;i++){//循环遍历确定点击对象		
		showan[i].onclick=function(){
			
			$(this).hide();//隐藏展开按钮
			var num=$(this).parent().parent().parent().siblings('.sample_info3').children().length;
			
			
			if(num<=3){
				$(this).parent().parent().parent().parent().show();//订单高度
			}else{
				var mn=num*75;
				$(this).parent().parent().parent().parent().show();
			}
			$(this).next().show();
			var id = $(this).find('div').text();
		
			
			var fromVals={"id":id};
	    	//根据班级id查询学生，做班级学生二级联动
	    	$.post("rest/insertLookHistory ",fromVals,function(data,state){
			    //这里显示从服务器返回的数据
		    });
		}
	}
	for(var i=0;i<hidean.length;i++){//循环遍历确定点击对象		
		hidean[i].onclick=function(){
		
			$(this).hide();//隐藏收起按钮
			$(this).parent().parent().parent().parent().animate({"height":"100px"});//订单高度
			$(this).prev().show();
			
		}
	}*/
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
	for(i; i < 2100; i++) {
		
			
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

