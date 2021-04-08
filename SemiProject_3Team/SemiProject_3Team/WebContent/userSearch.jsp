<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	var request = new XMLHttpRequest();
	 function searchFunction() {
		request.open("post",
				"./usersearch.do?username="
						+ encodeURIComponent(document
								.getElementById("username").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess() {
		var table = document.getElementById("userInfo");
		table.innerHTML = "";
		if (request.readyState == 4 && request.status == 200) {
			console.log(request.responseText);
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
				//end for
			}
			//end for
		}
		// end if
	}
	//
</script>
</head>
<body>

	<br />
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-cotrol" id="username" onkeyup="searchFunction()"
					type="text" size="20" placeholder="회원 이름을 입력해주세요!">
			</div>
			
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();"
					type="button">검색</button>
			</div>
			
			
			<table border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>유저등급</th>
						<th>위도</th>
						<th>경도</th>
						<th>옵션</th>
						<th>닉네임</th>
						<th>프로필사진</th>
						<th>탈퇴여부</th>
					</tr>
				</thead>
				<tbody id="userInfo">
					
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>