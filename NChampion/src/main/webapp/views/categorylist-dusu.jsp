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
    
   <title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/conmen-header.css"/>
<link rel="stylesheet" href="<%=path%>/static/css/reset.css" />
<link rel="stylesheet" href="<%=path%>/static/css/dlb.css" />
<link rel="stylesheet" href="<%=path%>/static/css/page-con.css" />
</head>
<body>
<div class="xtgl"> 
<a class="dall public" href="findAllUser">用户管理</a>
<a class="chart public" href="findAllCategory">类别管理</a>
<a class="mps public dactive" href="findAlltoxin">毒素管理</a>
</div>
<div class="user-content">
  <p class="user-admin"><span>当前页面 : </span><a href="findAlltoxin" style="color: #58a0fd">毒素管理</a></p>
  <div class="user-search">
    <p><a class="user-add" href="views/toxinadd.jsp">新增毒素</a></p>
  </div>
  <table class = "user-info">
    <tr class="info-first info-item">
      <td>序号</td>
      <td>大类别名称</td>
      <td>操作</td>
    </tr>
   <c:forEach items="${toxins.list }" var="tx">
   		<tr class="info-item">
	      <td>${tx.id }</td>
	      <td>${tx.toxintype }</td>
	      <td><a href="showtoxin?id=${tx.id }" class="edit">编辑</a><a onclick="delte(${tx.id })" class="delete">删除</a></td>
    	</tr>
   </c:forEach>
  </table>
   <div class="pageing-con">
    <ul class="pageing-info">
      <li class="pageing-item head"><a data-id="" onclick="cp(1)" title="">首页</a></li>
      <li class="pageing-item prev"><a data-id="" onclick="cp(${toxins.current==1?1:toxins.current-1})" title="">上一页</a></li>
      <c:if test="${toxins.pagenumber<=5 }">
      	<c:forEach begin="1" end="${toxins.pagenumber }" var="number">
      		<li class="pageing-item  disabled  <c:if test="${number==toxins.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      	</c:forEach>
      </c:if>
      <c:if test="${toxins.pagenumber>5 }">
      	<c:if test="${toxins.pagenumber%5==0 }">
      		<c:forEach begin="${toxins.colnumber*5+1 }" end="${toxins.colnumber*5+5 }" var="number">
      			<li class="pageing-item  disabled  <c:if test="${number==toxins.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      		</c:forEach>
      	</c:if>
      	<c:if test="${toxins.pagenumber%5 != 0 }">
      	
      		<c:if test="${toxins.colnumber+1 <=(toxins.pagenumber-toxins.pagenumber%5)/5 }">
      			<c:forEach begin="${toxins.colnumber*5+1 }" end="${toxins.colnumber*5+5 }" var="number">
      				<li class="pageing-item  disabled  <c:if test="${number==toxins.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      		<c:if test="${toxins.colnumber+1 > (toxins.pagenumber-(toxins.pagenumber%5))/5 }">
      			<c:forEach begin="${toxins.colnumber*5+1 }" end="${toxins.colnumber*5+toxins.pagenumber%5 }" var="number">
      				<li class="pageing-item  disabled  <c:if test="${number==toxins.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      	</c:if>
      </c:if>
      <li class="pageing-item next"><a data-id="" onclick="cp(${toxins.current==toxins.pagenumber?toxins.pagenumber:toxins.current+1})" title="">下一页</a></li>
      <li class="pageing-item foot"><a data-id="" onclick="cp(${toxins.pagenumber })" title="">尾页</a></li>
    </ul>
  </div>
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript">
	  function delte(id){
	    if(confirm("你确定要删除吗？")){
	      $.post("deletetoxinx",{"id":id},function(data){
	       		window.location.reload();
	       })
	    }else{
	       return false;
	    }
	  }
   	  function cp(num){
		window.location.href="findAlltoxin?pagenumber="+num;
	  }
	</script>
</div>
</body>

</html>
