<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
	<h1></h1>
	
	<form action="notice.do" method="post">
		<input type="hidden" name="command" value="insertres">
		<table border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<th>분류</th>
				<td><select name="option" >
					<option value="all">전체</option>
					<option value="notice">공지</option>
					<option value="event">이벤트</option>
				</select></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticetitle"></td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">내용</th>
				<td><textarea rows="10" cols="60" name="noticecontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="notice.do?command=list" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>