<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增类别</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/conmen-header.css"/>
<link rel="stylesheet" href="<%=path %>/static/css/reset.css" />
<link rel="stylesheet" href="<%=path %>/static/css/adddlb.css" />
</head>
<body>
<div class="xtgl"> <a class="dall public" href="findAllUser">用户管理</a> <a class="chart dactive public" href="findAllCategory">类别管理</a> <a class="mps public" href="findAlltoxins">毒素管理</a> </div>
<div class="user-content">
  <p class="user-admin"><span>当前页面 : </span><a href="findAllCategory">大类别管理/</a><a style="color: #58a0fd">新增类别</a></p>
  <form action="addspecies" method="post">
    <div class="user-add-infolist">
      <p class="user-add-title">新增小类别</p>
      <input type="hidden" name="catgoryid" value="${cid}"/>
      <ul class="add-list">
        <li class="list-item">
          <label>类别名称</label>
          <input type="text" name="cropSpecies" id="speciesname"/>
        </li>
        <li class="list-item">
          <label>状态</label>
          <input type="radio" name="state" value="1" checked="checked" />
          启用
          <input type="radio" name="state" value="0" />
          禁用 </li>
      </ul>
      <div class="add-option"> <a class="user-save" onclick="baocun()">保存</a><a class="add-back" onclick="history.go(-1)">返回</a> </div>
    </div>
  </form>
</div>
</body>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	  function baocun(){
	  var tonxinname=$("#speciesname").val();
	  var url="isexitsp";
	  var parms={"toxinname":tonxinname};
	  $.post(url,parms,function(date){
	      if(date=="false"){
	      	document.forms[0].submit();
	      }else{
	         alert("该类别已经存在");
	         return false;
	      }
	  });
	    
	  }
	</script>
</html>