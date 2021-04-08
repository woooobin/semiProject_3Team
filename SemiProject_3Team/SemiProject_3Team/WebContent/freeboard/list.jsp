<%@page import="com.poosil.free.dto.FreeBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/free-list.css" rel="stylesheet">
<link href="images/logo/favicon.png" rel="shortcut icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />
</head>
<% String sessionID = (String)session.getAttribute("sessionID"); %>
<body>
	<%@ include file="/ui/header.jsp"%>
	<h2 align="center">자유 게시판</h2>
	<div class="container">
	<div class="table">
		<div class="heading">
			<span class="cell-1">글번호</span> 
			<span class="cell-2">제 목</span> 
			<span class="cell-3">글쓴이</span> 
			<span class="cell-4">날짜</span>
			<span class="cell-5">조회수</span>
		</div>
		<div>
			<section>
				<div id="data-container"></div><br/>
				<% if(sessionID != null){
				%>
			<div class="button-wrap">
				<button onclick="location.href='free.do?command=insertform'">글쓰기</button>
			</div>
			<%
				} 
			%>
				<div id="pagination"></div>
			</section>
		</div>
	</div>
	</div>


	

	<script>
    $(function () {
        let container = $('#pagination');
        container.pagination({
            dataSource: [
            	<%List<FreeBoardDto> list = (List<FreeBoardDto>) request.getAttribute("list");
for (int i = 0; i < list.size(); i++) {%>{
            		freeboardseq : '<%=list.get(i).getFreeboardseq()%>',
            		freeboardtitle : '<%=list.get(i).getFreeboardtitle()%>',
            		userid : '<%=list.get(i).getUserid()%>',
            		regdate : '<%=list.get(i).getRegdate()%>',
            		readcount : '<%=list.get(i).getReadcount()%>'
            		},
            		<%}%>
            	
            
        	],
            callback: function (data, pagination) {
                var dataHtml = '<div>';

                $.each(data, function (index, item) {
                    dataHtml += "<div class='row'>" + "<span class='cell-1'>" + item.freeboardseq + '</span>' + "<span class='cell-2'>" + "<a href='free.do?command=select&freeboardseq="+item.freeboardseq+ "'>" +item.freeboardtitle + "</a> " + '</span>' + "<span class='cell-3'>" + item.userid + '</span>' + "<span class='cell-4'>" + item.regdate + '</span>' + "<span class='cell-5'>" + item.readcount + '</span>' + '</div>';
                });

                dataHtml += '</div>';

                $("#data-container").html(dataHtml);
            }
        })
    })
</script>
</body>
</html>