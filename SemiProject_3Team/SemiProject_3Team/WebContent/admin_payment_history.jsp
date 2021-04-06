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
<title>Insert title here</title>
</head>
<%
	List<PayDto> list = (List<PayDto>) request.getAttribute("list");
%>
<body>

	<h1>결제 내역</h1>
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>유저id</th>
				<th>상품번호</th>
				<th>수량</th>
				<th>가격</th>
				<th>주문날짜</th>
			</tr>
<%
	for (PayDto dto : list) {
%>
			
			<tr>
				<td><%=dto.getOrderSeq() %></td>
				<td><%=dto.getUserId() %></td>
				<td><%=dto.getProjectItemSeq() %></td>
				<td><%=dto.getQuantity() %></td>
				<td><%=dto.getPurchasePrice() %></td>
				<td><%=dto.getOrderDate() %></td>
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