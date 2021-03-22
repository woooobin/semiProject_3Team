<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

</style>
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<col width="50">
		<col width="100">
		<col width="500">
		<col width="100">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">------------작성된 글이 존재하지 않습니다.-------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.noticeseq }</td>
						<td>${dto.userid }</td>
						<td><a href="notice.do?command=select&noticeseq=${dto.noticeseq }">${dto.noticetitle }</a></td>
						<td>${dto.regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>