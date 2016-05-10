<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<table id="myTable" border="1">
	<thead>
		<tr>
			<th>ID</th>
			<th>name</th>
			<th>phone</th>
			<th>role</th>
			<th>operate</th>


		</tr>
	</thead>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 里面不能加载css不然无法显示 -->
<!--c:set  通过页面page和条数进行排序 不要放在语法里面  可能报错-->


	<c:if test="${!empty requestScope.users}">
		<c:forEach items="${requestScope.users }" var="emp" varStatus="xh">
			<c:set var="xhindex" value="${(requestScope.page -1)*10+xh.count }">
			</c:set>
			<tr>
				<td>${ xhindex}</td>
				<td>${emp.username }</td>
						<td>${emp.phone }</td>
								<td>${emp.role }</td>
				<td><a href="adduser?id=${emp.id}">编辑</a>
				
				<c:if test="${loginuser.role=='root'}">
				 <a	href="deleteuser?id=${emp.id}">删除</a>
				 </c:if>
				 </td>                                                                                                                                                                                                                                                                                 
			</tr>

		</c:forEach>
	</c:if>
</table>


<input type="hidden" class="sr-only" value="${requestScope.total }"
	id="totalCount" />
	
	<div id="ibody"></div>

	

<script type="text/javascript" src="<%=request.getContextPath()%>/js/home/userslist.js">
</script>


