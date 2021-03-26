<%@page import="com.poosil.login.dto.loginDto"%>
<%@page import="java.util.List"%>

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
<body>
<%
	List<loginDto> list = (List<loginDto>) request.getAttribute("list");
%>

	<h1>회원 전체 조회(관리자,사용자)</h1>

	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>판매여부</th>
			<th>유저등급</th>
			<th>위도</th>
			<th>경도</th>
			<th>옵션</th>
			<th>닉네임</th>
			<th>프로필사진</th>
		</tr>
<%
	for (loginDto dto : list) {
%>
	<tr>
		<td><%=dto.getUserid() %></td>
		<td><%=dto.getPassword() %></td>
		<td><%=dto.getUsername() %></td>
		<td><%=dto.getAddress() %></td>
		<td><%=dto.getUserphone() %></td>
		<td><%=dto.getUseremail() %></td>
		<td><%=dto.getIsseller() %></td>
		<td><%=dto.getUserrole() %></td>
		<td><%=dto.getAddresslatitude() %></td>
		<td><%=dto.getAddresslongitude() %></td>
		<td><%=dto.getSellersOpt() %></td>
		<td><%=dto.getUsernickname() %></td>
		<td><%=dto.getAvatar() %></td>
		
	</tr>
<%
	}
%>

	<tr>
		<td colspan="1" align="right">
			<input type="button" value="마이페이지" onclick="location.href='login.do?command=adminback'" />
		</td>
	</tr>
	</table>

</body>
</html>