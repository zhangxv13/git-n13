$(function(){
	$(".logo_right_left").find('li').click(function(){
		var arr=[
			"data.png",
			"char1t.png",
			"position1.png"
		];
		var brr=["/glory/rest/customerindex",
		         "/glory/rest/toChartView",
		         "/glory/rest/toRegionalDistribution"
		         
		         ];
		var nm=$(this).index();
		//alert($(this).find("a").css("backgroundImage"));
		
		//alert($('iframe').prop('src'));
		for(var i=0;i<3;i++){
			var obj=$(".logo_right_left").find('li').eq(i).find("a").css("backgroundImage");
			var num=obj.lastIndexOf("/")+1;
			
			var start=obj.substring(num,obj.length-2);
			$(".dropdown_ul").find('li').eq(i).find("span").css("color","");
			$(".dropdown_ul").find('li').eq(i).find("a").css("backgroundImage","");
			if(i==nm){
				//alert(1);
				$(this).find("span").css("color","#58A0FD");
				var newurl=obj.replace(start,arr[nm]);
				$(this).find("a").css("backgroundImage",newurl);
				$('iframe').prop('src',brr[i]);
			}else{
				$(".logo_right_left").find('li').eq(i).find("span").css("color","");
				$(".logo_right_left").find('li').eq(i).find("a").css("backgroundImage","");
			}
		}
	});

	$(".dropdown_ul").find('li').click(function(){
		var arr=[
			"browsing.png",
			"down1.png",
			"xgmm.png"
		];
		var brr=["/glory/rest/listLookHistory",
		         "/glory/rest/listDownloadHistory",
		         "/glory/rest/toUpdatePwd"
		         
		         ];
		var nm=$(this).index();
		//alert($(this).find("a").css("backgroundImage"));
		for(var i=0;i<3;i++){
			var obj=$(".dropdown_ul").find('li').eq(i).find("a").css("backgroundImage");
			var num=obj.lastIndexOf("/")+1;
			$(".logo_right_left").find('li').eq(i).find("span").css("color","");
			$(".logo_right_left").find('li').eq(i).find("a").css("backgroundImage","");
			var start=obj.substring(num,obj.length-2);
			
			if(i==nm){
				//alert(1);
				$(this).find("span").css("color","#58A0FD");
				var newurl=obj.replace(start,arr[nm]);
				$(this).find("a").css("backgroundImage",newurl);
				$('iframe').prop('src',brr[i]);
			}else{
				$(".dropdown_ul").find('li').eq(i).find("span").css("color","");
				$(".dropdown_ul").find('li').eq(i).find("a").css("backgroundImage","");
			}
		}
	});
	})