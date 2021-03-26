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
  <link href="./styles/reset.css" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <link href="./styles/bootstrap.min.css" rel="stylesheet">
  <title>Insert title here</title>
</head>
<style>
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image: #34495e;
}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}
</style>

 <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    
<body width="100%" height="100%">
   <script type="text/javascript">	
    Kakao.init("d785007a1b76ece9b8555123982ff2f0");
    
    function kakaoLogin() {
		Kakao.Auth.login({
			scope:'profile,account_email,birthday',
			success: function(authObj) {
				console.log(authObj);
				alert(JSON.stringify(authObj));
			},
			fail: function(authObj){
				alert(JSON.stringify(err));
			}
		});
	}
    
    </script> 	
    
    
    <form action="login.do" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" name="userid" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" name="password" class="pw" placeholder="PW">
      </div>
      <input type="hidden" name="command" value="login" />
      <input type="submit" class="btn" value="login"/>
     
      <div class="bottomText">
        Don't you have ID? <a href="signup.jsp">sign up</a>
      </div>
      <a href="javascript:kakaoLogin();" > <img src="kakaologoinimg/kakao_login_small.png"></a>
    </form>
   
    
    
  </body>


</html>






























