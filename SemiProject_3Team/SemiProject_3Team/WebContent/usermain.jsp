<%response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");%>

<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%  response.setContentType("text/html; charset=UTF-8");%>

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
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<%
	loginDto dto = (loginDto) session.getAttribute("dto");
if (dto == null) {
	pageContext.forward("index.html");
}
%>

<body style="background: #fcf798;">

	<a href="index.jsp"><img
		src="./images/logo/logo_transparent_notypo.png" class="logo"></a>
		
		<div class="page_name">
			<h1>USER MANAGE PAGE</h1>
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
							href="userupdate.jsp"><h3>
								정보 수정  
							</h3></a>
					</div>
				</div>
				
				<div class="block_paylist">
					<div
						class="u-container-layout u-similar-container u-container-layout-3">
						<span class="u-icon u-icon-circle u-icon-3"> <img
							src="./svg/SVG_notes.svg"></span> <a
							href="pay.do?command=custompaylist&userid=<%=dto.getUserid()%>"><h3>결제 내역</h3></a>
					</div>
				</div>
			</div>
			<div class="block_userinfo">
				<div class="u-container-layout u-container-layout-4">
					<span class="u-icon u-icon-circle u-icon-4"></span>
					<h2 class="u-custom-font u-font-playfair-display u-text u-text-4"><%=dto.getUsername() %>님,<br>환영합니다.
					</h2>
					<a href="login.do?command=logout" class="logout_btn">logout</a>
				</div>
			</div>
		</div>
	</section>

	<!-- <h1>내 정보</h1>
	<h2><%=dto.getUserid() %>
	<%session.setAttribute("userid", request.getAttribute("userid"));%>
	님, 환영합니다.</h2>
	
	<table border="1">
		</tr>
			<tr>
			<th>프로필사진</th>
			<td><img alt="프로필사진" src="<%=dto.getAvatar() %>"></td>
		</tr>
		<tr>
			<th>닉네임 </th>	
			<td><%=dto.getUsernickname() %> </td>
		</tr>
		
		<tr>
			<th>이름 </th>
			<td><%=dto.getUsername() %> </td>
		</tr>
		
		<tr>
			<th>휴대폰번호 </th>
			<td><%=dto.getUserphone() %></td>
		</tr>
			<tr>
			<th>주소 </th>
			<td><%=dto.getAddress() %></td>
		</tr>
			
			<td colspan="2" align="left">
				<input type="button" value="정보 수정" onclick="location.href='userupdate.jsp'"/>
			</td>
		</tr>
		</tr>
	</table>
	<div>	
		<a href="login.do?command=logout">logout</a>
	</div>
	<div>
		<a href="pay.do?command=custompaylist&userid=<%=dto.getUserid()%>">결제 내역 보기</a>
	</div>
	<div>
		<a href="login.do?command=userdelete&userid=<%=dto.getUserid() %>">회원 탈퇴</a>
	</div> -->
	


</body>
</html>