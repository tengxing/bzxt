<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/system/common/head.jsp"%>
<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/home/data/highcharts.js"></script>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/home/tools.holly.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/home/jquery.blockui.min.js"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/home/app.js"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/home/toastr.min.js"></script>
<script type="text/javascript">
	var contextPath='<%=request.getContextPath()%>';
</script>


<body>
	<!--<%=request.getContextPath()%>不能够加载里面 否则会报错  -->
	<jsp:include page="/system/common/top.jsp"></jsp:include>
	<nav>
		<%@include file="/system/common/nav.jsp"%>
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

		<div class="box">
			<div class="box_top">

				<div class="box_images"></div>
				<div class="box_images"></div>
				<div class="box_images"></div>
				<div class="box_images"></div>
				<div class="box_images"></div>


			</div>
			<div class="box_content">
				<div class="left">
					<div class="alert">

						<p>文件上传</p>

						<form action="uploadfile" method="POST"
							enctype="multipart/form-data">

							<span style="display: inline"> File: <input type="file"
								name="file" /></span> Desc: <input type="text" name="desc" /> <a
								href="javascript:history.go(-1);">取消</a> <input type="submit"
								class="button blue" value="提交" />
						</form>
					</div>
				</div>
				
				<div class="right">
					<p>ss</p>
				</div>
			</div>
		</div>




	</section>



</body>
</html>