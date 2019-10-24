$(function(){
	/*添加产毒菌株信息*/
	var character = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	var x = $(".edittable-bottom").length;
	var i = x;
	$("body").on("click",".add-ds",function(){
		if(i<26){
			$(".add-con").append("<li class='edittable-bottom'><div class='editbottom-left'>产毒菌株信息"+character[i]+"</div><div class='editbottom-right'><ul><li><lable>样品编号</lable><input id='sample_num' name='sample_num' type='text' class='sample' readonly='readonly' value='"+$('.ypbh').val()+"'/></li><li><lable>菌株原始编号</lable><input name='original_num' type='text'  class='num'/><span class='err'></span></li><li class='form-a'><lable>文献信息</lable><a class='xz-btn-a'>选择文件</a> <input type='text' name='' id='' value='' class='file-name-a'  readonly='readonly' placeholder='仅支持doc/docx格式文档'/><input onchange='getPhotoSizes(this)' name='word_addr' type='file' class='file-info-a' accept='.doc,.docx'/></li><li class='form-c'><lable>文本信息</lable><a class='xz-btn-c'>选择文件</a> <input   type='text' name='' id='' value='' class='file-name-c'  readonly='readonly' placeholder='仅支持txt格式'/><input onchange='getTextSize(this)' name='txt_addr' type='file' class='file-info-c' accept='.txt'/></li><li class='form-b'><lable>图片信息</lable><a class='xz-btn-b'>选择文件</a> <input type='text' name='' id='' value='' class='file-name-b'  readonly='readonly' placeholder='仅支持jpg/png格式'/><input onchange='getPhotoSize(this)' name='picture_addr' type='file' class='file-info-b' accept='.png,.jpg,.jpeg'/></li><li><a class='del'>删除</a></li></ul></div></li>");
			i++;
		}else{
			if($(".edittable-bottom").length<26){
			$(".add-con").append("<li class='edittable-bottom'><div class='editbottom-left'>产毒菌株信息"+delcharacter[0]+"</div><div class='editbottom-right'><ul><li><lable>样品编号</lable><input id='sample_num' name='sample_num' type='text' class='sample' readonly='readonly' value='"+$('.ypbh').val()+"' /></li><li><lable>菌株原始编号</lable><input name='original_num' type='text'  class='num'/><span class='err'></span></li><li class='form-a'><lable>文献信息</lable><a class='xz-btn-a'>选择文件</a> <input type='text' name='' id='' value='' class='file-name-a'  readonly='readonly' placeholder='仅支持doc/docx格式文档'/><input onchange='getPhotoSizes(this)' name='word_addr' type='file' class='file-info-a' accept='.doc,.docx'/></li><li class='form-c'><lable>文本信息</lable><a class='xz-btn-c'>选择文件</a> <input  type='text' name='' id='' value='' class='file-name-c'  readonly='readonly' placeholder='仅支持txt格式'/><input onchange='getTextSize(this)' name='txt_addr' type='file' class='file-info-c' accept='.txt'/></li><li class='form-b'><lable>图片信息</lable><a class='xz-btn-b'>选择文件</a> <input type='text' name='' id='' value='' class='file-name-b' readonly='readonly' placeholder='仅支持jpg/png格式图片'/><input onchange='getPhotoSize(this)' name='picture_addr' type='file' class='file-info-b' accept='.png,.jpg,.jpeg'/></li><li><a class='del'>删除</a></li></ul></div></li>");				
			delcharacter.shift();
			
			}
			
		};
	});
	/*添加毒素信息*/
	$(".add-dsxx").click(function(){
		$('.addds').append('<li class="edittable-middle"><div class="editmiddle-left">毒素信息</div><div class="editmiddle-right"><ul><li><lable>毒素种类</lable><select name="toxin_id" id="toxin_id1" onblur="checktoxin_id()"><option value="0" >请选择</option></select><span id="toxin_id" ></span></li><li><lable>毒素含量</lable><input name="toxin_count" type="text"  onblur="checktoxin_count()"  maxlength="10" placeholder="毒素含量最大可输入十位"/><span id="toxin_count" ></span></li><li><a class="del">删除</a></li></ul></div></li>')
		$.ajax({
			url:"rest/addtextoption",
			type:"post",
			dataType:"json",
			success:function(res){
				$.each(res,function(index,item){
				$('div[class=addds] li:last-child').find('select').append('<option value='+(index+1)+'>'+item.toxin_type+'</option>');
				});
			}
		});
	});
	var delcharacter = [];
	//样品编号联动
	$(".ypbh").on("input",function(){
		if($(".add-con").find("li").length !==0){
			$(".sample").each(function(){
				var m = $(".ypbh").val();
				$(this).val(m);
			})
		}
	})
	//删除新增信息
	$(".table-con").on("click",'.del',function(){
		var y = $(this).parents(".editbottom-right").siblings(".editbottom-left").html().substring(6,7)
		delcharacter.push(y);
		delcharacter.sort();
		$(this).parents(".edittable-bottom").remove();
	});
	$(".addds").on("click",'.del',function(){
		var y = $(this).parents(".editmiddle-right").siblings(".editmiddle-left").html().substring(6,7)
		delcharacter.push(y);
		delcharacter.sort();
		$(this).parents(".edittable-middle").remove();
	})
	
	
	//上传文件
	$(".table-con").on("click",'.xz-btn-a',function(){
		$(this).siblings(".file-info-a").trigger('click');
	})
	$(".table-con").on("change",'.file-info-a',function(){
		$(this).siblings(".file-name-a").val($(this).val());
	})
	$(".table-con").on("click",'.xz-btn-b',function(){
		$(this).siblings(".file-info-b").trigger('click');
	})
	$(".table-con").on("change",'.file-info-b',function(){
		$(this).siblings(".file-name-b").val($(this).val());
	})
	$(".table-con").on("click",'.xz-btn-c',function(){
		$(this).siblings(".file-info-c").trigger('click');
	})
	$(".table-con").on("change",'.file-info-c',function(){
		$(this).siblings(".file-name-c").val($(this).val());
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
    //时间监听
    $("#dd .date-items").on("click",'li',function(){
		$("#dt").parent("li").find(".err").html('√').css("color","#green");
		
	})
	$("#dt").focus(function(){
		if($(this).val()==""){
			$(this).parent("li").find(".err").html('输入不能为空');
		}
	})

	$("#dd-b .date-items").on("click",'li',function(){
		var date = new Date();
		year = date.getFullYear();
		months = date.getMonth()+1
		days = date.getDate()	
		var t = setTimeout(function(){
			var sh = $("#dt-b").val();
			var attr = sh.split("-");
				if(attr[0]>=year && attr[1]>months){
					$("#dt-b").val('');
					$("#dt-b").parent("li").find(".err").html('输入不能为空');
				}else{
					if(attr[0]==year && attr[1]==months && attr[2]>days){
						$("#dt-b").val('');	
						$("#dt-b").parent("li").find(".err").html('输入不能为空');
						$("#dt-b").parent("li").find(".err").css("color","red")
					}
				}
			
		},10);
		setTimeout(function(){
			if($("#dt-b").val()!==""){
				$("#dt-b").parent("li").find(".err").html('√');
				$("#dt-b").parent("li").find(".err").css("color","green")
			}
		},10)
	})
/*    //毒素菌株信息
	$(".add-con").on("focus",".sample",function(){
		$(".sample").each(function(){
				if($(this).val() =="" ){
					$(this).siblings(".err").text("内容不能为空")
				};
		})
	})
	$(".add-con").on("blur",".sample",function(){
		$(".sample").each(function(){
				if($(this).val() !=="" ){
					$(this).siblings(".err").text("√").css("color","#0f0")
				}else{
					$(this).siblings(".err").text("内容不能为空").css("color","#f00")
				};
		})
	});
		$(".add-con").on("focus",".num",function(){
		$(".num").each(function(){
				if($(this).val() =="" ){
					$(this).siblings(".err").text("内容不能为空")
				};
		})
	})
	$(".add-con").on("blur",".num",function(){
		$(".num").each(function(){
				if($(this).val() !=="" ){
					$(this).siblings(".err").text("√").css("color","#0f0")
				}else{
					$(this).siblings(".err").text("内容不能为空").css("color","#f00")
				};
		})
	})*/
});
