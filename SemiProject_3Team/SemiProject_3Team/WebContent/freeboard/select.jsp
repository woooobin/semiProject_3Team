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

            var item = $(".update>button").click(function () {
                //현재 클릭한 값의 인덱스
                var idx = item.index(this);

                $(".updatetext").eq(idx).toggleClass("on")
                $(".contenttable").toggleClass("on")
                // 인터넷에선 jsp()가아니라 html() 로 적혀있엇음
                if($(this).jsp() == '수정'){
                	$(this).jsp('수정 취소')
                }
            });
        })
        
       $(document).ready(function () {
            var item = $(".answer>button").click(function () {
                //현재 클릭한 값의 인덱스
                var idx = item.index(this);

                $(".answertext").eq(idx).toggleClass("on")
                $(".contenttable").toggleClass("on")
                if($(this).jsp() == '답글하기'){
                	$(this).jsp('답글하기 취소')
                }
            });
        })
        
        $(document).ready(function(){
        	var idxNo = item.index(this);
        	
        })
        
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
        
        .contenttable{
        	display: block;
        }
        
        .contenttable.on{
        	dispaly: none;
        }
        
        
    </style>
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<%@ include file="../ui/header.jsp" %>
<% String sessionID = (String)session.getAttribute("sessionID"); 
//이렇게 안하고 session.sessionID로 가져올 수 있다.%>
<jsp:useBean id="ucdto" class="com.poosil.comment.dto.CommentDto" scope="request"></jsp:useBean>
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
	<h4>&nbsp;&nbsp;Comments</h4>
	<form action="comment.do" method="POST">
	<input type="hidden" name="command" value="updateanswer">
	<table border="1">
		<c:choose>
		<c:when test="${empty clist }">
			<tr>
				<th>---- 첫 댓글을 남겨주세요 -------</th>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${clist }" var="cdto">
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>
					<tr align="left">
						<td>
							<input type="hidden" value="${cdto.commentno }">
							${cdto.userid }  
						</td>
						<td> 작성 날짜 : ${cdto.regdate }</td>
					<c:if test="${sessionID == cdto.userid }">
						<td class="update" align="right">	<!-- onclick="location.href='comment.do?command=update&commentno=${cdto.commentno}'" -->
							<button onclick="location.href='free.do?command=updateanswer&updateno=${cdto.commentno}">수정</button>
							<input type="button" value="삭제" onclick="location.href='comment.do?command=delete&commentno=${cdto.commentno}'">
							&nbsp;&nbsp;<br/>
						</td>
					</c:if>
					</tr>
					<c:if test="${sessionID != null}">
						<td class="answer">
							<button>답글하기</button>
						</td>
					</c:if>
					<tr>
						<td>
							
						</td>
					</tr>
					<tbody class="updatetext">
						<tr>
							<td>
								<input type="hidden" name="updatecommentno" value='<jsp:getProperty property="commentno" name="ucdto"/>'/>
								<input type="hidden" name="updateuserid" value='<jsp:getProperty property="userid" name="ucdto"/>'/>
								<textarea rows="3" cols="60" class="updatecontent"><jsp:getProperty property="commentcontent" name="ucdto"/></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<!-- 여기서 해당 댓글 번호를 어떻게 뽑아야하지?? -->
								<input type="submit" value="수정하기">
							</td>
						</tr>
						<tr>
							<td style="border-bottom: 1px solid #CCCCCC;"></td>
						</tr>
					</tbody>
					
					<tbody class="answertext">
					<tr>
						<td>
							<input type="hidden" name="parentcommentno" value="${cdto.commentno }">
							<input type="hidden" name="answeruserid" value="${cdto.userid }">
							<textarea rows="3" cols="60" class="answercontent"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="대댓글 등록">
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>	
					</tbody>
			</c:forEach>
		</c:otherwise>
		</c:choose>
					<tr>
						<td style="border-bottom: 1px solid #CCCCCC;"></td>
					</tr>
	</table>
	</form>
	<form action="comment.do" method="POST">
	<input type="hidden" name="command" value="insert">
	<table id="contenttable">
		<tr>
			<td>
				<input type="hidden" name="userid" value="${cdto.userid }"> 
				<textarea rows="3" cols="60" name="commentcontent"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="댓글 등록">&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	</form>
</body>
</html>