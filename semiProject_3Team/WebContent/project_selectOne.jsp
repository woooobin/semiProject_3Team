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
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/project_selectOne.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<c:set var="dto" value="${requestScope.dto}" />

<script>
onload = function(){
	document.querySelector(".description").innerHTML = `${dto.detailDesc }`;
}
</script>
</head>
<body>
	<%@ include file="./ui/header.jsp"%>
	<h1>select One</h1>
	<%-- <c:set var="projectItems" value="${requestScope.projectItems}" /> --%>


	projectId = ${dto.projectId}
	<div class="project-detail-header">
		<h2>${dto.projectMainTitle}</h2>
		<h3>${dto.projectSubTitle }</h3>
	</div>
	<div class="layout_wrap project-detail-section ">
		<div class="lft">
			<div class="project-detail-nav">
				<ol>
					<li><a href="#">공지사항</a> <a href="#">응원글보기</a> <a href="#">문의게시판</a>
					</li>
				</ol>
			</div>
			<!-- end nav -->
			<div class="project-detail-hashtags">
				<ol>
					<c:choose>
						<c:when test="${empty projectHashtags}">
							<li>
								<p>등록된 해시태그가 없어요!</p>
							</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${projectHashtags}" var="projectHashtag">
								<a><span>${ projectHashtag.hashtagName } </span></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ol>
			</div>
			<!-- end hashtags -->
			<div class="project-detail-description">
				<div class="description"></div>
			</div>
			<!-- end description -->
		</div>
		<div class="rgt">
			<div class="project-detail-info">
				<p>달성</p>
				<div class="graph"> <span class="graph-inner"></span></div>
				<a href="chatting.jsp"> chatting </a>
			</div>
		</div>
	</div>
	<%-- <img src="${dto.thumbImage}" width="100" /> --%>

	goalPrice = ${dto.goalPrice } totalPrice = ${dto.totalPrice } soldCount
	= ${dto.soldCount } likeCount= ${dto.likeCount }, ${dto.projectCategory },


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