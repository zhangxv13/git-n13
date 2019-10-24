<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<title></title>
<style>
body {
	background-color: #f4f9ff;
}
* {
	margin: 0;
	padding: 0;
}
ul {
	list-style-type: none;
}
.info_food {
	width: 1100px;
	margin: 0 auto;
	margin-top: 53px;
}
.info_food .info_item {
	font-size: 18px;
	font-family: '宋体';
}
.info_food .info_item .info_item_list {
	height: 60px;
}
.info_food .info_item .info_item_list:nth-child(odd) {
	background: #237ae4;
	color: #fff;
}
.info_food .info_item .info_item_list:nth-child(even) {
	background: #e4e9ee;
}
.info_food .info_item .info_item_list .info_name {
	width: 144px;
	/* margin-right: 100px; */
	line-height: 60px;
	display: inline-block;
	text-align: center;
	float: left;
}
.info_food .info_item .wu .info_name {
	/*margin-right: 85px;*/
	display: inline-block;
}
.info_food .info_item .info_item_list ul {
	display: inline-block;
	width: 956px;
}
.info_food .info_item .info_item_list li {
	float: left;
}
.info_food .info_item .info_item_list li input[type =checkbox] {
	width: 16px;
	height: 16px;
	vertical-align: -2px;
	margin-right: 5px;
}
.info_food .info_item .info_item_list ul li label {
	margin-right: 10px;
}
.btn {
	width: 1100px;
	margin: 0 auto;
	margin-top: 30px;
	text-align: center;
}
.btn .back {
	display: inline-block;
	width: 100px;
	margin-right: 100px;
	height: 40px;
	line-height: 40px;
	text-decoration: none;
	background: #237ae4;
	border-radius: 3px;
	color: #fff;
}
.btn .search {
	display: inline-block;
	width: 100px;
	/* margin-right: 100px; */
	height: 40px;
	line-height: 40px;
	text-decoration: none;
	background: #237ae4;
	border: none;
	border-radius: 3px;
	color: #fff;
}
.yi ul {
	height: 60px;
	line-height: 60px;
}
.er ul {
	height: 60px;
	line-height: 60px;
}
.san ul {
	height: 60px;
	line-height: 60px;
}
.si ul {
	height: 60px;
}
.wu ul {
	height: 60px;
	line-height: 60px;
	font-family: '微软雅黑';
}
.wu li span {
	margin-right: 10px;
}
</style>
</head>
<body>
<div class = "info_food">
<body>
<div class = "info_food">
  <form action="serachinfo" method="post">
   <input type="hidden" name="id" value="${id }"/>
    <div class = "info_item">
      <div class="info_item_list yi active">
        <label class="info_name">类别</label>
        <ul id="cropli">
        	
        </ul>
      </div>
      <div class="info_item_list er">
        <label class="info_name">年份</label>
        <ul id="dates">
          
        </ul>
      </div>
      <div class="info_item_list san">
        <label class="info_name">地区</label>
        <ul id="provs">
      
         </ul>
      </div>
      <div class="info_item_list si">
        <label class="info_name">毒素</label>
        <div class="sids">
          <ul style="margin-top:5px;" id="toxins">
          </ul>
        </div>
      </div>
      <div class="info_item_list wu">
        <label class="info_name">污染率</label>
        <ul>
          <li>
            <input type="radio" name="pollution_rate" id="" value="0-100" />
            <span>0~100%</span> </li>
          <li>
            <input type="radio" name="pollution_rate" id="" value="0-20" />
            <span>0%~20%</span> </li>
          <li>
            <input type="radio" name="pollution_rate" id="" value="20-40" />
            <span>20%~40%</span> </li>
          <li>
            <input type="radio" name="pollution_rate" id="" value="40-60" />
            <span>40%~60%</span> </li>
          <li>
            <input type="radio" name="pollution_rate" id="" value="60-80" />
            <span>60%~80%</span> </li>
          <li>
            <input type="radio" name="pollution_rate" id="" value="80-100" />
            <span>80%~100%</span> </li>
        </ul>
      </div>
    </div>
    <div class="btn"> 
    	<a href="person" class="back">上一页</a>
      	<input class="search" value="搜索" type="submit" />
    </div>
  </form>
</div>
<style type="text/css">
  .search{text-align:center;font-size:16px;}
  .sids li{
  		margin-top: 5px;
  }	
</style>
<script type="text/javascript" src="<%=basePath %>static/js/jquery.js" ></script>
<script type="text/javascript">
	$(function(){
		var locString = location.search.substr(5);
		$.ajax({
			url:'showcondition',
			data:{"id":parseInt(locString)},
			type:'post',
			dataType:'json',
			success:function(data){
				var crop = "";
				var year = "";
				var prov = "";
				var toxin = "";
				for(var i = 0; i < data.species.length;i++){
					crop +='<li><input type="checkbox" name="crop_species" id="crop_species" value="'+data.species[i].id+'" /><label for="shuidao" >'+data.species[i].cropSpecies+'</label></li>'
				}
				for(var i = 0;i<data.years.length;i++){
					year+='<li><input type="checkbox" name="input_time" value="'+data.years[i]+'" ><label for="y'+data.years[i]+'">'+data.years[i]+'</label></li>';
				}
				for(var i = 0;i<data.provs.length;i++){
					prov+='<li><input type="checkbox" name="province" id="'+data.provs[i].code+'" value="'+data.provs[i].code+'" /><label for="'+data.provs[i].chinaname+'">'+data.provs[i].name+'</label></li>';
				}
				for(var i = 0;i<data.toxins.length;i++){
					toxin+='<li><input type="checkbox" name="toxin_type" value="'+data.toxins[i].id+'"/><label for="don">'+data.toxins[i].toxintype+'</label></li>';
				}
				$("#cropli").append(crop);
				$("#dates").append(year);
				$("#provs").append(prov);
				$("#toxins").append(toxin);
			}
		})
	})
</script>
</body>
</html>
