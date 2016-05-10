 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
 <!--    注意这个不能加载在里面-->	
 <script src="<%=request.getContextPath()%>/js/common/jquery.tablesorter.min.js"></script>	
<script src="<%=request.getContextPath()%>/js/common/custom.js"></script>
 <ul>
		<li class="section"><a href="content"><span class="icon">&#128196;</span>
				Home</a></li>
		<li><a><span class="icon">&#128101;</span>登陆人员管理</a>
			<ul class="submenu">
				<li><a href="<%=request.getContextPath()%>/userMember/members" id="members">人员名单</a></li>
				<li><a href="<%=request.getContextPath()%>/userMember/add">人员添加</a></li>
			</ul></li>
		<li><a><span class="icon">&#128202;</span> 数据统计 <span
				class="pip">2</span></a>
			<ul class="submenu">
				<li><a href="<%=request.getContextPath()%>/Data/statistics">java使用率统计</a></li>
				<li><a href="<%=request.getContextPath()%>/Data/aim" id="temperature">前景分析</a></li>
			</ul></li>
		<li><a><span class="icon">&#128711;</span> 时时监控</a>
			<ul class="submenu">
				<li><a href="photos">在线人数</a></li>
				<li><a href="plan">登陆日志</a></li>
			</ul></li>
		<li><a href="<%=request.getContextPath()%>/Data/upfile"><span class="icon">&#128202;</span>文件集合</a></li>
		<li><a><span class="icon">&#128101;</span>About me <span
				class="pip">3</span></a>
			<ul class="submenu">
				<li><a href="Introduction">Introduction</a></li>
				<li><a href="learn">Learn</a></li>
				<li><a href="blog">Blog</a></li>
			</ul></li>
		<li><a href="menu"><span class="icon">&#9881;</span>Menu</a></li>
	</ul>