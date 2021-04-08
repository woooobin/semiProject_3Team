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
<%
	String sortOpt = request.getParameter("sortOpt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">

<link href="styles/project_list.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	String [] provinceArr = new String []{"전체","서울","경기","강원","충북","충남","경북","경남","전북","전남","제주" } ;
%>
<script>
	function onChangeOption(){
		const sortOpt = document.getElementById("sortOpt").value;
		location.href="project.do?command=selectList&sortOpt="+sortOpt		
	}
</script>
</head>
<body>
	<%@ include file="../ui/header.jsp"%>

	<div class="container">
		<div class="project_nav">
			<%
			for(String province : provinceArr){
				%>
				<button class="project_nav_province" onclick="location.href='project.do?command=selectList<%=sortOpt != null && sortOpt.length() > 0 ? "&sortOpt="+sortOpt : ""%>&province=<%=province.equals("전체") ? "" : province %>'"><%=province %></button>	
				<%
			}
			%>
		</div>
		<div class="project-list-btn-wrap">
			<select id="sortOpt" onchange="onChangeOption()">
				<option value="likecount" <%= sortOpt != null  && sortOpt.equals("likecount") ? "selected": ""%> >추천순</option>
				<option value="totalprice" <%= sortOpt != null && sortOpt.equals("totalprice") ? "selected": ""%>>팔린 금액 높은 순</option>
			</select>
		<button onclick='location.href="project_upload.jsp"' class="project-upload-btn">프로젝트 업로드 하기</button>
		</div>
		<c:choose>
			<c:when test="${empty list}">
				프로젝트 목록이 없습니다.
			</c:when>

			<c:otherwise>

				<div class="project-list-wrap">
					
					<c:forEach items="${list}" var="dto">
						<div class="project_item">

							<a href="project.do?command=selectOne&projectId=${dto.projectId}">
								<div class="frame">
									<img src="${dto.thumbImage}" />
								</div>
								<h2>${dto.projectMainTitle}</h2>
								<div class="graph">
									<span class="graph_val"	style="display:inline-block;width:calc(${dto.totalPrice} / ${dto.goalPrice} * 100)%"></span>
								</div>
								<p>펀딩 ${dto.totalPrice} 원 달성 !</p>
								
							</a>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>