<%@page import="com.poosil.login.dto.loginDto"%>
<%@page import="com.poosil.notice.noticedto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	loginDto logindto = (loginDto)session.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>푸실 공지사항</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/notice-list.css" rel="stylesheet">
<link href="images/logo/favicon.png" rel="shortcut icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
</head>
<body>
<%@ include file="/ui/header.jsp"%>
<h2 align="center">공지사항</h2>
<div class="container">
<div class="table">
	<div>
		<div class='line'></div>
	    <section>
	        <div id="data-container"></div>
	          <% if(logindto != null && logindto.getUserrole().equals("ADMIN")){
					%>
		<div align="right">
		<br/>
	    <input type="button" class="button" value="글작성" onclick="location.href='notice.do?command=insertform'"  >
	    </div>
	    <%	} %>
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
            	<%
            	List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("list"); 
            	for(int i = 0 ; i < list.size(); i++){
            		%>{
            		noticeseq : '<%=list.get(i).getNoticeseq()%>',
            		noticetitle : '<%=list.get(i).getNoticetitle()%>',
            		userid : '<%=list.get(i).getUserid()%>',
            		regdate : '<%=list.get(i).getRegdate()%>'
            		},
            		<%
            	}
            	%>
            	
            
        	],
            callback: function (data, pagination) {
                var dataHtml = '<ul>';

                $.each(data, function (index, item) {
                    dataHtml += '<div>' +'<div><br/></div>' + "<div class='notice'>" + "&nbsp;&nbsp;&nbsp;공지" + '</div>' +'<div><br/></div>'  + "<div class='title'>" + "<a href='notice.do?command=select&noticeseq="+item.noticeseq+ "'>" +item.noticetitle + "</a> " + '</div>' +'<div><br/></div>'  + '<div>' + "<span class='role'>" + "&nbsp;&nbsp;관리자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + '</span>' + "<span class='date'>" + item.regdate + '</span>' + '</div>' +'<div><br/></div>' + "<div class='line'>" + '</div>'  + '</div>';
                });

                dataHtml += '</ul>';

                $("#data-container").html(dataHtml);
            }
        })
    })
</script>
</body>
</html>