<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 <%@include file="/system/common/head.jsp" %>
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/style.css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/bootstrap.css"
	media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/my.css" media="all" />
    	 		<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>	

    	 		
    	 		<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/tools.holly.js"></script>


 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/app.js"> 
		</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/jquery.blockui.min.js"> </script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/toastr.min.js"></script>
<%--      <script src="<%=request.getContextPath()%>/js/home/users.js"></script>	 --%>
<script src="<%=request.getContextPath()%>/js/pagination/holly_pagination1.0.js"></script>	 
    	 		<script src="<%=request.getContextPath()%>/js/common/custom.js"></script>

<script
	src="<%=request.getContextPath()%>/js/common/jquery.tablesorter.min.js"></script>
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
	
		<div class="orange">
		<p>
					填写添加的角色信息   
					</p>
		</div>
		
	
	</section>
	<section class="content" id="content">
		<div class="content_form">

  			<jsp:include page="/system/home/user/addinfo.jsp"></jsp:include>
			
	</div>
	</section>


</body>
</html>