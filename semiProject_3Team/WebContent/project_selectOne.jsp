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
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/bootstrap.min.css" rel="stylesheet">
<link href="./styles/project_selectOne.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$(".description").html(${dto.detailDesc });
})
</script>
</head>
<body>
<%@ include file="./ui/header.jsp"%>
<h1> select One</h1>
<c:set var="dto" value="${requestScope.dto}"/>

<a href="chatting.jsp"> chatting </a>
projectId = ${dto.projectId}
projectMainTitle = ${dto.projectMainTitle}
projectSubTitle = ${dto.projectSubTitle }
thumbImage = <img src="${dto.thumbImage}" width="100"/>

		goalPrice = ${dto.goalPrice }
		totalPrice = ${dto.totalPrice }
		soldCount = ${dto.soldCount }
		likeCount= ${dto.likeCount },
		${dto.projectCategory },
		
		
		<div class="description"></div>
		projectStartDate  = ${dto.projectStartDate },
	projectEndDate = 	${dto.projectEndDate }
		

</body>
</html>