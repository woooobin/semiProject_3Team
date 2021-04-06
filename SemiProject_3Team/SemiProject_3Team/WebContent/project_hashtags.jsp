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

</head>
<body>
<c:choose>
	<c:when test="${empty projects}">
		프로젝트 목록이 없습니다.
	</c:when>

	<c:otherwise>
		<div class="row row-cols-4 project-list-wrap">
			<c:forEach items="${projects}" var="dto">
				<a href="project.do?command=selectOne&projectId=${dto.projectId}">
				${dto.projectMainTitle}
				</a><br/>
			</c:forEach>
		</div>
	</c:otherwise>
</c:choose>
</body>
</html>