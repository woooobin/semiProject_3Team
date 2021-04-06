<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
loginDto logindto = (loginDto) session.getAttribute("dto");
if (logindto != null) {
	String userid = logindto.getUserid();
	pageContext.setAttribute("userid", userid);
}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
	function onclickUpdateComment( index ){
		 console.log(index)
		if($(".updatetext").eq(index).hasClass("on")){
			 $(".updatetext").eq(index).removeClass("on");
		}else{
			 $(".updatetext").eq(index).addClass("on");
		}
			
		const clicked = $(".btn-update").eq(index);
		clicked.html(clicked.html() == '수정' ? '수정 취소' : '수정')
	}
	
	function onClickAnswerComment (index){
		if($(".answertext").eq(index).hasClass("on")){
			 $(".answertext").eq(index).removeClass("on");
		}else{
			 $(".answertext").eq(index).addClass("on");
		}
			
		const clicked = $(".btn-answer").eq(index);
		clicked.html(clicked.html() == '답글달기' ? '답글 달기 취소' : '답글달기')
	}
		 	
</script>

<style>
.item {
	outline: 1px solid;
	cursor: pointer;
}
.answertext {
	display: none;
}
.answertext.on {
	display: block;
}
.updatetext {
	display: none;
}
.updatetext.on {
	display: block;
}
.contenttable {
	display: block;
}
.contenttable.on {
	dispaly: none;
}
</style>
<link href="./styles/reset.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="./styles/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../ui/header.jsp"%>
	<%
	String sessionID = (String) session.getAttribute("sessionID");
	//이렇게 안하고 session.sessionID로 가져올 수 있다.
	%>
	<jsp:useBean id="ucdto" class="com.poosil.comment.dto.CommentDto"
		scope="request"></jsp:useBean>
	<h3 align="center">${dto.freeboardtitle }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>

	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>${dto.userid }&nbsp;&nbsp;&nbsp;조회수${dto.readcount }</td>
			<td>${dto.regdate }&nbsp;&nbsp;</td>
		</tr>

		<tr>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.freeboardcontent }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionID == dto.userid}">
				<tr>
					<td colspan="2" align="right"><input type="button" value="수정"
						onclick="location.href='free.do?command=updateform&freeboardseq=${dto.freeboardseq}'">
						<input type="button" value="삭제"
						onclick="location.href='free.do?command=delete&freeboardseq=${dto.freeboardseq}'">
						<input type="button" value="목록"
						onclick="location.href='free.do?command=list'"></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2" align="right"><input type="button" value="목록"
						onclick="location.href='free.do?command=list'"></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<h4>&nbsp;&nbsp;Comments</h4>


	<c:choose>
		<c:when test="${empty clist }">
			<p>---- 첫 댓글을 남겨주세요 -------</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${clist }" var="cdto" varStatus="status">
				<div>
					<input type="hidden" value="${cdto.commentno }">
					<p>userId = ${cdto.userid }</p>
					<p>작성 날짜 : ${cdto.regdate }</p>

					<c:if test="${userid.equals(cdto.userid)}">
						<div class="buttonwrap">
							<button class="btn-update"
								onclick="onclickUpdateComment(${status.index})">수정</button>
							<input type="button" value="삭제"
								onclick="location.href='free.do?command=cdelete&commentno=${cdto.commentno}&freeboardseq=${dto.freeboardseq}'">
						</div>
					</c:if>

				</div>

				<c:if test="${userid.equals(cdto.userid)}">
					<button class="btn-answer" onclick="onClickAnswerComment(${status.index})">답글하기</button>
				</c:if>
				<div>
					<textarea rows="3" cols="60" readonly="readonly">${cdto.commentcontent }</textarea>
				</div>

				<!-- 댓글 수정 영역 -->
				<div class="updatetext">
					<form action="free.do" method="POST">
						<input type="hidden" name="freeboardseq"
							value="${dto.freeboardseq}" /> 
						<input type="hidden"
							name="command" value="updateanswer"> 
						<input type="hidden"
							name="updatecommentno" value='${cdto.commentno }' /> 
						<input
							type="hidden" name="updateuserid"
							value='<%=logindto != null ? logindto.getUserid() : ""%>' />
						<div>
							<textarea rows="3" cols="60" class="updatecontent"
								name="updatecontent">${cdto.commentcontent }</textarea>
						</div>
						<button type="submit">댓글 수정 완료</button>
					</form>
				</div>
				<!-- 대댓글 영역 -->
				<div class="answertext">
					<form action="free.do" method="POST">
						<input type="hidden" name="freeboardseq"
							value="${dto.freeboardseq}" /> 
						<input type="hidden" name="command" value="insertCommentAnswer"/>
						<input type="hidden" name="parentcommentNo"
							value="${cdto.commentno }"> <input type="hidden"
							name="answeruserid" value="${cdto.userid }">
						<textarea rows="3" cols="100" class="answercontent"></textarea>
						<input type="submit" value="대댓글 등록">
					</form>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td style="border-bottom: 1px solid #CCCCCC;"></td>
	</tr>
	</table>
	<form action="free.do" method="POST">
		<input type="hidden" name="command" value="cinsert">
		<table id="contenttable">
			<c:if test="${sessionID != null}">
				<tr>
					<td><input type="hidden" name="userid" value="${sessionID }">
						<input type="hidden" name="freeboardseq"
						value="${dto.freeboardseq }"> <textarea rows="3"
							cols="100" name="commentcontent"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="댓글 등록">&nbsp;&nbsp;</td>
				</tr>
			</c:if>
			<c:if test="${sessionID == null}">
				<tr>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</c:if>
		</table>
	</form>
</body>
</html>