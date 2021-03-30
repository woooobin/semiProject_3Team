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
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
<% %>
	<h2>${dto.freeboardtitle }</h2>
	
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>${dto.userid }</td>
			<td>${dto.readcount }</td>
		</tr>
		<tr>
			<td>
				<textarea rows="10" cols="60" readonly="readonly">${dto.freeboardcontent }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.sessionID == dto.userid}">
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수정" onclick="location.href='free.do?command=updateform&noticeseq=${dto.noticeseq}'">
						<input type="button" value="삭제" onclick="location.href='free.do?command=delete&noticeseq=${dto.noticeseq}'">
						<input type="button" value="목록" onclick="location.href='free.do?command=list'">
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="목록" onclick="location.href='free.do?command=list'">
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	
	</table>
	<h4>Comments</h4>
	<c:choose>
	<c:forEach begin="1" end="${cdeo.titletab }">
		&nbsp;
	</c:forEach>
	<table>
		<c:when test="${empty clist }">
			<tr>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${clist }" var="cdto">
					<tr align="left">
						<td>${cdto.userid }  </td>
					<c:if test="${sessionScope.sessionID != null">
						<td><button onclick="recomment();">답글하기</button></td>
					</c:if>
						<td> 작성 날짜 : ${cdto.regdate }</td>
					<c:if test="${sessionScope.sessionID == cdto.userid }">
						<td><button onclick="update();">수정</button><button  onclick="delete();">삭제</button></td>
					</c:if>
					</tr>
					<tr>
						<td><textarea rows="3" cols="60" readonly="readonly">${cdto.commentcontent }</textarea></td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="댓글 등록">&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>
			</c:forEach>
		</c:otherwise>
	</table>
	</c:choose>
<script type="text/javascript">
	
</script>
</body>
</html>