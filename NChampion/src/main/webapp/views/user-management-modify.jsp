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
<link rel="stylesheet" href="<%=path %>/static/css/user-management-modify.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/calendar.css"/>
<script type="text/javascript" src="<%=path %>/static/js/jquery1.11.3-jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/checkUserUpdateForm.js" charset="utf-8"></script>
<script src="<%=path %>/static/js/calendar.js"></script>
<style>
.title {
	height: 0px;
}	
.xxgl{
	display: none;
}
</style>
</head>
<body>
<div class="xtgl"> <a class="dall dactive public" href="findAllUser">用户管理</a> <a class="chart public" href="findAllCategory">类别管理</a> <a class="mps public" href="findAlltoxins">毒素管理</a> </div>
<div class="user-content">
  <p class="user-admin"> <span>当前页面 : </span> <a>用户管理/</a><a>修改用户</a></p>
  <form action="updateuser" id="form1" method="post">
    <input type="hidden" name="id" id="idd" value="${showupdata.id }">
    <input type="hidden" name="roleid" value="${showupdata.role }">
    <div class="user-modify-infolist">
      <p class="user-modify-title">修改用户</p>
      <ul class="modify-list">
        <li class="list-item">
          <label>登录名</label>
          <input type="text" name="loginName" value="${showupdata.loginName }">
          <span id="login_name"></span> </li>
        <li class="list-item">
          <label>密码</label>
          <input type="text" name="password" value="${showupdata.password }">
          <span id="password"></span> </li>
        <li class="list-item">
          <label>用户名</label>
          <input type="text" name="username" value="${showupdata.username }">
          <span id="username"></span> </li>
        <li class="list-item">
          <label>状态</label>
          
          		<input type="radio" name="state" value="1" <c:if test="${showupdata.state==1}">checked="checked"</c:if>>
          	 启用

       			<input type="radio" name="state" value="0" <c:if test="${showupdata.state==0}">checked="checked"</c:if>>
       		 禁用

           <span id="state"></span> </li>
        <li class="list-item">
          <label>角色</label>
          <input type="text" name="" id="s1" value="${showupdata.roleinfo.chrole }" readonly>
          <span style="color: red">*角色不允许修改</span> <span id="role"></span>
          <div class="xxgl" style="<c:if test="${showupdata.role==rid}">display:block;</c:if>">
            <div>
              <div class="title">种类：</div>
              <div class="zl">
                <ul>
                  	  <c:forEach items="${crops }" var="crop">
                  	  		<li><input type="checkbox"
                  	  			<c:forEach items="${lcategory }" var="lc">
                					<c:if test="${lc==crop.id }">checked="checked"</c:if>
                				</c:forEach>
                  	  		  name="category" value="${crop.id }">${crop.cropCategory }</li>
                  	  </c:forEach> 
                </ul>
              </div>
            </div>
            <div style="clear:both">
              <div class="address">地点：</div>
              <div class="address-con">
                <ul>
                  	  <c:forEach items="${provinces }" var="province">
					  		<li><input type="checkbox" name="area" 
					  			<c:forEach items="${larea }" var="la">
                					<c:if test="${la==province.id }">checked="checked"</c:if>
                				</c:forEach>
					  		value="${province.id }"><span>${province.name }</span></li>
					  </c:forEach>
                </ul>
              </div>
            </div>
            <div class="time">
              <div class="begin">开始时间：
                <input type="" name="stime" id="dt" value="${showupdata.stime }" readonly placeholder="选择日期">
                <div id="dd" class="calendar calendar-modal calendar-d" style="width: 280px; height: 330px; left: 544.641px; top: 592px; z-index: 999;">
                  <div class="calendar-inner" style="width: 280px;">
                    <div class="calendar-views">
                      <div class="view view-date" style="width: 280px;">
                        <div class="calendar-hd"><a href="javascript:;" data-calendar-display-date="" class="calendar-display">2018/<span class="m">3</span></a>
                          <div class="calendar-arrow"><span class="prev" title="上一月" data-calendar-arrow-date="">&lt;</span><span class="next" title="下一月" data-calendar-arrow-date="">&gt;</span></div>
                        </div>
                        <div class="calendar-ct" style="width: 280px; height: 280px;">
                          <ol class="week">
                            <li style="width:40px;height:40px;line-height:40px">日</li>
                            <li style="width:40px;height:40px;line-height:40px">一</li>
                            <li style="width:40px;height:40px;line-height:40px">二</li>
                            <li style="width:40px;height:40px;line-height:40px">三</li>
                            <li style="width:40px;height:40px;line-height:40px">四</li>
                            <li style="width:40px;height:40px;line-height:40px">五</li>
                            <li style="width:40px;height:40px;line-height:40px">六</li>
                          </ol>
                          <ul class="date-items">
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">10</li>
                              </ol>
                            </li>
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class=" now" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">7</li>
                              </ol>
                            </li>
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                              </ol>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <div class="view view-month" style="width: 280px;">
                        <div class="calendar-hd"><a href="javascript:;" data-calendar-display-month="" class="calendar-display">2018</a>
                          <div class="calendar-arrow"><span class="prev" title="上一年" data-calendar-arrow-month="">&lt;</span><span class="next" title="下一年" data-calendar-arrow-month="">&gt;</span></div>
                        </div>
                        <ol class="calendar-ct month-items" style="width: 280px; height: 280px;">
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">1月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">2月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="" class="now">3月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">4月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">5月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">6月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">7月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">8月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">9月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">10月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">11月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">12月</li>
                        </ol>
                      </div>
                    </div>
                  </div>
                  <div class="calendar-label">
                    <p>HelloWorld</p>
                    <i></i></div>
                </div>
              </div>
              <div class="end">结束时间：
                <input type="" name="etime" id="dt-b" value="${showupdata.etime }" readonly placeholder="选择日期">
                <div id="dd-b" class="calendar calendar-modal calendar-d" style="width: 280px; height: 330px; left: 544.641px; top: 634px; z-index: 999;">
                  <div class="calendar-inner" style="width: 280px;">
                    <div class="calendar-views">
                      <div class="view view-date" style="width: 280px;">
                        <div class="calendar-hd"><a href="javascript:;" data-calendar-display-date="" class="calendar-display">2018/<span class="m">3</span></a>
                          <div class="calendar-arrow"><span class="prev" title="上一月" data-calendar-arrow-date="">&lt;</span><span class="next" title="下一月" data-calendar-arrow-date="">&gt;</span></div>
                        </div>
                        <div class="calendar-ct" style="width: 280px; height: 280px;">
                          <ol class="week">
                            <li style="width:40px;height:40px;line-height:40px">日</li>
                            <li style="width:40px;height:40px;line-height:40px">一</li>
                            <li style="width:40px;height:40px;line-height:40px">二</li>
                            <li style="width:40px;height:40px;line-height:40px">三</li>
                            <li style="width:40px;height:40px;line-height:40px">四</li>
                            <li style="width:40px;height:40px;line-height:40px">五</li>
                            <li style="width:40px;height:40px;line-height:40px">六</li>
                          </ol>
                          <ul class="date-items">
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">10</li>
                              </ol>
                            </li>
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class=" now" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">7</li>
                              </ol>
                            </li>
                            <li style="width: 280px;">
                              <ol class="days">
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="old" data-calendar-day="">31</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">5</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">6</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">7</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">8</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">9</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">10</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">11</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">12</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">13</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">14</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">15</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">16</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">17</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">18</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">19</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">20</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">21</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">22</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">23</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">24</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">25</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">26</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">27</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">28</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">29</li>
                                <li style="width:40px;height:40px;line-height:40px" class="" data-calendar-day="">30</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">1</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">2</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">3</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">4</li>
                                <li style="width:40px;height:40px;line-height:40px" class="new" data-calendar-day="">5</li>
                              </ol>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <div class="view view-month" style="width: 280px;">
                        <div class="calendar-hd"><a href="javascript:;" data-calendar-display-month="" class="calendar-display">2018</a>
                          <div class="calendar-arrow"><span class="prev" title="上一年" data-calendar-arrow-month="">&lt;</span><span class="next" title="下一年" data-calendar-arrow-month="">&gt;</span></div>
                        </div>
                        <ol class="calendar-ct month-items" style="width: 280px; height: 280px;">
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">1月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">2月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="" class="now">3月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">4月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">5月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">6月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">7月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">8月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">9月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">10月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">11月</li>
                          <li style="width:70px;height:70px;line-height:70px" data-calendar-month="">12月</li>
                        </ol>
                      </div>
                    </div>
                  </div>
                  <div class="calendar-label">
                    <p>HelloWorld</p>
                    <i></i></div>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
      <div class="modify-option"> <a class="user-modify" onclick="sub()">修改</a><a class="modify-back" onclick="history.go(-1)">返回</a> </div>
    </div>
  </form>
</div>
</body>
<script type="text/javascript">
	function sub(){
		document.getElementById("form1").submit();
	}
</script>
</html>
