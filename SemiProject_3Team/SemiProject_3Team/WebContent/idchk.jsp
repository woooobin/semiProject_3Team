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
<link rel="stylesheet" href="css/signup.css">
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<script type="text/javascript">
	onload = function() {
		var userid = opener.document.getElementsByName("userid")[0].value;
		document.getElementsByName("id")[0].value = userid;
	}

	function confirmId(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("userid")[0].title = "y";
			opener.document.getElementsByName("password")[0].focus();
		} else {
			opener.document.getElementsByName("userid")[0].focus();
		}

		self.close();
	}
</script>



</head>
<body
	style="background-image: url('images/signupavatar/avatar.png'); background-size: 100%">
	<%
		String idnotused = request.getParameter("idnotused");
	%>
	<br/>
	<div align="center" style="font-style: inherit; font-weight:bold;">
		<%=idnotused.equals("true") ? "사용 가능한 ID" : "중복 된 ID "%>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<div align="center"><input type="button" value="확인"
		onclick="confirmId('<%=idnotused%>');" />
	</div>
</body>
</html>
















