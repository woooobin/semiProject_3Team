<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	loginDto logindto = (loginDto)session.getAttribute("dto");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>${dto.noticetitle }</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet"> 
<link href="images/logo/favicon.png" rel="shortcut icon">
<style type="text/css">
	.title{
		font-size:20pt;
		font-weight: bold;
	}
	.writer{
		font-size:12pt;
	}
	
	.content{
		font-size:10pt;
	}
	
	.table{
		text-align: center;
		padding: 10px 15px;
    border-left: none;text-align:center;
    border-right: none;
	}
	
	textarea{
		border: none;
		overflow: scroll;
	}
	
	.button {
	border: 1px solid yellow;
	background-color: #fff5ba;;
	font: 15px 굴림;
	color: black;
	width:100px;
	height: 30px;
	border-radius: 5px;
}	
	
</style>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
	<div class="container">

		<table class="table" border="1"
			style="margin-left: auto; margin-right: auto;">
			<tr>
				<td class="title" align="center">${dto.noticetitle }</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td class="writer">관리자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.regdate }</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td class="content"><textarea rows="30" cols="100"
						readonly="readonly">${dto.noticecontent }</textarea></td>
			</tr>
			<%
			if (logindto != null && logindto.getUserrole().equals("ADMIN")) {
			%>
			<tr>
				<td colspan="2" align="right"><input type="button"
					class="button" value="수정"
					onclick="location.href='notice.do?command=updateform&noticeseq=${dto.noticeseq}'">
					<input type="button" class="button" value="삭제"
					onclick="location.href='notice.do?command=delete&noticeseq=${dto.noticeseq}'">
					<input type="button" class="button" value="목록"
					onclick="location.href='notice.do?command=list'"></td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<td colspan="2" align="right"><input type="button"
					class="button" value="목록"
					onclick="location.href='notice.do?command=list'"></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>