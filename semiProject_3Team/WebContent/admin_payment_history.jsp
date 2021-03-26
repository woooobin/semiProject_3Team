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
<body>

	<h1>결제 내역</h1>
		<table border="1">
			<tr>
				<th>주문자명</th>
				<th>상품명</th>
				<th>수량</th>
				<th>총가격</th>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="홈으로" onclick="location.href='index.jsp'"/>
				</td>
			</tr>
		</table>



</body>
</html>