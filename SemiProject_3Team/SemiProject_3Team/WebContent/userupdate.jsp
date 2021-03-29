<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {

		$(".imageInput").on("change", function () {

			data = new FormData();
			data.append("uploadFile", $(this)[0].files[0]);

			const currentInput = $(this);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data: data,
				type: "POST",
				url: "imageUpload.do",
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) { // 처리가 성공할 경우
					// 에디터에 이미지 출력
					console.log("succes =", data)
					const url = "image/" + JSON.parse(data).url;

					/* $(".imageInput").eq(this).val(url) */
					currentInput.next().val(url);
				}
			});
		})
	});

</script>
<% loginDto dto = (loginDto)session.getAttribute("dto"); %>
</head>
<body>
<form action="login.do" method="post">
		<input type="hidden" name="command" value="userupdate" />
		
		<table border="1">
			<tr>
				<th>이름 </th>
				<td><%=dto.getUsername() %> </td>
			</tr>
				<tr>
				<th>닉네임 </th>
				<td><%=dto.getUsernickname() %> </td>
			</tr>
			<tr>
				<th>주소</th>
				<td><div class="d-flex justify-content-end">
					<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
				</div>
				<input type="text" value="<%=dto.getAddress() %>" name="address" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="userphone" value="<%=dto.getUserphone() %>"  /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="useremail" value="<%=dto.getUseremail() %>" /></td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td><!--<input type="text" name="avatar" required="required" onclick="idCheckProc();"  />-->
				<div>
						<input type="file" class="imageInput"  />
						<input type="text" id="thumbnailImage" name="avatar" value="<%=dto.getAvatar() %>" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
					<!-- form 태그에 버튼 태그 왠만해선 쓰지 말기. submit 이벤트 발생하기 때문에. -->
				</td>
			</tr>
		</table>
		<script>
	
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("signup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr) {
		var addressEl = document.querySelector("#address");
		addressEl.value = roadFullAddr;
	}
	function fRecs(f)

	  {
	    f.action = "signup/recaptch.php";
	  }
	</script>	
	</form>
</body>
</html>