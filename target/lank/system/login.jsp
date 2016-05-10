<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>Retina Dashboard</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/style.css" />
<script src="<%=request.getContextPath()%>/js/common/jquery.min.js"></script>
<script type="text/javascript">
	var contextPath= "<%=request.getContextPath()%>";
</script>

</head>
<body class="login">
	<section>
	<h1>
		<strong>Abel</strong> System
	</h1>${request.Scope.error}
	<form id="formtable"
		action="<%=request.getContextPath()%>/userLogin/login_in"
		method="post">
		<input type="text" value="user" name="username" id="username" /> <input
			 type="text" name="password" id="password" />
		<div class="login_wrong" id="messageDiv" style="height: 20px"></div>
		<button class="blue">Login</button>
	</form>
	<p>
		<a href="#">Forgot your password?</a>
	</p>
	</section>

	<script type="text/javascript">
	if ("${error2}" != "") {
		alert("${error2}");
	};
		$('.login button').click(function() {

			
			var user = $("#username").val();
			var pwd = $("#password").val();
			if (!user || !pwd) {
				alert("请输入账号及密码");
				
				
			} else {
	
				$("#formtable").sublimt();
			}
			// Get the url of the link 
		});
	</script>
</body>
</html>