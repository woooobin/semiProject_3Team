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

<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/free-select.css" rel="stylesheet">
<link href="images/logo/favicon.png" rel="shortcut icon">
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
   <h2 align="center">${dto.freeboardtitle }</h2>
   <div class="container">
      <div class="table">
         <div class="table-header">
            <span class="userid">${dto.userid}</span><span
               class="readcount">조회수 : ${dto.readcount }</span> <span
               class="regdate">${dto.regdate }&nbsp;</span>
         </div>
         <div class="table-section">
            <textarea rows="10" cols="60" readonly="readonly">${dto.freeboardcontent }</textarea>
         </div>
      </div>
      <!--  -->
      <div class="comment-section">
         <c:choose>
            <c:when test="${sessionID == dto.userid}">
               <div>
                  <input type="button" value="수정" class="button"
                     onclick="location.href='free.do?command=updateform&freeboardseq=${dto.freeboardseq}'">
                  <input type="button" value="삭제" class="button"
                     onclick="location.href='free.do?command=delete&freeboardseq=${dto.freeboardseq}'">
                  <input type="button" value="목록" class="button"
                     onclick="location.href='free.do?command=list'">
               </div>
            </c:when>
            <c:otherwise>
               <div class="btn-wrap">
                  <input type="button" class="view-list-btn" value="목록"
                     onclick="location.href='free.do?command=list'">
               </div>
            </c:otherwise>
         </c:choose>

         <h4>Comments</h4>
         <div class="comment-wrap">
            <c:choose>
               <c:when test="${empty clist }">
                  <p>---- 첫 댓글을 남겨주세요 -------</p>
               </c:when>
               <c:otherwise>
                  <c:forEach items="${clist }" var="cdto" varStatus="status">
                     <c:forEach begin="2" end="${cdto.titletab }">
                           &nbsp;&nbsp;&nbsp;
                     </c:forEach>
                     <div class="row">
                        <p>
                        <input type="hidden" value="${cdto.commentno }">
                           <textarea rows="3" cols="120">${cdto.commentcontent }</textarea>
                            
                        </p>
                            <div class="comment-util">
                               <span class="userid"> ${cdto.userid } &nbsp;&nbsp;&nbsp;</span>
                               <span class="regdate"> ${cdto.regdate }&nbsp;&nbsp;&nbsp;</span>
                              <c:if test="${userid.equals(cdto.userid)}">
                                 <button class="btn-update" onclick="onclickUpdateComment(${status.index})">수정</button>
                                 <button class="button" onclick="location.href='free.do?command=cdelete&commentno=${cdto.commentno}&freeboardseq=${dto.freeboardseq}'">삭제</button>
                              </c:if>
                              <c:if test="${userid != null}">
                                 <button class="btn-answer" onclick="onClickAnswerComment(${status.index})">답글달기</button>
                              </c:if>
                            </div>
                        
                     </div>
                     <!-- 댓글 수정 영역 -->
                     <div class="updatetext">
                        <form action="free.do" method="POST">

                           <input type="hidden" name="freeboardseq"
                              value="${dto.freeboardseq}" /> <input type="hidden"
                              name="command" value="updateanswer"> <input
                              type="hidden" name="updatecommentno"
                              value='${cdto.commentno }' /> <input type="hidden"
                              name="updateuserid"
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
                           <input type="hidden" name="freeboardseq"
                              value="${dto.freeboardseq}" /> 
                              <input type="hidden" name="command" value="insertanswer" /> 
                              <input type="hidden" name="updatecommentno" value="${cdto.commentno }" /> 
                              <input type="hidden" name="updateuserid" value="${sessionID }" />
                           <textarea rows="3" cols="100" name="updatecontent"></textarea>
                           <input type="submit" class="button" value="대댓글 등록">
                        </form>
                     </div>
                     <br/>

                  </c:forEach>
               </c:otherwise>
            </c:choose>
         </div>
         <h4>댓글 달기</h4>
         <form action="free.do" method="POST">
            <input type="hidden" name="command" value="cinsert">
            <div class="write-form clearfix" id="contenttable">
               <c:if test="${sessionID != null}">
                  <input type="hidden" name="userid" value="${sessionID }">
                  <input type="hidden" name="freeboardseq" value="${dto.freeboardseq }"> 
                  <textarea rows="3"   cols="100" name="commentcontent"></textarea>
                  <input type="submit" class="button" value="댓글 등록">
                  <br/>
               </c:if>
            </div>
         </form>
      </div>
   </div>
<%@ include file="/ui/footer.jsp"%>
</body>
</html>