
<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

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
			
		</div>
		<div class="rgt">
			<%
			if (!isLoggedIn) {
			%>
			
			<nav class="nav">
		
				<li>
					<a aria-current="page" href="login.jsp">로그인</a>
				</li>
				<li>
					<a href="signup.jsp">회원가입</a>
				</li>
			
			</nav>
			<%
			} else {
			%>
			<nav class="nav">
				<li><a aria-current="page"
					href="login.do?command=mypage&userrole=<%=dto.getUserrole()%>&userid=<%=dto.getUserid()%>">
						<img alt="MyPage"
						src="data:image/png;base64,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"
						style="width: 20px;">
				</a></li>

				<li>
					<a href="login.do?command=logout">
						<img alt="logout" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAAD09PTKyspRUVGenp7FxcXCwsJiYmJKSko9PT2EhIS/v798fHzo6OimpqaysrLj4+OWlpbU1NSNjY0oKChERERjY2M8PDxycnLa2tpNTU1oaGjw8PA0NDTQ0NBWVla1tbUPDw8fHx8uLi5bICU4AAADZ0lEQVR4nO3di1abQBSF4SFq2kold7SJ0drm/Z+xra0FDM3qgrPZh8P+HyDjtyYJwgwkJaWUUkoppZQaulW+y8jt8hUQuGbzfreGAXM27a0cBJyzYVVXGGHJdlWdIMAVm1UP8m2zYavqQd6mV2xVvbmEEkpIT0IJ/0N4SLNh+zi08BoxxKXuwwvjz6GEBkkITkKDJAQnoUESgpua8ANiCLKwDC+8lbB/EoKT0CCy8CG88FNj+AFWZsjCZ8QQroTx51DCTkkITkKDyMKvjeEjHi3uGsMfEUOQhXP86GRh44O4gYzAFhbV4KDNiWxhKt5OLxagAejClF4eH56utwXq5R0IfzYDvrYPITIJx5+E40/C8Sfh+JNw/Ek4QMXi7m4LuUTzGl/45965EnOG70BYXcaArK3xhV9qo2OIZOG+MXzEFdJtBie62hMFIZKFhwxOJAsf3wuzz9ZDkIU3Z0LzWSQLj+dC61lkHw8XLUTbWWQLWx94YDqLdOG7JUT7WeQLW2fRkOhACH6jehC2vlHNiC6E0Fn0IUR+Fp0IgbPoRYg7aLgRwmbRjxBFdCQEET0JMURXQshBw5cQMYvOhIBZtBAelzdmLdoecNhrFvsLZ23HauP6EHsLj094YJYticLbf/xNxnVffesrXA4DzEqacJD36K86P3Gwr3AoYPcNtj2FbVd0Ywnjz+EEPofxv0vjHw8n8D9N/P9LU/xzC9t8nh8aFv4cP/x1GsjqhSdh+OuloPUnP8Lw6xbh157Crx+GXwMOv44P3TTkQRh+P034PVHh97WBZ5AvDL+/tO2KsvE2aO3zBhd/r378+y3i3zMT/76n+Peuxb//cAL3kE7gPuAJ3MuNTsLxJ+H4k3D8STj+JBx/Eo4/D8Jis9njXp0v3L8+tfyEeowwX/j3sn4JetQuW/hSDd59k+zFyMLZt9romDcqWdhYevoOGcLVukXn3eqXcrVuEfHXH+L/goeEBkkIbmpCfZd2Sr9/CC7+b1hKaJCE4CQ0yNXZU0Rhc9fXHDGEhOAkNEhCcBIaJCE4CQ2SENz90MJDmg3b4HNITkIJJeQnoYStbdiqepCVmRVbVQ+yFyOVbFbVCQJMc7arCvIxTGe3cfLKQcDWO8YZrWHAlIpt26P8Bm2XY75llFJKKaWUUupiPwCvakAP0y1rSQAAAABJRU5ErkJggg==" width="20px;">
					</a>
				</li>
			</nav>

			<% 
			}
			%>
		</div>
		<div class="row">
			<h1><a href="index.jsp">로고</a></h1>
			
			<ul class="gnb">
				<li><a href="./search.jsp ">카테고리</a></li>
				<li><a href="project.do?command=selectList">펀딩하기</a></li>
				<li><a href="rank.do?command=selectAll">랭킹</a></li>
				
				<li><a href="#">이용가이드</a></li>
				<li><a href="free.do?command=list">자유게시판</a></li>
				<li><a href="notice.do?command=list">공지게시판</a></li>
			</ul>
		</div>
	</div>
	
</header>












