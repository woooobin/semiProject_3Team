<%@page import="com.poosil.projects.dao.ProjectDaoImpl"%>
<%@page import="com.poosil.projects.dao.ProjectDao"%>
<%@page import="com.poosil.projects.dto.ProjectDto"%>
<%@page import="java.util.List"%>
<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/main.css" rel="stylesheet">
<link href="./css/.css" rel="stylesheet">
<title>Hello, world!</title>


</head>
<body>
	<%@ include file="./ui/header.jsp"%>


	<div class="container">
		<!-- Slider main container -->
		<div class="swiper-container">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide">
					<h2>먼 곳의 농산물을 체험해 보세요.</h2>
					<img src="images/slide01.jpeg" style="top: 25px;" />
				</div>
				<div class="swiper-slide">
					<h2>이웃을 응원해서 선물을 받아보세요.</h2>
					<img src="images/slide02.jpeg" style="top: 25px;" />
				</div>
			</div>
			<!-- If we need pagination -->
			<!-- 			<div class="swiper-pagination"></div> -->


			<!-- If we need scrollbar -->
			<div class="swiper-scrollbar"></div>
		</div>
		<!--  -->
		<div class="container-project">
			<h2>인기있는 프로젝트</h2>
			<div class="main-projects-wrap">
				<ol class="main-project-list">
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="like_1"
								src="./images/mainFake/like_1.png"
								style="width: 200px; height: 230px;"> <em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="like_2"
								src="./images/mainFake/like_2.png"
								style="width: 200px; height: 230px;"> <em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="like_3"
								src="./images/mainFake/like_3.png"
								style="width: 200px; height: 230px; top: 200px; left: auto">
								<em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="like_4"
								src="./images/mainFake/like_4.png"
								style="width: 200px; height: 230px;"> <em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
				</ol>
			</div>
			<h2>신규 프로젝트</h2>
			<div class="main-projects-wrap">
				<ol class="main-project-list">
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="created_1"
								src="./images/mainFake/created_1.png"
								style="width: 200px; height: 230px; top: 200px; left: auto">
								<em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="created_2"
								src="./images/mainFake/created_2.png"
								style="width: 200px; height: 230px; top: 200px; left: auto">
								<em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="created_3"
								src="./images/mainFake/created_3.png"
								style="width: 200px; height: 230px; top: 200px; left: auto">
								<em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
					<li class="main-projects-list-item"><a> <span
							class="frame"> <img alt="created_4"
								src="./images/mainFake/created_4.png"
								style="width: 200px; height: 230px; top: 200px; left: auto">
								<em></em>
								<h3></h3>
						</span>
					</a>
						<p>
							<span></span> <span></span>
						</p></li>
				</ol>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		/* 			pagination : {
		 el : '.swiper-pagination',
		
		 }, */
		});
	</script>
</body>
</html>
