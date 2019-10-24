$(function(){
   
    var cusindex = {
        init:function(){
        	this.examine();
        },
        //查看审核状态，ifexamine
        
        examine:function(){
        	$("td.ifexamine").each(function(){
        	    var ele =  $(this);
        	    if(ele.html() !== "通过"){
        	    	ele.parent().find("td.operation .ifshow1").remove();
        	    }else{
        	    	ele.parent().find("td.operation .ifshow").remove();
        	    }
        	});
        }
        
        
        
    }
    cusindex.init();
})
