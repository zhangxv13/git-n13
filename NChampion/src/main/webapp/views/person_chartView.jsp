<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>图表查看</title>

<link rel="stylesheet" href="../static/css/p_chartView.css" />
<link rel="stylesheet" href="../static/css/p_regionalDistribution.css" />
<link rel="stylesheet" type="text/css" href="../static/css/reset.css" />

</head>
<script type="text/javascript" src="../static/js/jquery.js"></script>
<script type="text/javascript" src="../static/js/echarts.min.js"></script>
<script type="text/javascript" src="../static/js/person_aa.js" ></script>
<script type="text/javascript" src="../static/js/hover.js" ></script>

<body>

	<!-- 内容顶部路由页显示  -->
	<p class="top_url_box box">
		<span>当前页面 ：</span><a>图表查看</a>
	</p>
	<article class="arcbox box">
		<form action="" method="post">
			<span class="nzw_zl">农作物大类别 </span> 
			<select id="allcan" name="nzw_spacies" class="nzw_spacies">
				<option value="">--请选择--</option>
			</select> 
			<span class="nzw_zl">农作物种类 </span> 
			<select id="nzw_spacies" name="nzw_spacies" class="nzw_spacies">
				<option value="">--请选择--</option>
			</select> 
			
			
			<!-- 省市县下拉框 -->
			<span>地区</span>
			<span class="region">
			<select id="shen" name="province" class="province" onchange="changeShen(this.value,'shen','shi','xian')">
				<option value="">请选择</option>
			</select>
			<!-- 时间下拉框 -->
			<span>年份 </span>
			<span class="data_ymd">
			<select id="year" name="year" class="year" onchange="changeYear()">
				<option selected="" value="">请选择</option>
			</select>
			
			<span>污染率 </span> 
			<select id="pollutionRate" name="pollutionRate" class="pollutionRate">
				<option value="0-20">0~20%</option>
				<option value="21-40">21~40%</option>
				<option value="41-60">41~60%</option>
				<option value="61-80">61~80%</option>
				<option value="81-100">81~100%</option>
				<option value="0-100">0~100%</option>
			</select>
			<input class="search" type="button" value="搜索" id="find">
		
	</span></span></form></article>
	<article class="echartmap">
		
		<div id="main" class="echart_map" _echarts_instance_="ec_1521172575568" style="-webkit-tap-highlight-color: transparent; user-select: none;"><div style="position: relative; overflow: hidden; width: 940px; height: 695px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"></div></div>
		<script type="text/javascript" src="/glory/static/js/linkage3_.js"></script>
		<script type="text/javascript">
			var myChart = echarts.init(document.getElementById('main'));
			var arr=null;
			var arry=null;
			var nub =new Array();
			var tox=new Array();
			var tx=new Array();
			$("#find").click(function(){
				if(confirm("是否要搜索")){
					var cate = $("#allcan").val();
					var spe = $("#nzw_spacies").val();
					var prov = $("#shen").val();
					var pol = $("#pollutionRate").val();
					var ye = $("#year").val();
					$.ajax({
						url:'<%=basePath%>chartsp',
						data:{'id':cate,'crop_species':spe,'pollution_rate':pol,'province':prov,'input_time':ye},
						type:'post',
						dataType:'json',
						success:function(data){
							nub.length = 0;
							tox.length = 0;
							for(var i = 0;i<data.samp.length;i++){
								nub[i] = data.samp[i].sampleid;
							}
							for(var i = 0;i<data.tx.length;i++){
								tx.length=0;
								for(var j = 0;j<data.samp.length;j++){
									if(data.samp[j].txinfo.hasOwnProperty(i)){
										tx[j]=data.samp[j].txinfo[i].toxinCount+"";
									}else{
										tx[j]="0";
									} 
								}
								tx=[tx];
								tox[i] ={name:data.tx[i].toxintype,type:'bar',data: tx[0]};
							}
								var sum=0;
								for(var i =0;i<tox.length;i++){
									sum=0;
									for(var j = 0;j<tox[i].data.length;j++){
										sum+=parseFloat(tox[i].data[j]);						
									}
									
									if(sum==0){
										delete tox[i];
									}
								}	
								ct();
						}
					})
				}
			})
			$(function(){
				$.ajax({
					url:'<%=basePath%>findcategory',
					type:'post',
					dataType:'json',
					success:function(data){
						var c;
						for(var i = 0;i<data.length;i++){
							c+='<option value="'+data[i].id+'">'+data[i].cropCategory+'</option>';
						}
						$("#allcan").append(c);
					}
				})
					ct();
				})
				$("#allcan").change(function(){
					var cid = $("#allcan").val();
					$.ajax({
						url:'<%=basePath%>findprov',
						type:'post',
						dataType:'json',
						data:{'id':cid},
						success:function(data){
							$("#shen").empty();
							var p;
							p+='<option value="0">请选择</option>';
							for(var i = 0;i<data.length;i++){
								p+='<option value="'+data[i].code+'">'+data[i].name+'</option>';
							}
							$("#shen").append(p);
						}
					})
					$.ajax({
						url:'<%=basePath%>findspecies',
						type:'post',
						dataType:'json',
						data:{'id':cid},
						success:function(data){
							$("#nzw_spacies").empty();
							var s;
							s+='<option value="0">请选择</option>';
							for(var i = 0;i<data.length;i++){
								s+='<option value="'+data[i].id+'">'+data[i].cropSpecies+'</option>';
							}
							$("#nzw_spacies").append(s);
						}
					})
					$.ajax({
						url:'<%=basePath%>findyear',
						type:'post',
						dataType:'json',
						data:{'id':cid},
						success:function(data){
							$("#year").empty();
							var y;
							y+='<option value="0">请选择</option>';
							for(var i = 0;i<data.length;i++){
								y+='<option value="'+data[i]+'">'+data[i]+'</option>';
							}
							$("#year").append(y);
						}
					})
				})
				function ct(){
					console.log(tox)
					var option={
						legend:{data:[]},
						tooltip:{trigger:'axis'},
						itemStyle:{
									normal:{
											color:function(params){
												var colorList = ['#EFE42A','#64BD3D','#EE9201','#29AAE3', '#B74AE5','#0AAF9F','#E89589','#Edd201','#29ccE3','#B7aaE5','#0fde9F','#444666'];
												return colorList[params.dataIndex];
											}, 
											label:{show:false} 
									} 
						},
						yAxis: {},
						xAxis: {data : [''],axisLabel:{interval: 0}},
						series: []
				};
					option = {
						title : {
							text: '毒素含量统计图',

						},
						tooltip : {
							trigger: 'axis'
						},
						legend: {
							data:['毒素含量']
						},
						toolbox: {
							show : true,
							feature : {
								mark : {show: true},
								dataView : {show: true, readOnly: false},
								magicType : {show: true, type: ['line', 'bar']},
								restore : {show: true},
								saveAsImage : {show: true}
							}
						},
						calculable : true,
						xAxis : [
							{
								type : 'category',
								data : nub
							}
						],
						yAxis : [
							{
								type : 'value'
							}
						],
						series : tox
					};
					myChart.clear();
					myChart.setOption(option);
				}
		</script>
	</article>
</body>
</html>
