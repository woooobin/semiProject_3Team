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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // 
        $(document).ready(function () {


            // 1. 버튼 바로 뒤에 댓글 입력창이 있을 때
            /**
             * $(".item>button").click(function () {
                    console.log($(".item>button"), $(this))
                    $(this).next().toggleClass("on");
                });
             * 
            */
            // 2. 구조가 약간 복잡할 때

            var item = $(".answer>button").click(function () {
                //현재 클릭한 값의 인덱스
                var idx = item.index(this);

                $(".answertext").eq(idx).toggleClass("on")
            });
        })
    </script>

    <style>
        .item {
            outline: 1px solid;
            cursor: pointer;
        }

        .contentarea {
            display: none;
        }

        .contentarea.on {
            display: block;
        }
    </style>
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
<% String sessionID = (String)session.getAttribute("sessionID"); %>
	<h3 align="center">${dto.freeboardtitle }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
	
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>${dto.userid }&nbsp;&nbsp;&nbsp;조회수 ${dto.readcount }</td>
			<td>${dto.regdate }&nbsp;&nbsp;</td>
		</tr>
		
		<tr>
			<td>
				<textarea rows="10" cols="60" readonly="readonly">${dto.freeboardcontent }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionID == dto.userid}">
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수정" onclick="location.href='free.do?command=updateform&freeboardseq=${dto.freeboardseq}'">
						<input type="button" value="삭제" onclick="location.href='free.do?command=delete&freeboardseq=${dto.freeboardseq}'">
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
	<c:forEach begin="1" end="${cdeo.titletab }">
		&nbsp;
	</c:forEach>
	<table border="1">
		<c:choose>
		<c:when test="${empty clist }">
			<tr>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${clist }" var="cdto">
					<tr align="left">
						<td>
						<input type="hidden" value="${cdto.commentno }">
						<input type="hidden" name="parentcommentno" value="${cdto.commentno }">
						${cdto.userid }  
						</td>
						<td> 작성 날짜 : ${cdto.regdate }</td>
					<c:if test="${sessionID == cdto.userid }">
						<td align="right">
							<input type="button" id="insert" value="수정" onclick="location.href='comment.do?command=update&commentno=${cdto.commentno}">
							<input type="button" value="삭제" onclick="location.href='comment.do?command=delete&commentno=${cdto.commentno}'">
							&nbsp;&nbsp;<br/>
						</td>
					</c:if>
					</tr>
					<c:if test="${sessionID != null}">
						<td class="answer">
							<button onclick="displayShow();">답글하기</button>
						</td>
					</c:if>
					<tbody class="answertext">
					<tr>
						<td>
							<textarea rows="3" cols="60" name="answercontent"></textarea>
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="대댓글 등록" onclick="location.href='comment.do?command='">
							<input type="button" onclick="dispalyNone();">
						</td>
					</tr>
					</tbody>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	
	<table id="contenttable">
		<tr>
			<td><textarea rows="3" cols="60" name="commentcontent">${cdto.commentcontent }</textarea></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="댓글 등록">&nbsp;&nbsp;
			</td>
		</tr>
	</table>
<script type="text/javascript">
function displayShow(){
	$("#answer").style.display = 'block';
	$("#contenttable").style.display = 'none';
}

function displayNone(){
	$("#answer").style.display = 'none';
	$("#contenttable").style.display = 'block';
}

</script>
</body>
</html>