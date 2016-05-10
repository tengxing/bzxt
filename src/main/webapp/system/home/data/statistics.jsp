<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/system/common/head.jsp"%>
<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/home/data/highcharts.js"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/tools.holly.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/jquery.blockui.min.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/app.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/toastr.min.js"></script>
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


		<div class="left">
			<div id="containers" class="box"></div>
		</div>
		<div class="right">
			<div id="container" class="box"></div>
		</div>




	</section>
	<script type="text/javascript">
		$(function() {
		

			var colors = Highcharts.getOptions().colors, categories = [ 'MSIE',
					'Firefox', 'Chrome', 'Safari', 'Opera' ], name = 'Browser brands',

			data = [
					{
						y : 55.11,
						color : colors[0],
						drilldown : {
							name : 'MSIE versions',
							categories : [ 'MSIE 6.0', 'MSIE 7.0', 'MSIE 8.0',
									'MSIE 9.0' ],
							data : [ 10.85, 7.35, 33.06, 2.81 ],
							color : colors[0]
						}
					},
					{
						y : 21.63,
						color : colors[1],
						drilldown : {
							name : 'Firefox versions',
							categories : [ 'Firefox 2.0', 'Firefox 3.0',
									'Firefox 3.5', 'Firefox 3.6', 'Firefox 4.0' ],
							data : [ 0.20, 0.83, 1.58, 13.12, 5.43 ],
							color : colors[1]
						}
					},
					{
						y : 11.94,
						color : colors[2],
						drilldown : {
							name : 'Chrome versions',
							categories : [ 'Chrome 5.0', 'Chrome 6.0',
									'Chrome 7.0', 'Chrome 8.0', 'Chrome 9.0',
									'Chrome 10.0', 'Chrome 11.0', 'Chrome 12.0' ],
							data : [ 0.12, 0.19, 0.12, 0.36, 0.32, 9.91, 0.50,
									0.22 ],
							color : colors[2]
						}
					},
					{
						y : 7.15,
						color : colors[3],
						drilldown : {
							name : 'Safari versions',
							categories : [ 'Safari 5.0', 'Safari 4.0',
									'Safari Win 5.0', 'Safari 4.1',
									'Safari/Maxthon', 'Safari 3.1',
									'Safari 4.1' ],
							data : [ 4.55, 1.42, 0.23, 0.21, 0.20, 0.19, 0.14 ],
							color : colors[3]
						}
					},
					{
						y : 2.14,
						color : colors[4],
						drilldown : {
							name : 'Opera versions',
							categories : [ 'Opera 9.x', 'Opera 10.x',
									'Opera 11.x' ],
							data : [ 0.12, 0.37, 1.65 ],
							color : colors[4]
						}
					} ];

			// Build the data arrays
			var browserData = [];
			var versionsData = [];
			for (var i = 0; i < data.length; i++) {

				// add browser data
				browserData.push({
					name : categories[i],
					y : data[i].y,
					color : data[i].color
				});

				// add version data
				for (var j = 0; j < data[i].drilldown.data.length; j++) {
					var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5;
					versionsData.push({
						name : data[i].drilldown.categories[j],
						y : data[i].drilldown.data[j],
						color : Highcharts.Color(data[i].color).brighten(
								brightness).get()
					});
				}
			}

			// Create the chart
			$('#containers').highcharts(
					{
						chart : {
							type : 'pie'
						},
						title : {
							text : 'Browser market share, April, 2015'
						},
						yAxis : {
							title : {
								text : 'Total percent market share'
							}
						},
						plotOptions : {
							pie : {
								shadow : false,
								center : [ '50%', '50%' ]
							}
						},
						tooltip : {
							valueSuffix : '%'
						},
						series : [
								{
									name : 'Browsers',
									data : browserData,
									size : '60%',
									dataLabels : {
										formatter : function() {
											return this.y > 5 ? this.point.name
													: null;
										},
										color : 'white',
										distance : -30
									}
								},
								{
									name : 'Versions',
									data : versionsData,
									size : '80%',
									innerSize : '60%',
									dataLabels : {
										formatter : function() {
											// display only if larger than 1
											return this.y > 1 ? '<b>'
													+ this.point.name
													+ ':</b> ' + this.y + '%'
													: null;
										}
									}
								} ]
					});
		});
	
	
	</script>

	<script type="text/javascript">
		
	</script>
<script src="<%=request.getContextPath()%>/js/home/data/statistics.js"></script>

</body>
</html>