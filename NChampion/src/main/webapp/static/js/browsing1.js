$(function(){
	
	//点击任意地方隐藏下拉框
	$(document).click(function(){$('#dropdown_box').hide(); });
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
			
			$(this).parent().parent().parent().height("auto");;//订单高度
			
			$(this).next().show();
			
		}
	}
	for(var i=0;i<hidean.length;i++){//循环遍历确定点击对象		
		hidean[i].onclick=function(){
			$(this).hide();//隐藏收起按钮
			$(this).parent().parent().parent().animate({"height":"29px"});//订单高度
			$(this).prev().show();
			
		}
	}
})
