var obj=$(".jlei");
 var myChart = echarts.init(document.getElementById('main'));
/* var arr=[
		{
			title:'样品a',
		data:[
			{'name':'真菌污染率','value':223,'scalar':10},
			{'name':'DON','value':12,'scalar':20},
			{'name':'伏马菌素','value':18,'scalar':30},
			{'name':'玉米赤霉烯酮','value':70,'scalar':40},
			{'name':'黄曲霉毒素总量','value':35,'scalar':50},
			{'name':'黄曲霉毒素B1','value':82,'scalar':60},
			{'name':'黄曲霉毒2','value':36,'scalar':70},
			{'name':'黄曲霉毒素G1','value':58,'scalar':120},
			{'name':'黄曲霉毒素G2','value':200,'scalar':110},
			{'name':'黄曲霉毒素M1','value':25,'scalar':100},
			{'name':'黄曲霉毒素M2','value':35,'scalar':90},
			{'name':'赭曲霉毒素A','value':65,'scalar':80}]
		}];*/
option ={
    legend: {
        data:[]
    },
    tooltip : {
        trigger: 'axis'
    },
    itemStyle: { 
		normal: { 
			color: function(params) { 
				var colorList = [ 
				'#C33531','#EFE42A','#64BD3D','#EE9201','#29AAE3', 
				'#B74AE5','#0AAF9F','#E89589','#Edd201','#29ccE3', 
				'#B7aaE5','#0fde9F','#444666'
				]; 
				return colorList[params.dataIndex] ;
			}, 
	　　　　　//以下为是否显示 
			label: { 
				show: false 
			} 
		} 
	},
    xAxis: {  
    },
    yAxis: {
    	data : ['','','','','','','','','','','','','',''],
    	axisLabel:{interval: 0}
    },
    series: []
    
}
for(var k=0;k<arr.length;k++){
	var objectr={
        name:'',
        type:'bar',
        
        data:[0,0,0,0,0,0,0,0,0,0,0,0,0],
        markLine : {  
            data : [  
				{
					xAxis:0,
					itemStyle: {
						normal:{
							
							lineStyle:{
								type:'solid',
								color:'#C33531',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#EFE42A',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#64BD3D',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#EE9201',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#29AAE3', 
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#B74AE5',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#0AAF9F',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#E89589',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#Edd201',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#29ccE3', 
				
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#B7aaE5',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#0fde9F',
								width:1
							}
						}
					},
				},
				{
					xAxis:0,
					itemStyle: {
						normal:{
							borderWidth:1,
							lineStyle:{
								type:'solid',
								color:'#444666',
								width:1
							}
						}
					},
				}
            ]  
        }
            
    };
	option.legend.data.push(arr[k].title);
	option.series.push(objectr);
	
}
$('.jlei').click(function(){　
	/*var widtha=arr.length*300;
	$('.echart_map').prop('height',widtha);
	alert($('.echart_map').height());*/
	for(var j=0;j<arr.length;j++){
		
		option.series[j].name=arr[j].title;
		
		for(var i=0;i<13;i++){
			option.legend.data[j]=arr[j].title;
			if($(this).parent().html()==$('.jlei').eq(i).parent().html()){
			
				if($(this).prop('checked')==true){
					
					
					option.yAxis.data[i]=arr[j].data[i].name;
					option.series[j].data[i]=arr[j].data[i].value;
					option.series[j].markLine.data[i].xAxis=arr[j].data[i].scalar;
					$(this).prop('checked',true);
	  				
				}else{
					option.legend.data[j]="";
					option.yAxis.data[i]='';
					option.series[j].data[i]=0;
					option.series[j].markLine.data[i].xAxis=0;
					$(this).prop('checked',false);
	  				
				}
				 
			
				
	  		}
		}　
		
	}
	myChart.setOption(option); 
});
myChart.setOption(option); 

     		 
     		  
     		  
     		  
