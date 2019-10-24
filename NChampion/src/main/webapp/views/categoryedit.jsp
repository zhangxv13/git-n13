<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
 <title>修改用户</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/conmen-header.css"/>
<link rel="stylesheet" href="<%=path %>/static/css/reset.css" />
<link rel="stylesheet" href="<%=path %>/static/css/editdlb.css" />
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>

<div class="xtgl"> <a class="dall user" href="findAllUser">用户管理</a><a class="chart leibie dactive" href="findAllCategory">类别管理</a><a class="mps public" href="findAlltoxin">毒素管理</a> </div> 
<div class="user-content">
  <p class="user-admin"><span>当前页面 : </span><a href="findAllCategory">大类别管理/</a><a>修改类别</a></p>
  <div class="user-modify-infolist">
    <p class="user-modify-title">修改类别</p>
    <form action="updateCategory" method="post" id="form1">
    	<ul class="modify-list">
    		  <input type="hidden" name="id" value="${category.id }"/>
		      <li class="list-item">
		        <label>大类别名称</label>
		        <input type="text" value="${category.cropCategory }" name="cropCategory" id="speciesname"/>
		      </li>
		      <li class="list-item">
		        <label>状态</label>
		        <input type="radio" name="state" value="1" <c:if test="${category.state==1 }">checked="checked"</c:if> />
		        启用
		        <input type="radio" name="state" value="0" <c:if test="${category.state==0 }">checked="checked"</c:if>/>
		        禁用 </li>
    	</ul>
    </form>
    <div class="modify-option"> <a class="user-modify" onclick="up()">修改</a><a class="modify-back" onClick="history.go(-1)">返回</a> </div>
  </div>
  <div>
    <div class="addlb"><a href="tospadd?cid=${category.id }">新增类别</a></div>
    <table class="user-info">
				<tbody><tr class="info-first info-item">
					<td>序号</td>
					<td>类别名称</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${species }" var="specie">
					<tr class="info-item">
						<td>${specie.id }</td>
						<td>${specie.cropSpecies}</td>
						<td><a href="tospedit?cid=${category.id }&id=${specie.id}" class="edit">编辑</a><a onclick="delte(${specie.id })" class="delete">删除</a></td>
					</tr>
				</c:forEach>
			</tbody></table>
    
  </div>
</div>
<script type="text/javascript">
	  function delte(id){
	    if(confirm("你确定要删除吗？")){
	       window.location.href="deletespecies?id="+id+"&cid="+${category.id};
	    }else{
	       return false;
	    }
	  }
	   function up(){
		   var speciesname=$("#speciesname").val();
		   var url="isexist";
		   var state = $("input[name='state']:checked").val();
		   var parms={"speciesname":speciesname};
		   $.post(url,parms,
		   		function(date){
			      if(date=="false" || state!=${category.state }){
			        document.getElementById("form1").submit();
			      }else{
			        alert("该类别已经存在！");
			        return false;
			      }
		   })
		   }
	</script>
</body>
</html>
