
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
<title>Insert title here</title>
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
<% String sessionID = (String)session.getAttribute("sessionID"); %>
<%@ include file="../ui/header.jsp" %>
	<table border="1">
		<col width="50">
		<col width="500">
		<col width="100">
		<col width="100">
		<col width="50">
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">------------작성된 글이 존재하지 않습니다.-------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr align="center">
						<td>${dto.freeboardseq }</td>
						<td><a href="free.do?command=select&freeboardseq=${dto.freeboardseq }">${dto.freeboardtitle }</a></td>
						<td>${dto.userid }</td>
						<td>${dto.regdate }</td>
						<td>${dto.readcount }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			<c:if test="${sessionID != null }">
				<tr>
					<td colspan="4" align="right">
						<input type="button" value="글작성" onclick="location.href='free.do?command=insertform'" >
					</td>
				</tr>
			</c:if>
	</table>
</body>
</html>