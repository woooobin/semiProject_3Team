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
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	/* summernote에서 이미지 업로드시 실행할 함수 */
	function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data : data,
			type : "POST",
			url : "imageUpload.do",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) { // 처리가 성공할 경우
				// 에디터에 이미지 출력
				console.log("succes =",data)
				$(editor).summernote('editor.insertImage', "image/"+JSON.parse(data).url );
			}
		});
	}
	$(document).ready(function() {
		$('#summernote').summernote({ // summernote를 사용하기 위한 선언
			height : 400,
			callbacks : { // 콜백을 사용
				// 이미지를 업로드할 경우 이벤트를 발생
				onImageUpload : function(files, editor, welEditable) {
					console.log(files)
					sendFile(files[0], this);
				}
			}
		});
	});
</script>
</head>
<body>
<h1>insert form</h1>
	
	<form action="" method="post">
		<label id="title">title</label> <input type="text" name="title"
			placeholder="writer title here" /><br /> <label id="memberId">memberId</label>
		<input type="text" name="memberId" value="1" readonly /> 임시로 멤버 아이디는
		1번을 넣어 놓았다.<br /> <label id="content">content</label>
		<textarea rows="30" cols="100" name="content" id="summernote"
			placeholder="write something"></textarea>
		<br />
		<br /> <input type="submit" value="submit" />
	</form>
</body>
</html>