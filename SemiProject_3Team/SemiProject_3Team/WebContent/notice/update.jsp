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
    <title>공지 수정하기</title>
    <link href="styles/reset.css" rel="stylesheet">
	<link href="styles/layout.css" rel="stylesheet">
	<link href="images/logo/favicon.png" rel="shortcut icon">
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
    <style type="text/css">
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
<br/>
	<jsp:useBean id="ntdto" class="com.poosil.notice.noticedto.NoticeDto" scope="request"></jsp:useBean>
	<form action="notice.do" method="post">
    	<input type="hidden" name="command" value="updateres">
    	<input type="hidden" name="noticeseq" value='<jsp:getProperty property="noticeseq" name="ntdto"/>'/>
    	<table border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td><input type="text" name="noticetitle" value='<jsp:getProperty property="noticetitle" name="ntdto"/>'/></td>
			</tr>
			<tr>
				<td><textarea rows="30" cols="100" name="noticecontent" id="summernote" placeholder="write something"><jsp:getProperty property="noticecontent" name="ntdto"/></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					 <input type="submit" class="button" value="수정" />
					 <input type="button" class="button" value="취소" onclick="notice.do?command=select&noticeseq=${ntdto.noticeseq}" />
				</td>
			</tr>
       </table> 
    </form>
    <%@ include file="/ui/footer.jsp"%>
</body>
</html>