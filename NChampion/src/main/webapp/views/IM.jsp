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
    
   <title>信息管理</title>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>信息管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/conmen-header.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/reset.css"/>
<script src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/IM-index.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/IM-index.css"/>
<script src="<%=path%>/static/js/super.js"></script>
<style>
html, body {
	height: 100%;
}
</style>
</head>

<body onload="loadbdy()">
<a name="top"></a>
<div class="contaner">
<div class="im-content">
<div class="im-heade">
  <div class="imhead-title">当前页面：<a>信息管理</a></div>
  <div class="imhead-select">
    <ul>
      <li class="bh">
        <lable>样品编号</lable>
        <input maxlength="15" onkeyup="this.value=this.value.replace(/\s+/g,'')" id="sample_id" value="" type="text">
      </li>
      <li class="wrl mright">
        <lable>污染率</lable>
        <select id="wuranluv">
          <option value="">请选择</option>
          <option value="0-20">0~20%</option>
          <option value="20-40">20%~40%</option>
          <option value="40-60">40%~60%</option>
          <option value="60-80">60%~80%</option>
          <option value="80-100">80%~100%</option>
        </select>
      </li>
      <li class="time">
        <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间</lable>
        <input id="qaz" value="" type="hidden">
        <select name="year" id="year" class="year">
          <option value="0">请选择</option>
          <option value="1950">1950</option>
          <option value="1951">1951</option>
          <option value="1952">1952</option>
          <option value="1953">1953</option>
          <option value="1954">1954</option>
          <option value="1955">1955</option>
          <option value="1956">1956</option>
          <option value="1957">1957</option>
          <option value="1958">1958</option>
          <option value="1959">1959</option>
          <option value="1960">1960</option>
          <option value="1961">1961</option>
          <option value="1962">1962</option>
          <option value="1963">1963</option>
          <option value="1964">1964</option>
          <option value="1965">1965</option>
          <option value="1966">1966</option>
          <option value="1967">1967</option>
          <option value="1968">1968</option>
          <option value="1969">1969</option>
          <option value="1970">1970</option>
          <option value="1971">1971</option>
          <option value="1972">1972</option>
          <option value="1973">1973</option>
          <option value="1974">1974</option>
          <option value="1975">1975</option>
          <option value="1976">1976</option>
          <option value="1977">1977</option>
          <option value="1978">1978</option>
          <option value="1979">1979</option>
          <option value="1980">1980</option>
          <option value="1981">1981</option>
          <option value="1982">1982</option>
          <option value="1983">1983</option>
          <option value="1984">1984</option>
          <option value="1985">1985</option>
          <option value="1986">1986</option>
          <option value="1987">1987</option>
          <option value="1988">1988</option>
          <option value="1989">1989</option>
          <option value="1990">1990</option>
          <option value="1991">1991</option>
          <option value="1992">1992</option>
          <option value="1993">1993</option>
          <option value="1994">1994</option>
          <option value="1995">1995</option>
          <option value="1996">1996</option>
          <option value="1997">1997</option>
          <option value="1998">1998</option>
          <option value="1999">1999</option>
          <option value="2000">2000</option>
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
          <option value="2005">2005</option>
          <option value="2006">2006</option>
          <option value="2007">2007</option>
          <option value="2008">2008</option>
          <option value="2009">2009</option>
          <option value="2010">2010</option>
          <option value="2011">2011</option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>
          <option value="2015">2015</option>
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
          <option value="2020">2020</option>
          <option value="2021">2021</option>
          <option value="2022">2022</option>
          <option value="2023">2023</option>
          <option value="2024">2024</option>
          <option value="2025">2025</option>
          <option value="2026">2026</option>
          <option value="2027">2027</option>
          <option value="2028">2028</option>
          <option value="2029">2029</option>
          <option value="2030">2030</option>
          <option value="2031">2031</option>
          <option value="2032">2032</option>
          <option value="2033">2033</option>
          <option value="2034">2034</option>
          <option value="2035">2035</option>
          <option value="2036">2036</option>
          <option value="2037">2037</option>
          <option value="2038">2038</option>
          <option value="2039">2039</option>
          <option value="2040">2040</option>
          <option value="2041">2041</option>
          <option value="2042">2042</option>
          <option value="2043">2043</option>
          <option value="2044">2044</option>
          <option value="2045">2045</option>
          <option value="2046">2046</option>
          <option value="2047">2047</option>
          <option value="2048">2048</option>
          <option value="2049">2049</option>
          <option value="2050">2050</option>
          <option value="2051">2051</option>
          <option value="2052">2052</option>
          <option value="2053">2053</option>
          <option value="2054">2054</option>
          <option value="2055">2055</option>
          <option value="2056">2056</option>
          <option value="2057">2057</option>
          <option value="2058">2058</option>
          <option value="2059">2059</option>
          <option value="2060">2060</option>
          <option value="2061">2061</option>
          <option value="2062">2062</option>
          <option value="2063">2063</option>
          <option value="2064">2064</option>
          <option value="2065">2065</option>
          <option value="2066">2066</option>
          <option value="2067">2067</option>
          <option value="2068">2068</option>
          <option value="2069">2069</option>
          <option value="2070">2070</option>
          <option value="2071">2071</option>
          <option value="2072">2072</option>
          <option value="2073">2073</option>
          <option value="2074">2074</option>
          <option value="2075">2075</option>
          <option value="2076">2076</option>
          <option value="2077">2077</option>
          <option value="2078">2078</option>
          <option value="2079">2079</option>
          <option value="2080">2080</option>
          <option value="2081">2081</option>
          <option value="2082">2082</option>
          <option value="2083">2083</option>
          <option value="2084">2084</option>
          <option value="2085">2085</option>
          <option value="2086">2086</option>
          <option value="2087">2087</option>
          <option value="2088">2088</option>
          <option value="2089">2089</option>
          <option value="2090">2090</option>
          <option value="2091">2091</option>
          <option value="2092">2092</option>
          <option value="2093">2093</option>
          <option value="2094">2094</option>
          <option value="2095">2095</option>
          <option value="2096">2096</option>
          <option value="2097">2097</option>
          <option value="2098">2098</option>
          <option value="2099">2099</option>
          <option value="2100">2100</option>
          <option value="2101">2101</option>
          <option value="2102">2102</option>
          <option value="2103">2103</option>
          <option value="2104">2104</option>
          <option value="2105">2105</option>
          <option value="2106">2106</option>
          <option value="2107">2107</option>
          <option value="2108">2108</option>
          <option value="2109">2109</option>
          <option value="2110">2110</option>
          <option value="2111">2111</option>
          <option value="2112">2112</option>
          <option value="2113">2113</option>
          <option value="2114">2114</option>
          <option value="2115">2115</option>
          <option value="2116">2116</option>
          <option value="2117">2117</option>
          <option value="2118">2118</option>
          <option value="2119">2119</option>
          <option value="2120">2120</option>
          <option value="2121">2121</option>
          <option value="2122">2122</option>
          <option value="2123">2123</option>
          <option value="2124">2124</option>
          <option value="2125">2125</option>
          <option value="2126">2126</option>
          <option value="2127">2127</option>
          <option value="2128">2128</option>
          <option value="2129">2129</option>
          <option value="2130">2130</option>
          <option value="2131">2131</option>
          <option value="2132">2132</option>
          <option value="2133">2133</option>
          <option value="2134">2134</option>
          <option value="2135">2135</option>
          <option value="2136">2136</option>
          <option value="2137">2137</option>
          <option value="2138">2138</option>
          <option value="2139">2139</option>
          <option value="2140">2140</option>
          <option value="2141">2141</option>
          <option value="2142">2142</option>
          <option value="2143">2143</option>
          <option value="2144">2144</option>
          <option value="2145">2145</option>
          <option value="2146">2146</option>
          <option value="2147">2147</option>
          <option value="2148">2148</option>
          <option value="2149">2149</option>
          <option value="2150">2150</option>
          <option value="2151">2151</option>
          <option value="2152">2152</option>
          <option value="2153">2153</option>
          <option value="2154">2154</option>
          <option value="2155">2155</option>
          <option value="2156">2156</option>
          <option value="2157">2157</option>
          <option value="2158">2158</option>
          <option value="2159">2159</option>
          <option value="2160">2160</option>
          <option value="2161">2161</option>
          <option value="2162">2162</option>
          <option value="2163">2163</option>
          <option value="2164">2164</option>
          <option value="2165">2165</option>
          <option value="2166">2166</option>
          <option value="2167">2167</option>
          <option value="2168">2168</option>
          <option value="2169">2169</option>
          <option value="2170">2170</option>
          <option value="2171">2171</option>
          <option value="2172">2172</option>
          <option value="2173">2173</option>
          <option value="2174">2174</option>
          <option value="2175">2175</option>
          <option value="2176">2176</option>
          <option value="2177">2177</option>
          <option value="2178">2178</option>
          <option value="2179">2179</option>
          <option value="2180">2180</option>
          <option value="2181">2181</option>
          <option value="2182">2182</option>
          <option value="2183">2183</option>
          <option value="2184">2184</option>
          <option value="2185">2185</option>
          <option value="2186">2186</option>
          <option value="2187">2187</option>
          <option value="2188">2188</option>
          <option value="2189">2189</option>
          <option value="2190">2190</option>
          <option value="2191">2191</option>
          <option value="2192">2192</option>
          <option value="2193">2193</option>
          <option value="2194">2194</option>
          <option value="2195">2195</option>
          <option value="2196">2196</option>
          <option value="2197">2197</option>
          <option value="2198">2198</option>
          <option value="2199">2199</option>
        </select>
        <span> &nbsp;年</span>
        <select name="month" id="month" class="month">
          <option value="0">请选择</option>
        </select>
        <span> &nbsp;月 </span>
        <select name="day" id="day" class="day">
          <option value="0">请选择</option>
        </select>
        <span>&nbsp; 日</span> </li>
      <li class="w mright yu">
        <lable>主要污染菌种类</lable>
        <select name="toxin_type" class="mainSpecies" id="toxin_type">
        	<option value="">请选择</option>
        </select>
      </li>
      <li class="w mright yu">
        <lable>农作物种类</lable>
        <select name="crop_species" class="nzw_spacies" id="crop_species">
          <option value="">请选择</option>
        </select>
      </li>
      <li class="place w">
        <lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地点</lable>
        <input type="hidden" value="" id="shengs">
        <input type="hidden" value="" id="shisss">
        <input type="hidden" value="" id="xiansss">
        <input type="hidden" value="123" id="wsx">
        <select name="province" class="province" id="shen">
        </select>
        <span> &nbsp;省</span>
        <select name="city" class="city" id="shi">
        	<option value="">请选择</option>
        </select>
        <span> &nbsp;市</span>
        <select name="county" class="county" id="xian">
        	<option value="">请选择</option>
        </select>
        <span> &nbsp;县</span> </li>
    </ul>
    <div class="soso" onclick="search()"><a>搜索</a></div>
  </div>
  <div class="oper">
    <ul>
      <li class="btn-top"> <a href="editIM-add.html" class="dt">新增单条</a>
        <form class="form-b" action="IMServlet?method=upload" method="post" enctype="multipart/form-data" id="excelForm">
          <input type="file" name="file" class="file-info-b  file-info-b-1" accept=".xlsx">
          <a class="xz-btn-b xz-btn-b-1">选择文件</a>
          <input type="text" name="" id="" value="" class="vall vall-1" readonly>
          <input class="submit-b" type="button" onclick="daoru()" value="导入样品信息">
        </form>
        <a class="mb">下载模板</a> <br>
        <a class="pl">批量删除</a>
        <!-- 产毒菌株信息的导入 -->
        <form class="form-b" action="rest/excel/updateBacterialExcel" method="post" enctype="multipart/form-data" id="excelForm1">
          <input type="file" name="file" class="file-info-b junzhu-a" accept=".xlsx">
          <a class="xz-btn-b junzhu-b">选择文件</a>
          <input type="text" name="" id="flag" value="" class="vall vall-c" readonly>
          <input class="submit-b submit-c" type="button" value="导入菌株信息">
        </form>
        <a href="javascript:void(0)" class="dc">信息导出</a> </li>
    </ul>
  </div>
</div>
<div class="im-table" id="tablediv">
<table>
    <thead>
      <tr>
        <th class="w1"><input type="checkbox" id="checkbox1" value="">
          全选</th>
        <th class="w2">样品编号</th>
        <th class="w3">地点</th>
        <th class="w4">农产品加工类型</th>
        <th class="w5">取样时间</th>
        <th class="w6">录入时间</th>
        <th class="w7">真菌污染率</th>
        <th class="w8">主要毒素</th>
        <th class="w9">操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${sample.list}" var="sample">
	      <tr <c:if test="false">style="display: none"</c:if>>
	      	<td><input class="testyangpin" value="${sample.id} " type="checkbox"></td>
	        <td class="ybbh">${sample.sampleid}</td>
	        <td>${sample.pro.name}${sample.cit.name}${sample.tw.name}</td>
	        <td>${sample.species.cropSpecies}</td>
	        <td>${sample.samptime}</td>
	        <td>${sample.inptime}</td>
	        <td>${sample.pollutionRate}%</td>
	        <td>
	        	<c:forEach items="${sample.txinfo}" var="tx">
	        		${tx.toxin.toxintype}
	        	</c:forEach>
	        </td>
	        <td><a href="editIM.html">编辑</a> |<a href="javascript:if(confirm('确实要删除吗?'))location='/glory/rest/iddeleteyangpin?id=754'">删除</a></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<div class="page"></div>
	</div>
	</div>
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<link type="text/css" rel="stylesheet" href="../static/css/paging.css">
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
/* 	float: right; */
	border: 1px black hidden;
	width: 100%;
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
<div class="im-page" id="pagediv">
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
<script type="text/javascript" src="../static/js/jquery1.11.3-jquery.min.js" ></script>
<script type="text/javascript" src="../static/js/browsing.js" ></script>
<script type="text/javascript" src="../static/js/linkage4.js"></script>
<script type="text/javascript">
			function cp(num){
				 window.location.href="findAllSample?pagenumber="+num;
				 
	  		}
	  		function csp(num){
	  			findAllSample(num);
	  		}
			function doExport(){
				var ex = "";
				$.each($('input:checkbox:checked'),function(){
					if($(this).val()!=''){
	                	ex = ex+($(this).val()+",");
	                }
	            });
	            if(ex!=''){
	          		window.location="rest/excel/message_export?ex="+ex;
	          	}else{
	          		alert("请先勾选数据!");
	          	}
			}
			function nameCheck(){
				var img1 = $("input:file").val();
				if(img1==''){
					alert("请选择文件！");
					return false;
				}
				var img = $("input:file").val().split("\\");
				var imgName = img[img.length-1];
				var imgshuzu = imgName.split(".");
				var imgleixing = imgshuzu[imgshuzu.length-1];
				if(imgleixing=="xlsx"){
					$("#excelForm").submit();
				}else{
					alert("上传文件格式不正确，请上传2007版本的excel文档");
					return false;
				}
			}

			function nameCheck1(){
				var img1 = $("#flag").val();
				if(img1==''){
					alert("请选择文件！");
					return false;
				}
				var img = $("#flag").val().split("\\");
				var imgName = img[img.length-1];
				var imgshuzu = imgName.split(".");
				var imgleixing = imgshuzu[imgshuzu.length-1];
				if(imgleixing=="xlsx"){
					$("#excelForm1").submit();
				}else{
					alert("上传文件格式不正确，请上传2007版本的excel文档");
					return false;
				}
			}

		function testyangpin(){

		var msg = "您真的确定要删除吗？";
			if (confirm(msg)==true){
				var urlss = "";
				var ss = $(".testyangpin");
				for(var i=0 ; i<ss.length;i++){
					if(ss[i].checked){
					  urlss =urlss+ss[i].value+",";
					}

				}
				if(urlss == ""){
						alert("请选择要删除的信息");
						return false;
				}else{
					location.href = "<%=path%>/rest/deletelists?urlss="+urlss+"";
					return true;
				}


			}else{
		    	return false;
			}

		}
		function searchAll(){

			var sample_id = $("#sample_id").val();
			var pollution_rate=$("#wuranluv").val();

			var toxin_type = $("#toxin_type").val();
			var crop_species = $("#crop_species").val()
			;

			var year = $("#year").val();


			var month = $("#month").val();
			if(month<10){
				month = "0"+month;
			}else if(month=="请选择"){
				month="";
			}
			var day = $("#day").val();
			if(day<10){
				day = "0"+day;
			}else if(day=="请选择"){
				day="";
			}
			var sampling_time = year.replace(/\s/g,"")+"-"+month.replace(/\s/g,"")+"-"+day.replace(/\s/g,"");
			var province = $("#shen option:selected").text();
			if(province=="请选择"){
				province="";
			}
			var city = $("#shi option:selected").text();
			if(city=="请选择"){
				city="";
			}
			var county = $("#xian option:selected").text();
			if(county=="请选择"){
				county="";
			}

			console.log(sample_id,pollution_rate,toxin_type,crop_species,sampling_time,province,city,county)
			location.href = "<%=path%>/rest/tolistim?param1="+sample_id+"&param2="+pollution_rate+"&param3="+toxin_type+"&param4="+crop_species+"&param5="+sampling_time+"&param6="+province+"&param7="+city+"&param8="+county;
		}
		function daoru(){
			document.getElementById("excelForm").submit();
		}
		function loadbdy(){
			$.ajax({
				url:"selectProvince",
				type:"post",
				dataType:"json",
				data:{},
				success:function(result){
					$("#shen").empty();
					var op = "<option value=''>请选择</option>";
					for(var i = 0;i<result.length;i++){
						op+="<option value="+result[i].code+">"+result[i].name+"</option>";					
					}
					$("#shen").append(op);
				}
			})
			$.getJSON("selectToxin",function (result){
					$("#toxin_type").empty();
					var op = "<option value=''>请选择</option>";
					for(var i = 0;i<result.length;i++){
						op+="<option value="+result[i].id+">"+result[i].toxintype+"</option>";					
					}
					$("#toxin_type").append(op);
			})
			$.getJSON("selectspecise",function(result){
				$("#crop_species").empty();
					var op = "<option value=''>请选择</option>";
					for(var i = 0;i<result.length;i++){
						op+="<option value="+result[i].id+">"+result[i].cropSpecies+"</option>";					
					}
					$("#crop_species").append(op);
			})
		}
		$("#shen").change(function(){
			$.ajax({
				url:"selectCity",
				type:"post",
				dataType:"json",
				data:{"pcode":$("#shen").val()},
				success:function(result){
					$("#shi").empty();
					$("#xian").empty();
					var op = "<option value=''>请选择</option>";
					for(var i = 0;i<result.length;i++){
						op+="<option value="+result[i].code+">"+result[i].name+"</option>";					
					}
					$("#shi").append(op);
					$("#xian").append("<option value=''>请选择</option>");
				}
			})
		})
		$("#shi").change(function(){
			$.getJSON("selectTown",{"ccode":$("#shi").val()},function(result){
					$("#xian").empty();
					var op = "<option value=''>请选择</option>";
					for(var i = 0;i<result.length;i++){
						op+="<option value="+result[i].code+">"+result[i].name+"</option>";					
					}
					$("#xian").append(op);
			})
		});
		function search(){
			var s = confirm("确定要搜索吗");
			if(s){
				findAllSample(1);
			}
		}
		function findAllSample(pnb){
				$.ajax({
					url:"searchsample",
					type:"POST",
					data:{
						sampleid:$("#sample_id").val(),
				 		wuranluv:$("#wuranluv").val(),
				 		year:$("#year").val(),
				 		month:$("#month").val(),
				 		day:$("#day").val(),
				 		toxintype:$("#toxin_type").val(),
				 		cropspecies:$("#crop_species").val(),
				 		province:$("#shen").val(),
				 		city:$("#shi").val(),
				 		town:$("#xian").val(),
				 		pagenumber:pnb
					},
					dataType:"JSON",
					success:function(data){
						$("#tablediv").empty();
						$("#pagediv").empty();
						var v = '<table><thead> <th class="w1"><input type="checkbox" id="checkbox1" value="">全选</th>';
			 			v+='<th class="w2">样品编号</th>'; 
			 			v+='<th class="w3">地点</th>';
			 			v+='<th class="w4">农产品加工类型</th>';
			 			v+='<th class="w5">取样时间</th>';
			 			v+='<th class="w6">录入时间</th>';
			 			v+='<th class="w7">真菌污染率</th>';
			 			v+='<th class="w8">主要毒素</th>';
			 			v+='<th class="w9">操作</th></tr></thead><tbody>';
			 			for(var i = 0; i <data.list.length; i ++){
			 				 v+= '<tr>';
							 v+='<td><input class="testyangpin" value="'+data.list[i].id+'" type="checkbox"></td>';
							 v+=' <td class="ybbh">'+data.list[i].sampleid+'</td>';
							 v+='<td>'+data.list[i].pro.name + data.list[i].cit.name + data.list[i].tw.name+'</td>';
							 v+='<td>'+data.list[i].species.cropSpecies+'</td>';
							 v+=' <td>'+new Date(data.list[i].samplingTime).toISOString().slice(0,10)+'</td>';
							 v+='<td>'+new Date(data.list[i].inputtime).toISOString().slice(0,10)+'</td>';
							 v+=' <td>'+data.list[i].pollutionRate+'%</td>';
							 var toxin = data.list[i].txinfo;
							 v+='<td>';
							 for(var j = 0; j <toxin.length; j ++){
							 	v+=toxin[j].toxin.toxintype;
							 }
							 v+='</td>';
							 v+='<td><a href="editIM.html">编辑</a> |<a >删除</a></td> </tr>';
						}
			 				v+=' </table>';
							 
						$("#tablediv").append(v);
						var pb = parseInt(data.pagenumber);
						var pc = parseInt(data.current);
						var pco= data.colnumber;
						var p ='<ul><li class="im-indexpage"><a data-id="" onclick="csp(1)" title="">首页</a></li>';
							p+='<li class="im-nextpage"><a data-id="" onclick="csp('+pc+'==1?1:'+pc+'-1)" title="">上一页</a></li>';
							if(pb<=5){
								for(var i = 1;i<=pb;i++){
									p+='<li class="im-pagenum';
									if(i==pc){
										p+=' active ';
									}
									p+='> <a data-id="'+i+'" onclick="csp('+i+')" title="" >'+i+'</a> </li>';
								}
							}
							if(pb>5){
								if(pb%5==0){
									for(var i = pco*5+1;i<=pco*5+5;i++){
										p+='<li class="im-pagenum';
										if(i==pc){
											p+=' active ';
										}
										p+='" > <a data-id="'+i+'" onclick="csp('+i+')" title="" >'+i+'</a> </li>';
									}
								}
								if(pb%5 != 0){
									if(pco+1<=(pb-(pb%5))/5){
										for(var i = pco*5+1;i<=pco*5+5;i++){
											p+='<li class="im-pagenum';
											if(i==pc){
												p+=' active ';
											}
											p+='" > <a data-id="'+i+'" onclick="csp('+i+')" title="" >'+i+'</a> </li>';
										}
									}
									if(pco+1 > (pb-(pb%5))/5){
										for(var i = pco*5+1;i<=(pco*5)+(pb%5);i++){
											p+='<li class="im-pagenum';
												if(i==pc){
													p+=' active ';
												}
												p+='" > <a data-id="'+i+'" onclick="csp('+i+')" title="" >'+i+'</a> </li>';
											}
										}
									}
								}
							p+='<li class="im-nextpage"><a data-id="" onclick="csp('+pc+'=='+pb+'?'+pb+':'+pc+'+1)" title="">下一页</a></li>'
      						p+='<li class="im-indexpage"><a data-id="" onclick="csp('+pb+')" title="">尾页</a></li></ul>'
						$("#pagediv").append(p);
					}
				})
			}
		</script>
 </body>
</html>
