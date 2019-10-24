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
<link rel="stylesheet" href="<%=path %>/static/css/adddlb.css" />
</head>
<body>
<div class="xtgl"> <a class="dall user" href="findAllUser">用户管理</a><a class="chart leibie dactive" href="findAllCategory">类别管理</a><a class="mps public" href="findAlltoxin">毒素管理</a> </div> 
<div class="user-content">
  <p class="user-admin"><span>当前页面 : </span><a href="findAllCategory">大类别管理/</a><a>修改类别</a></p>
  <div class="user-modify-infolist">
    <p class="user-modify-title">修改类别</p>
    <form action="updatespecies" method="post">
      <ul class="modify-list">
        <input type="hidden" name="catgoryid" value="${species.catgoryid }" />
        <input type="hidden" name="id" value="${species.id }" />
        <li class="list-item">
          <label>类别名称</label>
          <input type="text" name="cropSpecies" id="specie" value="${species.cropSpecies }"/>
        </li>
        <li class="list-item">
          <label>状态</label>
            <input type="radio" name="state" value="1" <c:if test="${species.state==1 }">checked="checked"</c:if> />
            启用
            <input type="radio" name="state" value="0" <c:if test="${species.state==0 }">checked="checked"</c:if>/>
            禁用 
         
        </li>
      </ul>
      <div class="modify-option"> <a class="user-modify" onclick="xiugai()">修改</a><a class="modify-back" onclick="history.go(-1)">返回</a> </div>
    </form>
  </div>
</div>
<script type="text/javascript">
	   function xiugai(){
		   var speciesname=$("#specie").val();
		   var state = $("input[name='state']:checked").val();
		   var url="isexitsp";
		   var parms={"toxinname":speciesname};
		   $.post(url,parms,
		   		function(date){
			      if(date=="false" || state!=${species.state}){
			        document.forms[0].submit();
			      }else{
			        alert("该类别已经存在！");
			        return false;
			      }
		   })
	   }
	</script>
	
	</body>

</html>
