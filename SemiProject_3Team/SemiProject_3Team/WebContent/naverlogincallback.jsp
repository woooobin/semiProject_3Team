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
</head>
<!--<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>-->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>


	<script type="text/javascript">
	const woobins = "Q_3L44elkR1gsILyh0Fi";
	const garins= "PFkl_3h_ZxfQM_35xKqR";
		var naver_id_login = new naver_id_login(garins,
				"http://localhost:8787/SemiProject_3Team/naverlogincallback.jsp");
		
		// 접근 토큰 값 출력
		const token = naver_id_login.oauthParams.access_token;
		alert(token);
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			const useremail = naver_id_login.getProfileData('email');
			console.log(useremail , token)
			
			return;
			window.opener.location.href = 'snslogin?command=snslogin&useremail='
					+ useremail+"&token="+token;

			window.close();

			//window.close();
		}
	</script>
	<script type="text/javascript">
		//window.opener.location.href="";    //부모창 reload

		//window.close();    //현재 팝업창 Close
	</script>
</body>
</html>













