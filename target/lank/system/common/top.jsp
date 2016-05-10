
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<div class="testing">
		<header class="main">
		<h1>${userSession } ${a}
			<%-- <strong>${loginuser.username }</strong>   ：<c:if test="${loginuser.role=='root'}">超级管理员</c:if>
			<c:if test="${loginuser.role=='admin'}">管理员</c:if>
			<c:if test="${loginuser.role=='user'}">用户</c:if> --%>
		</h1>
		<input type="text" value="search" /> </header>
		<section class="user">
		<div class="profile-img">
			<p>
				<img src="../images/title.jpg" alt="" height="40" width="40" />
				Welcome back home
			</p>
		</div>
		<div class="buttons">
			<button class="ico-font">&#9206;</button>

			<span class="button dropdown"> <a href="#">近来安排 <span
					class="pip">6</span></a>
				<ul class="notice">
					<li><hgroup>
						<h1>Hi, I need a favour</h1>
						<h2>John Doe</h2>
						<h3>Lorem ipsum dolor sit amet, consectetuer sed aidping
							putamus delo de sit felume...</h3>
						</hgroup>
						<p>
							<span>11:24</span>
						</p></li>
					<li><hgroup>
						<h1>
							<span class="icon">&#59154;</span>Hi, I need a favour
						</h1>
						<h2>John Doe</h2>
						<h3>Lorem ipsum dolor sit amet, consectetuer sed aidping
							putamus delo de sit felume...</h3>
						</hgroup>
						<p>
							<span>11:24</span>
						</p></li>
					<li><hgroup>
						<h1>
							<span class="icon">&#59154;</span>Hi, I need a favour
						</h1>
						<h2>John Doe</h2>
						<h3>Lorem ipsum dolor sit amet, consectetuer sed aidping
							putamus delo de sit felume...</h3>
						</hgroup>
						<p>
							<span>11:24</span>
						</p></li>
				</ul>
			</span> <span class="button"><a href="plan">计划</a></span> <span
				class="button"><a href="#">待定</a></span> <span class="button blue"><a
				href="logout">退出登陆</a></span>
		</div>
		</section>
	</div>
