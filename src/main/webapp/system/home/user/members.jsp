<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/style.css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/bootstrap.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/my.css" media="all" />
    	 <%@include file="/system/common/head.jsp" %>
    	 		<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>
    	     	     	 		<script
	src="<%=request.getContextPath()%>/js/common/jquery.tablesorter.min.js"></script>	


    	 		<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/tools.holly.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/app.js"> 
		</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/jquery.blockui.min.js"> </script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/toastr.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/home/users.js"></script>	
<script src="<%=request.getContextPath()%>/js/pagination/holly_pagination1.0.js"></script>	 
 <script>
 	var contextPath ="<%=request.getContextPath()%>";
 </script>
<body>
	<!--<%=request.getContextPath()%>不能够加载里面 否则会报错  -->
	<jsp:include page="/system/common/top.jsp"></jsp:include>
	<nav>
   	 <%@include file="/system/common/nav.jsp" %>
	</nav>
	<section class="alert">
	<div class="green">
		<p>
			嗨，今天的天气很不错！ <a href="#">3 new pages</a> and <a href="#">16
				comments</a> 这是message
		</p>

		<span class="close">&#10006;</span>
	</div>
	</section>
<section class="content" id="content">
  
			<a href="add">添加</a>
	




			
  	


         <!-- 填充查询结果集-->
        <div id="tableBody">
		
		</div>	


<div class="hmp" style="width: auto; height: 20px;">
	<ul class="pagination" id="pagination"></ul>
</div>


	</section>


</body>
</html>