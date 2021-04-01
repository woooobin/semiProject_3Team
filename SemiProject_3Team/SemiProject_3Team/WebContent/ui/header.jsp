
<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<% 
loginDto dto = (loginDto)session.getAttribute("dto");

%>

<%
Boolean isLoggedIn = dto!= null;
//나중에 유저 인지 아닌지 여기다가 세팅해서 가꼬와
String userrole = "ADMIN";
String userId = "WOOBINTEST";
String userNickname = "ADMIN";
%>

<header>

	<div class="container">
		<div class="lft">
			<h1><a href="index.jsp">로고</a></h1>
		</div>
		<div class="rgt">
			<%
			if (!isLoggedIn) {
			%>
			<nav class="nav">
				<li><a aria-current="page" href="login.jsp">login</a></li>
				<li><a href="signup.jsp">sign up</a></li>
			</nav>
			<%
			} else {
			%>
			<nav class="nav">
				<li><a aria-current="page" href="login.do?command=mypage&userrole=<%=dto.getUserrole()%>&userid=<%=dto.getUserid()%>">mypage</a></li>
				<li><a href="login.do?command=logout">logout</a></li>
			</nav>

			<% 
			}
			%>
		</div>
		<div class="row">
			
			<ul class="gnb">
				<li><a href="#">카테고리</a></li>
				<li><a href="project.do?command=selectList">펀딩하기</a></li>
				<li><a href="#">랭킹</a></li>
				<li><a href="#">이용가이드</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="notice.do?command=list&userrole=${userrole }">공지게시판</a></li>
			</ul>
		</div>
		
	</div>
</header>












