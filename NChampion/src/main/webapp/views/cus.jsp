<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">

    <title>数据浏览</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/p_DataBrowsing.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/page.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/p_header.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/conmen-header.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/examine.css"/>

  <script type="text/javascript" src="<%=basePath %>/static/js/jquery1.11.3-jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>/static/js/browsing.js"></script>
  <script type="text/javascript" src="<%=basePath %>/static/js/linkage4.js"></script>
  <script type="text/javascript" src="<%=basePath %>/static/js/hover.js"></script>
  <style>
     .screens{
        width:1088px;
        padding:4px 0px;
        margin:0 auto;
        padding-bottom:10px;
        border-bottom:1px solid #ccc;
     }
     .screens:after{
        display:block;
        content:'';
        clear:both;
     }
     .screens .screen_left,.screen .screen_right{
        float:left;
        color:#4F6AA8;
        font-size:14px;
     }
     .screens span{
        display:inline-block;
        padding:0px 0px 0px 8px;
        border:1px solid #ddd;
        cursor:pointer;
        margin-right:8px;
     }
     .screens span i{
        font-style:normal;
        display:inline-block;
        margin-left:5px;
        padding:0 2px;
     }
     .screens span:hover i{
        color:#fff;
     }
     .screens span:hover{
        background:#237AE4;
        color:#fff;
     }
     em{
        font-style:normal;
     }
  </style>
  </head>

  <body>

 <header style="height: 50px;background-color: #c0dafb;">

<div class="logo_right_box">
	<input type="hidden" value="${id}" id="cid"/>
    <ul class="logo_right_left">
      <li><a class="datebrowsing" href="person"><span style="padding: 12px; color: #58a0fd">数据浏览</span></a></li>
      <li><a class="chartview" href="showchart"><span style="padding: 12px;">图表查看</span></a></li>
      <li><a class="regional" href="showmap"><span>地域分布图</span></a></li>
    </ul>
    <ul class="logo_2right">
      <li class="grzx_a"> <a class="gerencenter"><span class="logo_bt" id="logo_mycenter">个人中心</span></a>
        <div id="dropdown_box" style="top: 50px; right: -15px; z-index: 888; display: none;">
          <ul class="dropdown_ul">
            <li class="dropdown_li"><a class="llhistry" href="person_DataBrowsing.html"><span>浏览记录</span></a></li>
            <li class="dropdown_li"><a class="updatebro" href="person_DataBrowsin.html"><span>下载记录</span></a></li>
            <li class="dropdown_li"><a class="pwdup" href="person_updatePassword.html"><span>密码修改</span></a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>

</header><!-- /header -->


    <p class="top_url_box box">
        <span>当前页面 ：</span><a id="sss">数据浏览</a>
    </p>
    <article class="arcbox box">
        <span>污染率 </span>
        <select id="pollution_rate" name="pollution_rate" class="mainSpecies">
            <option value="0-100" <c:if test="${rate=='0-100'}">selected="selected"</c:if>>0~100%</option>
            <option value="0-20" <c:if test="${rate=='0-20'}">selected="selected"</c:if>>0~20%</option>
            <option value="20-40" <c:if test="${rate=='20-40'}">selected="selected"</c:if>>20%~40%</option>
            <option value="40-60" <c:if test="${rate=='40-60'}">selected="selected"</c:if>>40%~60%</option>
            <option value="60-80" <c:if test="${rate=='60-80'}">selected="selected"</c:if>>60%~80%</option>
            <option value="80-100" <c:if test="${rate=='80-100'}">selected="selected"</c:if>>80%~100%</option>
          	<input type="hidden" value="pollutions"/>
        </select>
    </article>
    <!-- 筛选 -->
    <article class="">
        <div class="screens">
            <div class="screen_left">类别&gt;</div>
            <div class="screen_right">
            	<c:forEach items="${sps }" var="sp">
            		<span><em>${sp.cropSpecies }</em><i class="delCate">×</i></span>
            		<input type="hidden" value="${sp.id }"/>
            		<input type="hidden" value="breeds"/>
            	</c:forEach>
            </div>
        </div>
        <div class="screens">
            <div class="screen_left">年份&gt;</div>
            <div class="screen_right">
				<c:forEach items="${itime }" var="it">
           			<span><em>${it }</em><i class="delCate">×</i></span>
           			<input type="hidden" value="${it }"/>
           			<input type="hidden" value="years"/>
          		</c:forEach>               
            </div>
        </div>
        <div class="screens">
            <div class="screen_left">地区&gt;</div>
            <div class="screen_right">
					<c:forEach items="${provs }" var="prov">
            			<span><em>${prov.name }</em><i class="delCate">×</i></span>
            			<input type="hidden" value="${prov.code }"/>
            			<input type="hidden" value="provinces"/>
            		</c:forEach>  
            </div>
        </div>
        <div class="screens">
            <div class="screen_left">毒素&gt;</div>
            <div class="screen_right">
					<c:forEach items="${txs }" var="tx">
            			<span><em>${tx.toxintype }</em><i class="delCate">×</i></span>
            			<input type="hidden" value="${tx.id }"/>
            			<input type="hidden" value="toxins"/>
            		</c:forEach>              
            </div>
        </div>
    </article>
    <article class="arc0">
        <div class="arc1">
        <span class="yanpbh">样品编号</span>
        <span class="addrr">取样信息</span>
        <span class="nzwclass">农作物种类</span>
        <span class="wrl">污染率</span>
        <span class="qydate">取样时间</span>
        <span class="zyds">主要毒素种类</span>
        <span class="cpjz">产毒菌株信息</span>
        <span class="caozuo">操作</span>
        </div>
    </article>

    <article class="article_box box">
        <c:forEach items="${sample.list }" var="sp">
        <input value="${sp.id }" name="id" id="id" type="hidden">
        <div class="articles_box">

            <div class="seria_num">
                <div class="sample_id">${sp.sampleid }</div>
            </div>

            <div class="seria_right">
                <div class="articles_box_nr addr sample_info1">
                    <ul>
                        <li><span class="sam_info_value">${sp.pro.name }-${sp.cit.name }-${sp.tw.name }</span></li>
                        <li><span>取样人：</span><span class="sam_info_value">123</span></li>
                        <li><span>气候特征：</span><span class="sam_info_value">123</span></li>
                        <li><span>环境描述：</span><span class="sam_info_value">123</span></li>
                    </ul>
                </div>
                <div class="articles_box_nr nzwclass sample_info1">
                    <ul>
                        <li><span></span><span class="sam_info_value">${sp.species.cropSpecies }</span></li>
                    </ul>
                </div>
                <div class="articles_box_nr wrl sample_info1">
                    <ul>
                        <li><span></span><span class="sam_info_value">${sp.pollutionRate }0%</span></li>
                    </ul>
                </div>
                <div class="articles_box_nr qydate sample_info1">
                    <ul>
                        <li><span></span><span class="sam_info_value">${sp.inptime }</span></li>
                    </ul>
                </div>
                <div class="articles_box_nr sample_info2">
                    <ul>
						<c:forEach items="${sp.txinfo }" var="tx">
							<li><span class="sam_info_value">${tx.toxin.toxintype } : </span><span class="sam_info_value">${tx.toxinCount}0</span></li>
						</c:forEach>                         
                    </ul>
                </div>
                <div class="articles_box_nr cpjz sample_info3">
                                <ul>
                                    <li>
                                        <span>原始编号：</span>
                                        <span class="sam_info_value">${sp.sampleid }</span>
                                    </li>

                                    <li>
                                        <span>图片文件：</span><span class="sam_info_value">
                                            <a href="/upload/img/asdadasd.png" target="_blank">asdadasd.png</a>
                                        </span>
                                    </li>
                                    <li><span>文档信息：</span>
                                    <span class="sam_info_value">
                                        <a href="/glory/rest/lookword?url=123123123.docx" target="_blank">123123123.docx</a>
                                    </span>
                                    </li>
                                    <li><span>TXT文本信息：</span>
                                    <span class="sam_info_value">
                                        <a href="/glory/rest/lookword?url=qwasdads.txt" target="_blank">qwasdads.txt</a>
                                    </span>
                                    </li>
                                </ul>
                </div>
                <div class="articles_box_nr caozuo sample_info4">
                    <ul>
                        <li class="downline">
                        <a href="/glory/rest/downlineZIP?id=" +1"="">下载</a>
                        </li>
                        <li class="showbox">展开 <div style="display: none">1</div><span id="showa"></span></li>
                        <li class="hidebox">收起 <span id="hidea"></span></li>                    </ul>
                </div>
            </div>
        </div>
</c:forEach>
         <div class="page">
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<link type="text/css" rel="stylesheet" href="/glory/static/css/paging.css">
<style type="text/css">
.color a {
    padding: 5px;
    color: #4c4743;
    /* font-size: 20px; */
}

.color a:hover {
    color: #ed6c44;
}

/* .color2 {
    float: right;
    color: #4c4743;
    font-size: 20px;
    border: 1px black hidden;
} */

.color {
    float: right;
    border: 1px black hidden;
    width: 1366px;
    text-align: center;
}

#checkOne {
    color: #000;
    font-size: 20px;
}
#checkOnediv{
    color: #ed6c44;

}

/* #h1 {
    color: #4c4743;
} */
</style>
    <div class="im-page">
  <ul>
      <li class="im-indexpage"><a data-id="" onclick="cp(1)" title="">首页</a></li>
      <li class="im-nextpage"><a data-id="" onclick="cp(${sample.current==1?1:sample.current-1})" title="">上一页</a></li>
      <c:if test="${sample.pagenumber<=5 }">
      	<c:forEach begin="1" end="${sample.pagenumber }" var="number">
      		<li class="im-pagenum  <c:if test="${number==sample.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      	</c:forEach>
      </c:if>
      <c:if test="${sample.pagenumber>5 }">
      	<c:if test="${sample.pagenumber%5==0 }">
      		<c:forEach begin="${sample.colnumber*5+1 }" end="${sample.colnumber*5+5 }" var="number">
      			<li class="im-pagenum  <c:if test="${number==sample.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      		</c:forEach>
      	</c:if>
      	<c:if test="${sample.pagenumber%5 != 0 }">
      	
      		<c:if test="${sample.colnumber+1 <=(sample.pagenumber-sample.pagenumber%5)/5 }">
      			<c:forEach begin="${sample.colnumber*5+1 }" end="${sample.colnumber*5+5 }" var="number">
      				<li class="im-pagenum  <c:if test="${number==sample.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      		<c:if test="${sample.colnumber+1 > (sample.pagenumber-(sample.pagenumber%5))/5 }">
      			<c:forEach begin="${sample.colnumber*5+1 }" end="${sample.colnumber*5+sample.pagenumber%5 }" var="number">
      				<li class="im-pagenum  <c:if test="${number==sample.current }">active</c:if>" > <a data-id="${number}" onclick="cp(${number })" title="" >${number}</a> </li>
      			</c:forEach>
      		</c:if>
      	</c:if>
      </c:if>
      <li class="im-nextpage"><a data-id="" onclick="cp(${sample.current==sample.pagenumber?sample.pagenumber:sample.current+1})" title="">下一页</a></li>
      <li class="im-indexpage"><a data-id="" onclick="cp(${sample.pagenumber })" title="">尾页</a></li>
  </ul>
</div>

    </div>
    </article>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/IM-index.css"/>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js" ></script>
<script type="text/javascript">
	$(".delCate").click(function(){
		var f = confirm("确认删除该条件");
		if(f){
			 var texts = $(this).parent("span").next().val();
			 var type = $(this).parent("span").next().next().val();
			  $(this).parent("span").remove();
			 window.location.href="serachinfo?text="+texts+"&type="+type;	
			
		}
	})
	$("#pollution_rate").change(function(){
	    var texts = $(this).val();
	    var type = $(this).next().val();
		window.location.href="serachinfo?text="+texts+"&type="+type;	
	})
	function cp(num){
		window.location.href="serachinfo?pagenum="+num;			 
	 }
</script>
</body>
</html>