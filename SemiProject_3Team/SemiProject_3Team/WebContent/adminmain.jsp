<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 응답 객체에 헤딩을 셋팅해준다.
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-control", "no-store");
response.setHeader("Expires", "0");
%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<style type="text/css">
img {
	height: 48px;
	width: 48px;
}

a {
	color: black;
	text-decoration: none;
}


.block_all {
	display: block;
	align-content: center;
	margin-top: 100px;
	margin-left: 250px;
}

.block_userlist, .block_usersearch, .block_paylist {
	display: block;
	float: left;
	height: 300px;
	width: 200px;
	border: 1px solid #f9e79b;
	border-radius: 15px;
	padding: 10px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 50px;
	background: #FFDF00;

}

.block_userinfo {
	display: block;
	float: left;
	height: 400px;
	width: 300px;
	border: 1px solid #f1c50e;
	border-radius: 15px;
	padding: 10px;
	background-color: #f1c50e;
	margin-left: 20px;
	margin-right: 20px;
}

.logout_btn {
	border: 1px solid black;
	border-radius: 30px;
	color: #f1c50e;
	background: #FFFFFF;
	text-transform: uppercase;
	letter-spacing: 3px;
	border-style: none;
	font-weight: 700;
	font-size: 0.875rem;
	background-image: none;
	margin: 20px 388px 0 0;
	padding: 10px 30px;
	position: relative;
}

.logo {
	justify-content: center;
	align-items: center;
	width: 130px;
	height: 94px;
}

.page_name {
	text-align: center;
}
</style>
<title>Home</title>
<%
	loginDto dto = (loginDto) session.getAttribute("dto");
if (dto == null) {
	pageContext.forward("index.html");
}
%>
</head>
<body style="background: #fcf798;">

	<a href="index.jsp"><img
		src="./images/logo/logo_transparent_notypo.png" class="logo"></a>
		
		<div class="page_name">
			<h1>ADMIN MANAGE PAGE</h1>
		</div>

	<section
		class="u-border-2 u-border-palette-3-light-3 u-clearfix u-white u-section-1"
		id="carousel_9b7d">
		<div class="block_all">
			<div class="block_menu">
				<div class="block_userlist">
					<div
						class="u-container-layout u-similar-container u-container-layout-1">
						<span class="u-icon u-icon-circle u-icon-1"> <img
							src="./svg/SVG_Bell.svg"></span> <a
							href="login.do?command=listall"><h3>
								회원 전체 <br> 목록 조회
							</h3></a>
					</div>
				</div>
				<div class="block_usersearch">
					<div
						class="u-container-layout u-similar-container u-container-layout-2">
						<span class="u-icon u-icon-circle u-icon-2"> <img
							src="./svg/SVG_camera.svg"></span> <a href="userSearch.jsp"><h3>회원
								정보 검색</h3></a>
					</div>
				</div>
				<div class="block_paylist">
					<div
						class="u-container-layout u-similar-container u-container-layout-3">
						<span class="u-icon u-icon-circle u-icon-3"> <img
							src="./svg/SVG_notes.svg"></span> <a
							href="pay.do?command=adminpaylist"><h3>총 결제 내역</h3></a>
					</div>
				</div>
			</div>
			<div class="block_userinfo">
				<div class="u-container-layout u-container-layout-4">
					<span class="u-icon u-icon-circle u-icon-4"><img
						src="./svg/SVG_contacts.svg" style="width: 64px; height: 64px;"></span>
					<h2 class="u-custom-font u-font-playfair-display u-text u-text-4"><%=dto.getUserid()%>님,<br>환영합니다.
					</h2>
					<a href="login.do?command=logout" class="logout_btn">logout</a>
				</div>
			</div>
		</div>
	</section>

</body>
</html>