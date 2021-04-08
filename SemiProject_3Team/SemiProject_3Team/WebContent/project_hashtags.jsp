<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/ranking.css" rel="stylesheet">
<style>
.hashtag{
	display: inline-block;
    padding: 4px 13px;
    border-radius: 5px;
    background-color: #40a798;
    color: #fff !important;
    font-weight: 400;
 }
</style>
</head>
<body>
	<%@ include file="../ui/header.jsp"%>
	<c:choose>
		<c:when test="${empty projects}">
		프로젝트 목록이 없습니다.
	</c:when>

		<c:otherwise>
			<div class="container">
				<c:forEach items="${projects}" var="dto">
					<a href="project.do?command=selectOne&projectId=${dto.projectId}" class="hashtag">
						${dto.projectMainTitle} </a>
					<br />
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>