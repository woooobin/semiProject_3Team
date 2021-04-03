<%response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");%>

<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%  response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>

<%loginDto dto = (loginDto)session.getAttribute("dto");%>

<body>
	<h1>MyPage</h1>
	<h2><%=dto.getUserid() %>
	<%session.setAttribute("userid", request.getAttribute("userid"));%><%session.setAttribute("password", request.getAttribute("password"));%>	
	님, 환영합니다.</h2>
	<div>
	<input type="button" value="MainPage" onclick="location.href='index.jsp'"/>
	</div>
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
	</div>
	


</body>
</html>