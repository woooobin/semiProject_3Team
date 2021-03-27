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
	<h1>MyPage</h1>
	<h2><%=dto.getUserid() %>님, 환영합니다.</h2>
	<div>
	<input type="button" value="MainPage" onclick="location.href='index.jsp'"/>
	</div>
	<table border="1">
		</tr>
			<tr>
			<th>프로필사진</th>
			<td><%=dto.getAvatar() %></td>
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
			<tr>
			<th>구매자&판매자</th>
			<td><%=dto.getIsseller() %></td>
			<tr>
			<td colspan="2" align="right">
				<input type="button" value="정보 수정" onclick="location.href=login.do?=command=userupdate"/>
				<input type="button" value="회원 탈퇴" onclick="location.href=''"/>
			</td>
		</tr>
		</tr>
	</table>
	<div>	
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