<%response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");%>

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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	loginDto dto = (loginDto)session.getAttribute("dto");
	System.out.println(dto);
	if (dto == null) {
		pageContext.forward("index.html");
	}
%>

<body>

	<div>
		<h1><%=dto.getUserid() %>MyPage</h1>
		<a href="login.do?command=logout">logout</a>
	</div>
	<div>
		<a href="login.do?command=myinfo&userid=<%=dto.getUserid()%>">내 정보 조회</a>
	</div>
	<div>
		<a href="login.do?command=myupdate">내 정보 수정</a>
	</div>
	<div>
		<a href=" ">결제 내역 보기</a>
	</div>
	<div>
		<a href="login.do?command=mydelete">회원 탈퇴</a>
	</div>


</body>
</html>