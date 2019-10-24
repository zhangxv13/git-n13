<%@page import="util.COUNT"%>
<%@page import="bean.PageBaen"%>
<%@page import="service.UserService"%>
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
    
    <title>系统管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/conmen-header.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/reset.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/user-management-index.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/page-con.css" />
<script src="<%=basePath%>/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function cp(num){
		var name = document.getElementById("user_name").value;
		window.location.href="findAllUser?pagenumber="+num+"&name="+name;
	}
	function search_user() {
		var name = document.getElementById("user_name").value;
		window.location.href="findAllUser?name="+name;
		
	}
</script>

</head>
<body>
<div class="xtgl"> 
<a class="dall dactive public" href="findAllUser">用户管理</a>
<a class="chart public" href="findAllCategory">类别管理</a>
<a class="mps public" href="findAlltoxin">毒素管理</a>
</div>
<div class="user-content">
 <p class="user-admin"><span>当前页面 : </span><a>用户管理</a></p>
  <div class="user-search">
    <label>用户名</label>
    <input type="text" id = "user_name" value="${sname }">
    <a  class="search-btn" onclick="search_user()">搜索</a> 
    <a class="user-add" href="toaddUser">新增用户</a> </div>
  <table class = "user-info">
    <tr class="info-first info-item">
      <td>序号</td>
      <td>登录名</td>
      <!-- <td>密码</td> -->
      <td>用户名</td>
      <td>角色</td>
      <td>创建时间</td>
      <td>创建人</td>
      <td>状态</td>
      <td>操作</td>
    </tr>
    <c:forEach items="${users.list }" var="user">
	    <tr class="info-item">
	      <td>${user.id}</td>
	      <td>${user.loginName}</td>
	      <td>${user.username}</td>
	      <td>${user.roleinfo.chrole }</td>
	      <td>${user.createtime}</td>
	      <!-- 1系统管理员，2信息管理员，3客户管理员，4信息权限管理员，5客户 -->
	      <td>${user.uc.createpeople}</td>
	      <c:if test="${user.state==1}"><td>启用</td></c:if>
	      <c:if test="${user.state==0}"><td>禁用</td></c:if>
	      <td><a href="showupdateUser?id=${user.id }" class="edit">编辑</a><a href="javascript:if(confirm('确实要删除吗?'))location='deleteUserById?id=${user.id}'" class="delete">删除</a></td>
	    </tr>
    </c:forEach>
   </table>
  <div class="pageing-con">
    <ul class="pageing-info">
      <li class="pageing-item head"><a data-id="" onclick="cp(1)" title="">首页</a></li>
      <li class="pageing-item prev"><a data-id="" onclick="cp(${users.current==1?1:users.current-1})" title="">上一页</a></li>
      <c:if test="${users.pagenumber<=5 }">
      	<c:forEach begin="1" end="${users.pagenumber }" var="number">
      		<li class="pageing-item  disabled  <c:if test="${number==users.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      	</c:forEach>
      </c:if>
      <c:if test="${users.pagenumber>5 }">
      	<c:if test="${users.pagenumber%5==0 }">
      		<c:forEach begin="${users.colnumber*5+1 }" end="${users.colnumber*5+5 }" var="number">
      			<li class="pageing-item  disabled  <c:if test="${number==users.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      		</c:forEach>
      	</c:if>
      	<c:if test="${users.pagenumber%5 != 0 }">
      	
      		<c:if test="${users.colnumber+1 <=(users.pagenumber-users.pagenumber%5)/5 }">
      			<c:forEach begin="${users.colnumber*5+1 }" end="${users.colnumber*5+5 }" var="number">
      				<li class="pageing-item  disabled  <c:if test="${number==users.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      		<c:if test="${users.colnumber+1 > (users.pagenumber-(users.pagenumber%5))/5 }">
      			<c:forEach begin="${users.colnumber*5+1 }" end="${users.colnumber*5+users.pagenumber%5 }" var="number">
      				<li class="pageing-item  disabled  <c:if test="${number==users.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      	</c:if>
      </c:if>
      <li class="pageing-item next"><a data-id="" onclick="cp(${users.current==users.pagenumber?users.pagenumber:users.current+1})" title="">下一页</a></li>
      <li class="pageing-item foot"><a data-id="" onclick="cp(${users.pagenumber })" title="">尾页</a></li>
    </ul>
  </div>
</div>

</body>


</html>
