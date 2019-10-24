$(function(){
	
	//点击任意地方隐藏下拉框
	$(document).click(function(){ $('#dropdown_box').hide(); });
	//阻止点击(#dropdown_box) div 隐藏div
	$('#dropdown_box').click(function(event){ event.stopPropagation();});
	//阻止点击(#logo_mycenter) div 隐藏div
	$('#logo_mycenter').click(function(event){ event.stopPropagation();});
	//点击#logo_mycenter显示div
	$('#logo_mycenter').click(function(){ $('#dropdown_box').show();});
	
	//点击展开
	var showan=$(".showbox");
	var hidean=$(".hidebox");
	for(var i=0;i<showan.length;i++){//循环遍历确定点击对象		
		showan[i].onclick=function(){
			
			$(this).hide();//隐藏展开按钮
			var num=$(this).parent().parent().parent().siblings('.sample_info3').children().length;
			//alert(num);
			
			if(num<=3){
				$(this).parent().parent().parent().parent().height("auto");//订单高度
			}else{
				var mn=num*75;
				$(this).parent().parent().parent().parent().height("auto");
			}
			$(this).next().show();
			var id = $(this).find('div').text();
			console.log(id);
			
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
	}
});