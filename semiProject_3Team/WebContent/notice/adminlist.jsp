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
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center">------------작성된 글이 존재하지 않습니다.-------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr><td><input type="hidden" value="${dto.noticeseq }"><br/></td></tr>
					<tr>
						<td style="color: #00FFCC; font-size: 12px;">공지</td>
					</tr>
					<tr>
						<td style="font-size: 24pt;"><a href="notice.do?command=select&noticeseq=${dto.noticeseq }">${dto.noticetitle }</a></td>
					</tr>
					<tr>
						<td align="left" style="color: 	#E7A083; font-size: 12px">관리자</td>
						<td align="right" style="color: #B49D94; font-size: 12px">${dto.regdate }</td>
					</tr>
					<tr><td><br/></td></tr>
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="글작성" onclick="location.href='notice.do?command=insertform'" >
				</td>
			</tr>
		</table>
		<table>
			<br/>
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="notice.do?command=list&page=1">다음</a></li>
			</ul>
	</table>
</body>
</html>