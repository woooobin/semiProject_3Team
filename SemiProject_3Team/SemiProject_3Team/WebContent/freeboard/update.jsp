<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- https://m.blog.naver.com/PostView.nhn?blogId=simpolor&logNo=220944466478&proxyReferer=https:%2F%2Fwww.google.com%2F -->
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
        function sendFile(file, editor) {
            //file ->  summernote에 파일 첨부시 여기로 첨부되여
            // 파일 전송을 위한 폼생성
            data = new FormData(); // formdata 라는 (서버로 보내기 전에 파일 전송시 이 객체를 생성해야 함. )
            data.append("uploadFile", file); // formdata에 올라온 파일을 첨부
            $.ajax({ // ajax를 통해 파일 업로드 처리
                data: data,
                type: "POST",
                url: "imageUpload.do", // 서블릿 주소
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
                    $(editor).summernote('editor.insertImage', "image/" + JSON.parse(data).url);
                }
            });
            /// 이 기능이 완료 되면 html 에 출력되용 그게 서버로 날라감~
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                height: 400,
                callbacks: { // 콜백을 사용
                    // 이미지를 업로드할 경우 이벤트를 발생
                    onImageUpload: function (files, editor, welEditable) {
                        console.log(files)
                        sendFile(files[0], this);
                    }
                }
            });
        });
    </script>
</head>

<body>
<%@ include file="../ui/header.jsp" %>
<br/>
	<jsp:useBean id="fbdto" class="com.poosil.free.dto.FreeBoardDto" scope="request"></jsp:useBean>
	<form action="free.do" method="post">
    	<input type="hidden" name="command" value="updateres">
    	<input type="hidden" name="freeboardseq" value='<jsp:getProperty property="freeboardseq" name="dto"/>'/>
    	<table border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<th>제목</th>
				<td><input type="text" name="freeboardtitle" value='<jsp:getProperty property="freeboardtitle" name="dto"/>'/></td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">내용</th>
				<td><textarea rows="30" cols="100" name="freeboardcontent" id="summernote" placeholder="write something"><jsp:getProperty property="noticecontent" name="dto"/></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					 <input type="submit" value="수정" />
					 <input type="button" value="취소" onclick="free.do?command=select&freeboardseq=${dto.freeboardseq}" />
				</td>
			</tr>
       </table> 
    </form>
</body>
</html>