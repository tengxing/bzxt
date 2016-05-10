<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="adduser" method="post">


			<input type="hidden" name="id" value="<c:if test="${!empty requestScope.user.id}">${user.id}</c:if>"/>
  			用户名：	<input type="text" name="username" value="<c:if test="${!empty requestScope.user.username}">${user.username}</c:if>"/>
  				密码：	<input type="text" name="password"value="<c:if test="${!empty requestScope.user.password}">${user.password}</c:if>"/>
  					手机：	<input type="text" name="phone"value="<c:if test="${!empty requestScope.user.phone}">${user.phone}</c:if>"/>
  				角色：<br>	<select style="height:30px" name="role">
							<option><c:if test="${!empty requestScope.user.role}">${user.role}</c:if></option>
							<option style="color:orange">user</option>
							<option style="color:orange">admin</option>
							<option style="color:red">root</option>
						</select>

  						<a href="javascript:history.go(-1);">取消</a>
  						<input type="submit" class="button blue" value="提交"/>
  			</form>