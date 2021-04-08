
<%
	// 응답 객체에 헤딩을 셋팅해준다.
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-control", "no-store");
response.setHeader("Expires", "0");

/*
	뒤로가기 했을 때, 이전 화면이 보이는 이유 
		-> 서버에서 문서를 받아오는 것이 아니라, 캐시에 저장된 값을 화면에 뿌려줌.
	
	브라우저가 캐시에 응답결과(response)를 저지하지 않도록 설정. 캐시에 값을 업애기.
	
	// http
	response.setHeader("Pragma", "no-cache");				// http 1.0
	response.setHeader("Cache-control", "no-store");		// http 1.1
	response.setHeader("Expires", "0");						// proxy server
	
	우리는 : http 1.1 
		
*/
%>
<!-- com.poosil.login.dto.loginDto -->

<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<link href="./styles/home.css" rel="stylesheet" media="all">
<style type="text/css">
img {
	height: 30px;
	width: 30px;
}

.block_userlist, .block_usersearch, .block_paylist {
	height: 300px;
	width: 200px;
	border: 1px solid black;
	border-radius: 15px;
}

.block_userinfo {
	height: 400px;
	width: 300px;
	border: 1px solid black;
	border-radius: 15px;
	
}

.logout_btn {
	border: 1px solid black;
	border-radius: 30px;
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
<body data-home-page="Home.html" data-home-page-title="Home"
	class="u-body">
	<section
		class="u-border-2 u-border-palette-3-light-3 u-clearfix u-white u-section-1"
		id="carousel_9b7d">
		<div class="block_all">
			<div class="block_menu">
				<div class="block_userlist">
					<div
						class="u-container-layout u-similar-container u-container-layout-1">
						<span class="u-icon u-icon-circle u-icon-1"><img
							src="./svg/SVG_Bell.svg"></span> <a
							href="login.do?command=listall"><h3
								class="u-custom-font u-font-playfair-display u-text u-text-black u-text-1">
								회원 전체<br>목록 조회</a>
						</h3>
					</div>
				</div>
				<div class="block_usersearch">
					<div
						class="u-container-layout u-similar-container u-container-layout-2">
						<span class="u-icon u-icon-circle u-icon-2"><img
							src="./svg/SVG_camera.svg"></span> <a href="userSearch.jsp"><h3
								class="u-custom-font u-font-playfair-display u-text u-text-black u-text-2">회원
								정보 검색</h3></a>
					</div>
				</div>
				<div class="block_paylist">
					<div
						class="u-container-layout u-similar-container u-container-layout-3">
						<span class="u-icon u-icon-circle u-icon-3"><img
							src="./svg/SVG_notes.svg"></span> <a
							href="pay.do?command=adminpaylist"><h3
								class="u-custom-font u-font-playfair-display u-text u-text-black u-text-3">총
								결제 내역</h3></a>
					</div>
				</div>
			</div>
			<div class="block_userinfo">
				<div class="u-container-layout u-container-layout-4">
					<span class="u-icon u-icon-circle u-icon-4"><img
						src="./svg/SVG_contacts.svg"></span>
					<h2 class="u-custom-font u-font-playfair-display u-text u-text-4"><%=dto.getUserid()%>님,<br>환영합니다.
					</h2>
					<a href="login.do?command=logout" class="logout_btn">logout</a>
				</div>
			</div>
		</div>
	</section>

</body>
</html>