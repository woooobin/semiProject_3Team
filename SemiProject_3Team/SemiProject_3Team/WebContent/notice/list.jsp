<%@page import="com.poosil.notice.noticedto.NoticeDto"%>
<%@page import="java.util.List"%>
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
    <title>pagination example</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
</head>
<body>
<h1 align="center">공지사항</h1>
<div>
    <section>
        <div id="data-container"></div>
        <div id="pagination"></div>
    </section>
    <button>글쓰기</button>
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
                    dataHtml += '<div>' + '<span>' + "<a href='notice.do?command=select&noticeseq="+item.noticeseq+ "'>" +item.noticetitle + "</a> " + '</span>' + '<span>' + "관리자"  + '</span>' + '<span>' + item.regdate + '<span>' + '</div>';
                });

                dataHtml += '</ul>';

                $("#data-container").html(dataHtml);
            }
        })
    })
</script>
</body>
</html>