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
<link rel="stylesheet" href="<%=path %>/static/css/dlb.css" />
<link rel="stylesheet" href="<%=path %>/static/css/page-con.css" />
<link rel="stylesheet" href="<%=path %>/static/css/reset.css" />
<link rel="stylesheet" href="<%=path %>/static/css/editdlb.css" />
</head>
<body>
<div class="xtgl"> 
	<a class="dall public" href="findAllUser">用户管理</a>
	<a class="chart public" href="findAllCategory">类别管理</a>
	<a class="mps public dactive" href="findAlltoxin">毒素管理</a>
</div>
<div class="user-content">
  <p class="user-admin"><span>当前页面 : </span><a href="findAlltoxin">毒素管理/</a><a>修改毒素</a></p>
  <div class="user-modify-infolist">
  <p class="user-modify-title">修改毒素</p>
  <form action="updatetoxin" method="post">
    <ul class="modify-list">
      <input type="hidden" name="id" value="${toxin.id }"/>
      <li class="list-item">
        <label>毒素名称</label>
        <input type="text" name="toxintype" value="${toxin.toxintype }" id="speciesname" />
      </li>
      <li class="list-item">
        <label>状态</label>
          <input type="radio" name="state" value="1" <c:if test="${toxin.state==1 }">checked="checked"</c:if> />
          启用
          <input type="radio" name="state" value="0" <c:if test="${toxin.state==0 }">checked="checked"</c:if> />
          禁用 
       
    </ul>
    <div class="modify-option"> <a class="user-modify" onclick="xiugai()">修改</a><a class="modify-back" onclick="history.go(-1)">返回</a> </div>
  </form>
</div>
</div>
</body>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	   function xiugai(){
		  var tonxinname=$("#speciesname").val();
		  var url="isexittx";
		  var state = $("input[name='state']:checked").val();
		  var parms={"toxinname":tonxinname};
		  $.post(url,parms,function(date){
		      if(date=="false" || state!=${toxin.state }){
		      	document.forms[0].submit();
		      }else{
		         alert("该毒素已经存在");
		         return false;
		      }
		  });
	   }
	</script>
</html>
