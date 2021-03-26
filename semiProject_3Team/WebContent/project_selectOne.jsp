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
	<h1>select One</h1>
	<c:set var="dto" value="${requestScope.dto}" />
	<%-- <c:set var="projectItems" value="${requestScope.projectItems}" /> --%>


	<a href="chatting.jsp"> chatting </a> projectId = ${dto.projectId}
	projectMainTitle = ${dto.projectMainTitle} projectSubTitle =
	${dto.projectSubTitle } thumbImage =
	<img src="${dto.thumbImage}" width="100" /> goalPrice = ${dto.goalPrice }
	totalPrice = ${dto.totalPrice } soldCount = ${dto.soldCount }
	likeCount= ${dto.likeCount }, ${dto.projectCategory },


	<div class="description"></div>
	projectStartDate = ${dto.projectStartDate }, projectEndDate =
	${dto.projectEndDate }

	<c:choose>
		<c:when test="${empty projectItems}">
			<tr>
				<td colspan="4" align="center">========== no content ==========</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${projectItems}" var="projectItem">
				<p>projectItemName = ${projectItem.projectItemName}</p>
				<p>projectItemSeq = ${projectItem.projectItemSeq}</p>
				<p>projectItemDesc = ${projectItem.projectItemDesc}</p>
				<p>shippingFee = ${projectItem.shippingFee}</p>
				<p>quantity = ${projectItem.quantity}</p>
				<p>thumbImage = ${projectItem.thumbImage}</p>
				<p>${projectItem.projectId}</p>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>