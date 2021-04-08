<%@page import="com.poosil.login.dto.loginDto"%>
<%@page import="com.poosil.pay.dto.PayDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="images/logo/favicon.png" rel="shortcut icon">
<title>POOSIL</title>
</head>
<%
	loginDto logindto = (loginDto)session.getAttribute("logindto"); 
	List<PayDto> list = (List<PayDto>)request.getAttribute("paylist");
%>
<body>

	<%@ include file="./ui/header.jsp"%>

	<h1>결제 내역</h1>
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>유저id</th>
				<th>상품번호</th>
				<th>가격</th>
				<th>주문날짜</th>
			</tr>
<% 
for (PayDto paydto : list) {
%>

			<tr>
				<td><%=paydto.getOrderSeq() %></td>
				<td><%=paydto.getUserId() %></td>
				<td><%=paydto.getProjectItemSeq() %></td>
				<td><%=paydto.getPurchasePrice() %></td>
				<td><%=paydto.getOrderDate() %></td>
			</tr>
			
<%
}
%>			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="홈으로" onclick="location.href='index.jsp'"/>
				</td>
			</tr>
		</table>

</body>
</html>