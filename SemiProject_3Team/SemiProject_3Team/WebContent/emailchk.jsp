<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html;charset=UTF-8");%>    
    
<!DOCTYPE html>
<html>
<head>
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
<body>
<%
	String emailnotused = request.getParameter("emailnotused");
%>

	<table border="1">
		<tr>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td><%=emailnotused.equals("true")?"email 생성 가능" : "중복된 email 존재" %></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="confirmemail('<%=emailnotused%>');" /></td>
		</tr>
	</table>

</body>
</html>
