<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/system/common/head.jsp"%>
<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>



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
				嗨，今天的天气很不错！ <a href="#">3 new pages</a> and <a href="#">16  ${a}
					comments</a> 这是message
			</p>

			<span class="close">&#10006;</span>
		</div>
	</section>





	<script type="text/javascript">
		$("#temperature").click(function() {

			var content_dom = $("#content");
			var url = contextPath + "/system/temperature";/* contextPath+"/system/temperature" */
			var js = '../js/temperature.js';

			/*  var js = contextPath+'/home/qcModel/modelManagement/js/modelManagementList.js';*/
			viewer.load(content_dom, url, js, "", true);
		})
		$("#members").click(
				function() {
					var currentPage = 1;//初始是当前页码数是1
					var pageSize = 10;//每页显示的列数

					$(function() {
						searchModelList('init');

					});
					/**
					 * 查询模型列表
					 * @params IsInit 状态参数 判断是否是第一次调用searchQcModelList()
					 */
					function searchModelList(IsInit) {

						if (IsInit == 'init') {//查询时，起始页从1开始(点击查询按钮时，总是从第一页开始的，否则总是从当前页开始)
							currentPage = 1;
							var content_dom = $("#content");
						} else {
							var content_dom = $("#ibody");
						}

						var url = contextPath + "/controller/userlist?page="
								+ currentPage + "&sort=id&order=desc&rows="
								+ pageSize;
						var js = '../js/userslist.js';

						/*  var js = contextPath+'/home/qcModel/modelManagement/js/modelManagementList.js';*/
						viewer.load(content_dom, url, js, "", true);

					}
				})
	</script>


	<section class="content" id="content">
	<jsp:include page="/system/home/content_init.jsp"></jsp:include>


	</section>

</body>
</html>