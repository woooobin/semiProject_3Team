<%@page import="com.poosil.projects.dto.ProjectDto"%>
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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/main.css" rel="stylesheet">
<title>Insert title here</title>

</head>

<%
	loginDto logindto = (loginDto)session.getAttribute("dto"); 
	System.out.println("logindto = " + logindto.getUserid());
	ProjectItemDto projectitemdto = (ProjectItemDto)request.getAttribute("projectitemdto");
	System.out.println("projectItemSeq 3 = " + projectitemdto.getProjectItemSeq());
	ProjectDto projectdto = (ProjectDto)request.getAttribute("projectdto");
%>
<body>

	<%@ include file="./ui/header.jsp"%>

	<h1>주문서 작성</h1><br>
	<form action="pay.jsp" method="post">
		<table border="1">
			<tr>
			<th>결제 방식</th>
				<td>
					<select>
						<option value="kakao">카카오페이</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품사진</th>
				<td><%=projectdto.getThumbImage() %></td>
			</tr>
			<tr>
				<th>주문번호</th>
				<td></td>
			</tr>
			<tr>
				<th>상품 번호</th>
				<td><textarea rows="2" cols="25" name="projectItemSeq"><%=projectitemdto.getProjectItemSeq() %></textarea></td>
			</tr>
			<tr>
				<th>projectId</th>
				<td><textarea rows="2" cols="25" name="projectId"><%=projectitemdto.getProjectId() %></textarea></td>
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
				<th>상품가</th>
				<td><textarea rows="2" cols="25" name="price"><%=projectitemdto.getPrice()%></textarea></td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><textarea rows="2" cols="25" name="deliveryFee">3000</textarea></td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td><textarea rows="2" cols="25" name="purchasePrice"><%=projectitemdto.getPrice()+3000%></textarea></td>
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