

/*
	전역변수에 summernote 의 아이디값 
	summernoteTagId 

 	summernote에서 이미지 업로드시 실행할 함수 
 
 */
	function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data: data,
			type: "POST",
			url: "imageUpload.do",
			cache: false,
			contentType: false,
			processData: false,
			dataType : "json",
			success: function (data) { // 처리가 성공할 경우
				// 에디터에 이미지 출력
				let image = $('<img>').attr('src', data.url );
				
				$("#summernote").summernote('insertNode', image[0]);
			
			}
		});
	}

$(document).ready(function(){
	$("#summernote").summernote({ 
		// summernote를 사용하기 위한 선언
		height: 400,
		callbacks: { 
			// 콜백을 사용
			// 이미지를 업로드할 경우 이벤트를 발생
			onImageUpload: function (files, editor, welEditable) {
				sendFile(files[0], this);
			}
		}
	});
	
})