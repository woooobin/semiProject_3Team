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
<script type="text/javascript">
	
	
	
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
	<h2>${dto.freeboardtitle }</h2>
	
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>${dto.userid }</td>
			<td>${dto.readcount }</td>
		</tr>
		<tr>
			<td>
				<textarea rows="10" cols="60" readonly="readonly">${dto.freeboardcontent }</textarea>
			</td>
		</tr>
		<tr>
			<td id="view" colspan="3" align="right">
				<input type="button" value="수정" onclick="location.href='free.do?command=updateform&freeboardseq=${dto.freeboardseq}'">
				<input type="button" value="삭제" onclick="location.href='free.do?command=delete&freeboardseq=${dto.freeboardseq}'">
				<input type="button" value="목록" onclick="location.href='free.do?command=list'">
			</td>
		</tr>
	</table>
</body>
</html>