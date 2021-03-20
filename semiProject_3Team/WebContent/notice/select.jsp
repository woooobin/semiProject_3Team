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
<title>Insert title here</title>
</head>
<body>
	
	<h1></h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.userid }</td>
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
				<input type="button" value="수정" onclick="location.href='notice.do?command=updateform&seq=${dto.noticeseq}'">
				<input type="button" value="삭제" onclick="location.href='notice.do?command=delete&seq=${dto.noticeseq}'">
				<input type="button" value="목록" onclick="location.href='notice.do?command=list'">
			</td>
		</tr>
	</table>
</body>
</html>