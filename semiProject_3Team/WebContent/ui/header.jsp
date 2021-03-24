<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<style>
header {
	positon: relative; height : 200px;
	border-bottom: 1px solid #eee;
	height: 200px;
}

h1 {
	positon: absolute;
	left: 20px;
	top: 20px;
	height: 50px;
	width: 50px;
	background-color: #333;
}

h1 a {
	font-size: 15px;
	display: block;
	width: 100%;
	height: 100%;
	verrtical-align: top;
}
</style>

<%
Boolean isUser = false;
//나중에 유저 인지 아닌지 여기다가 세팅해서 가꼬와
%>
<header>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">로고 </a></li>
			</div>
			<div class="col-md-4 offset-md-4 col-auto">
				<%
				if (!isUser) {
				%>
				<nav class="nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login.jsp">login</a></li>
					<li class="nav-item"><a class="nav-link" href="signup.jsp">sign up</a></li>
					<li class="nav-item"><a class="nav-link" href="orderpage.jsp">결제</a></li>
					<li class="nav-item"><a class="nav-link" href="shoppingcart.jsp">장바구니</a></li>
				</nav>
				<%
				} else {
				%>
				<nav>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="mypage.jsp">mypage</a></li>
				</nav>

				<% 
				}
				%>

			</div>
		</div>
		<nav class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">카테고리</a></li>
			<li class="nav-item"><a class="nav-link" href="project.do?command=selectList">펀딩하기</a></li>
			<li class="nav-item"><a class="nav-link" href="#">랭킹</a></li>
			<li class="nav-item"><a class="nav-link" href="#">이용가이드</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">공지게시판</a></li>
		</nav>
	</div>
</header>