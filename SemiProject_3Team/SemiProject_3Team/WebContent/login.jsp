<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/login.css" rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--  <link href="./styles/reset.css" rel="stylesheet"> -->
<link href="./css/logincss.css" rel="stylesheet">
<!-- Google Login Js -->
<!-- <meta name="google-signin-client_id"
	content="159305129792-j29t7eunifcfaltvs3pa1o7nrir400vt.apps.googleusercontent.com"> -->
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<script src="https://apis.google.com/js/client:platform.js?onload=init" async defer></script>
<link href="styles/project_list.css" rel="stylesheet">
<%@ include file="../ui/header.jsp"%>
<script>
	function onSubmit(e){
		console.log("rere")
		e.preventDefault();
	}
</script>
<title>poosilLogin</title>

</head>


<body>

	<form action="login.do" method="post" class="loginForm">
		<div class="idForm">
			<input type="text" class="id" name="userid" placeholder="아이디" >
		</div>
		<div class="passForm">
			<input type="password" name="password" class="pw" placeholder="비밀번호" >
		</div>
		
		<input type="hidden" name="command" value="login" /> 
		<input type="submit" class="btn" value="로그인" />
	
		<div class="bottomText">
		</div><br/><br/>
		<br/>
		<div>
			<a><img src="images/snslogo/naver.png" style="width:80px; " id="naver_id_login" ></a>
			<a><img src="images/snslogo/kakao.png" style="width:80px; "  id="kakao-login-btn"></a>
			<a><img src="images/snslogo/google.png" style="width:80px; " id="glogin"></a>
		</div>
		</form>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		
	<!-- 네이버 로그인 -->
	<script type="text/javascript">
		const woobins = "LQ9oq3XCCiY1n374Y0ED";
		const garins = "PFkl_3h_ZxfQM_35xKqR";
		var naver_id_login = new naver_id_login(woobins,
				"http://localhost:8787/SemiProject_3Team/naverlogincallback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 1, 40);
		naver_id_login.setDomain("http://localhost:8787");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

	<script type="text/javascript">
		// ======== kakao login ======== //
		Kakao.init("d785007a1b76ece9b8555123982ff2f0");

		/* kakao.Auth.authorize({
		 	redirectUrl:'http://localhost:8787/SemiProject_3Team/kakaologinform.jsp'
		   });
		 */
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				var token = authObj.access_token;
				/* kakao  */
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						/* console.log("res = ",res); */
						var email = res.kakao_account.email;

						location.href = 'snslogin?command=snslogin&useremail='
								+ email;
					}
				})

			},
			fail : function(err) {
				alert(JASON.stringify(err));
			}

		});
		 
		 
		 // ======== google login ======== // 
		 function init() {
		        gapi.load('auth2', function() {
		            auth2 = gapi.auth2.init({
		                client_id: '159305129792-j29t7eunifcfaltvs3pa1o7nrir400vt.apps.googleusercontent.com',
		                cookiepolicy: 'single_host_origin',
		                scope: 'profile email'
		            });
		            element = document.getElementById('glogin');
		            auth2.attachClickHandler(element, {}, onSignUp, onFailure);
		        });
		    }
		    function onSignUp(googleUser) {
		      var profile = googleUser.getBasicProfile();
		      const email = profile.getEmail();
		      location.href = 'snslogin?command=snslogin&useremail=' + email;
		    }
		    function onFailure(err){
		    	console.log(err)
		    	return;
		    }
	</script>


</body>


</html>






























