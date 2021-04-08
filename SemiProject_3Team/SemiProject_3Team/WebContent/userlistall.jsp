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
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

body {
	font-family: '맑은 고딕' 돋움;
	font-size: 0.75em;
	color: #333
}

.tbl-ex {
	margin: 100px auto 0px auto;
}

.tbl-ex, .tbl-ex th, .tbl-ex td {
	border: 1px solid gray;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	padding: 8px;
}

.tbl-ex th {
	background-color: #f5f6f7;
	font-size: 1.1em;
	color: #000000;
	border-width: 2px 0;
}

.tbl-ex td {
	border-style: dotted;
}

.tbl-ex tr:hover td {
	background-color: #f1c50e;
	color: #000000 cursor: pointer;
}

.even {
	background-color: #FFFFFF;
}

.page_name {
	text-align: center;
}
</style>

</head>
<body>
	<%
		List<loginDto> list = (List<loginDto>) request.getAttribute("list");
	%>
	<div class="page_name">
		<h1>회원 전체 조회(관리자,사용자)</h1>
	</div>

	<br />
	<table border="1" class="tbl-ex">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>유저등급</th>
			<th>위도</th>
			<th>경도</th>
			<th>옵션</th>
			<th>닉네임</th>
			<th>프로필사진</th>
			<th>탈퇴여부</th>
		</tr>
		<%
			for (loginDto dto : list) {
		%>
		<tr class="even">
			<td><%=dto.getUserid()%></td>
			<td><%=dto.getPassword()%></td>
			<td><%=dto.getUsername()%></td>
			<td><%=dto.getAddress()%></td>
			<td><%=dto.getUserphone()%></td>
			<td><%=dto.getUseremail()%></td>
			<td><%=dto.getUserrole()%></td>
			<td><%=dto.getAddresslatitude()%></td>
			<td><%=dto.getAddresslongitude()%></td>
			<td><%=dto.getSellersOpt()%></td>
			<td><%=dto.getUsernickname()%></td>
			<td><img src="<%=dto.getAvatar()%>"></td>
			<td><%=dto.getUserenabled()%></td>


		</tr>
		<%
			}
		%>

		<tr>
			<td colspan="13" align="right"><input type="button"
				value="마이페이지" onclick="location.href='login.do?command=adminback'" />
			</td>
		</tr>
	</table>
</body>
</html>