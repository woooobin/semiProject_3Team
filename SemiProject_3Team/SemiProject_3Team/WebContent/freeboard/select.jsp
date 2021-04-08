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
		clicked.html(clicked.html() == '답글달기' ? '답글달기 취소' : '답글달기')
	}
		 	
</script>

<style>
.item {
	outline: 1px solid;
	cursor: pointer;
}
.answertext {
	margin-left : 20px;  
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

.title{
	font-size: 20pt;
}

textarea{
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
.btn-update{
	border: 1px solid yellow;
	background-color: #fff5ba;;
	font: 15px 굴림;
	color: black;
	width:100px;
	height: 30px;
	border-radius: 5px;
}
.btn-answer{
	border: 1px solid yellow;
	background-color: #fff5ba;;
	font: 15px 굴림;
	color: black;
	width:100px;
	height: 30px;
	border-radius: 5px;
}

#contenttable{
	width:100%;
	text-align: center;
	margin-left:-40px;
}

.comments{
	margin-left: -600px;
}

.container{
	margin-left: -600px;
}
</style>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="images/logo/favicon.png" rel="shortcut icon">
<!-- Bootstrap CSS -->
<link href="./styles/bootstrap.min.css" rel="stylesheet">
<title>${dto.freeboardtitle }</title>

</head>
<body>
	<%@ include file="../ui/header.jsp"%>
	<%
	String sessionID = (String) session.getAttribute("sessionID");
	//이렇게 안하고 session.sessionID로 가져올 수 있다.
	%>
	<jsp:useBean id="ucdto" class="com.poosil.comment.dto.CommentDto"
		scope="request"></jsp:useBean>
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td class="title">${dto.freeboardtitle }</td>
		</tr>
		<tr>
			<td>${dto.userid }</td>
			<td align="left">${dto.regdate }</td>
		</tr>

		<tr>
			<td><textarea rows="15" cols="100" readonly="readonly">${dto.freeboardcontent }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionID == dto.userid}">
				<tr>
					<td colspan="2" align="right"><input type="button" class="button" value="수정"
						onclick="location.href='free.do?command=updateform&freeboardseq=${dto.freeboardseq}'">
						<input type="button" class="button" value="삭제"
						onclick="location.href='free.do?command=delete&freeboardseq=${dto.freeboardseq}'">
						<input type="button" class="button" value="목록"
						onclick="location.href='free.do?command=list'"></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2" align="right"><input type="button" class="button" value="목록"
						onclick="location.href='free.do?command=list'"></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<h4 class="comments" align="center">Comments</h4>


	<c:choose>
		<c:when test="${empty clist }">
			<p>---- 첫 댓글을 남겨주세요 -------</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${clist }" var="cdto" varStatus="status">
				<div class="container" align="center">
					<c:forEach begin="1" end="${cdto.titletab }"> 
						<span style="display:inline-block; width:20px;"></span>
					</c:forEach>
				
					<div style="display:inline-block;">
						<input type="hidden" value="${cdto.commentno }">
						<p>${cdto.userid }</p>
						<p>작성 날짜 : ${cdto.regdate }</p>
			
						<c:if test="${userid.equals(cdto.userid)}">
							<div class="buttonwrap">
								<button class="btn-update" 
									onclick="onclickUpdateComment(${status.index})">수정</button>
								<input type="button" class="button" value="삭제"
									onclick="location.href='free.do?command=cdelete&commentno=${cdto.commentno}&freeboardseq=${dto.freeboardseq}'">
							</div>
						</c:if>
	
					</div>
				
				<c:if test="${userid != null}">
					<button class="btn-answer" onclick="onClickAnswerComment(${status.index})">답글달기</button>
				</c:if>
				<div>
					<textarea rows="3" cols="60" readonly="readonly">${cdto.commentcontent }</textarea>
				</div>
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
						<button type="submit" class="button">댓글 수정 완료</button>
					</form>
				</div>
				<!-- 대댓글 영역 -->
				
				<div class="answertext">
					<form action="free.do" method="POST">
						<input type="hidden" name="freeboardseq" value="${dto.freeboardseq}" /> 
						<input type="hidden" name="command" value="updateanswer"/>
						<input type="hidden" name="updatecommentno" value="${cdto.commentno }"/> 
						<input type="hidden" name="updateuserid" value="${sessionID }"/>
						<textarea rows="3" cols="100" name="updatecontent"></textarea>
						<input type="submit" class="button" value="대댓글 등록">
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
					<td align="center"><input type="submit" class="button" value="댓글 등록">&nbsp;&nbsp;</td>
				</tr>
			</c:if>
			
			<c:if test="${sessionID == null}">
				<tr>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</c:if>
		</table>
	</form>
</body>
</html>