<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html;charset=UTF-8");%>    

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/signup.css">
<meta charset="UTF-8">
<title>이메일 중복 체크</title>

<script type="text/javascript">
	onload=function() {
		var useremail = opener.document.getElementsByName("useremail")[0].value;
		document.getElementsByName("email")[0].value=useremail;
	}
	
	function confirmemail(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("useremail")[0].title="y";
			opener.document.getElementsByName("password")[0].focus();
		} else {
			opener.document.getElementsByName("useremail")[0].focus();
		}
		
		self.close();
	}

</script>



</head>
<body style="background-image:url('images/signupavatar/avatar.png');background-size: 100%;">
<%
	String emailnotused = request.getParameter("emailnotused");
%>
	<br/>
	<div align="center" style="font-style: inherit; font-weight:bold;">
		<%=emailnotused.equals("true") ? "사용 가능한 Email" : "중복 된 Email "%>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<div align="center"><input type="button" value="확인"
		onclick="confirmId('<%=emailnotused%>');" />
	</div>

</body>
</html>
