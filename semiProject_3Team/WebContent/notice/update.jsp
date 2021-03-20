<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="com.poosil.notice.noticedto.NoticeDto" scope="request"></jsp:useBean>
	<h1></h1>
	
	<form action="notice.do" method="post">
		<input type="hidden" name="command" value="updateres">
		<table border="1">
			<tr>
				<th>분류</th>
				<td><select name="option" >
					<option value="all">전체</option>
					<option value="notice">공지</option>
					<option value="event">이벤트</option>
				</select></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticetitle" value='<jsp:getProperty property="noticetitle" name="dto"/>'></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="noticecontent" value='<jsp:getProperty property="noticetitle" name="dto"/>'></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="notice.do?command=select&noticeseq=${dto.noticeseq}" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>