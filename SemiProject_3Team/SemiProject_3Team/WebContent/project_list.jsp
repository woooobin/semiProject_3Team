<%@page import="com.poosil.pay.dto.PayDto"%>
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
<link href="./styles/project_list.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@ include file="./ui/header.jsp"%>
	
	<div class="container">
	<a href="./project_upload.jsp">upload</a>
		<div class="project_nav row">
			<span class="col"><button class="project_nav_province">전체</button></span>
			<span class="col"><button class="project_nav_province">서울</button></span>
			<span class="col"><button class="project_nav_province">강원</button></span>
			<span class="col"><button class="project_nav_province">충북</button></span>
			<span class="col"><button class="project_nav_province">충남</button></span>
			<span class="col"><button class="project_nav_province">경북</button></span>
			<span class="col"><button class="project_nav_province">경남</button></span>
			<span class="col"><button class="project_nav_province">전북</button></span>
			<span class="col"><button class="project_nav_province">전남</button></span>
			<span class="col"><button class="project_nav_province">제주</button></span>
		</div>
		<c:choose>
			<c:when test="${empty list}">
		프로젝트 목록이 없습니다.
	</c:when>


			<c:otherwise>
				<div class="row row-cols-4 project-list-wrap">
					<c:forEach items="${list}" var="dto">
						<a href="project.do?command=selectOne&projectId=${dto.projectId}">
							<div class="col project_item">
							
								<div class="frame">
									<img src="${dto.thumbImage}" />
									<h2>${dto.projectMainTitle}</h2>
									<div class="graph">
									<span class="graph_val" style="display:inline-block;width:calc(${dto.totalPrice} / ${dto.goalPrice} * 100)%"></span>
									</div>
								</div>
								<p>총 금액 :${dto.totalPrice} </p>
								<p class="percent"></p>
							</div>
						</a>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>