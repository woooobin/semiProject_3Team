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
				<td><textarea rows="2" cols="25" name="projectItemSeq"></textarea></td>
			</tr>
			<tr>
				<th>상품 명</th>
				<td><textarea rows="2" cols="25" name="projectName"></textarea></td>
			</tr>			
			<tr>
				<th>수량</th>
				<td><textarea rows="2" cols="25" name="quantity"></textarea></td>
			</tr>
			<tr>
				<th>총 가격</th>
				<td><textarea rows="2" cols="25" name="price"></textarea></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><textarea rows="2" cols="25" name="userId"></textarea></td>
			</tr>
			<tr>
				<th>받는사람 이름</th>
				<td><textarea rows="2" cols="25" name="name"></textarea></td>
			</tr>
			<tr>
				<th>받는 사람 주소</th>
				<td><textarea rows="2" cols="25" name="address"></textarea></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><textarea rows="2" cols="25" name="phone"></textarea></td>
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