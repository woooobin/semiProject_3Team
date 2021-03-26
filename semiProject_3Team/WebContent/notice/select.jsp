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
	
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>작성자</th>
			<td>${dto.usernickname }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.noticetitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="10" cols="60" readonly="readonly">${dto.noticecontent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href='notice.do?command=updateform&noticeseq=${dto.noticeseq}'">
				<input type="button" value="삭제" onclick="location.href='notice.do?command=delete&noticeseq=${dto.noticeseq}'">
				<input type="button" value="목록" onclick="location.href='notice.do?command=list'">
			</td>
		</tr>
	</table>
</body>
</html>