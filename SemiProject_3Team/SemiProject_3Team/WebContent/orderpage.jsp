<%@page import="com.poosil.pay.dto.PayDto"%>
<%@page import="com.poosil.projects.dto.ProjectItemDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>

<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	loginDto logindto = (loginDto)session.getAttribute("dto"); 
	System.out.println("logindto = " + logindto.getUserid());
	ProjectItemDto projectitemdto = (ProjectItemDto)request.getAttribute("projectitemdto");
	System.out.println("projectItemSeq 3 = " + projectitemdto.getProjectItemSeq());
%>
<body>

	<h1>주문서 작성</h1>
	<form action="pay.jsp" method="post">
		<table border="1">
			<tr>
				<th>주문번호</th>
				<td></td>
			</tr>
			<tr>
				<th>상품 번호</th>
				<td><textarea rows="2" cols="25" name="projectItemSeq"><%=projectitemdto.getProjectItemSeq() %></textarea></td>
			</tr>
			<tr>
				<th>상품 명</th>
				<td><textarea rows="2" cols="25" name="projectName"><%=projectitemdto.getProjectItemName() %></textarea></td>
			</tr>			
			<tr>
				<th>수량</th>
				<td><textarea rows="2" cols="25" name="quantity"><%=projectitemdto.getQuantity() %></textarea></td>
			</tr>
			<tr>
				<th>총 가격</th>
				<td><textarea rows="2" cols="25" name="price"><%=projectitemdto.getPrice() %></textarea></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><textarea rows="2" cols="25" name="userId"><%=logindto.getUserid() %></textarea></td>
			</tr>
			<tr>
				<th>받는사람 이름</th>
				<td><textarea rows="2" cols="25" name="name"><%=logindto.getUsername() %></textarea></td>
			</tr>
			<tr>
				<th>받는 사람 주소</th>
				<td><textarea rows="2" cols="25" name="address"><%=logindto.getAddress() %></textarea></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><textarea rows="2" cols="25" name="phone"><%=logindto.getUserphone() %></textarea></td>
			</tr>

			<tr>
				<th>주문 날짜</th>
				<td></td>
			</tr>
			
			<tr align="right">
				<td colspan="2">
					<input type="submit" value="결제">
					<input type="button" value="취소" onclick="location.href='index.jsp'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>