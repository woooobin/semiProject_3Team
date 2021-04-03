<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>


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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    
<body width="100%" height="100%">
   

  	
    
    
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
     
       <div id="naver_id_login" ></div> 
      <a id="kakao-login-btn" > <img src="kakaologoinimg/kakao_login_small.png"></a>
    </form>
   
    <!-- 네이버 로그인 -->
  <script type="text/javascript">
/*   	var naver_id_login = new naver_id_login("Q_3L44elkR1gsILyh0Fi", "http://localhost:8787/SemiProject_3Team/naverlogincallback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 1,40);
  	naver_id_login.setDomain("http://localhost:8787");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login(); 
 */  </script>	
    
  <script type="text/javascript">	
    Kakao.init("d785007a1b76ece9b8555123982ff2f0");
    
   /* kakao.Auth.authorize({
    	redirectUrl:'http://localhost:8787/SemiProject_3Team/kakaologinform.jsp'
      });
   */
   
   Kakao.Auth.createLoginButton({
	   container:'#kakao-login-btn',
	   success:function(authObj){
	   Kakao.API.request({
		   url:'/v2/user/me',
		   success:function(res){
			   console.log(res);
			   var email = res.kakao_account.email;
			   
			   location.href='snslogin?command=snslogin&useremail'+email;
		   }
	   })
		console.log(authobj);
	var token = authObj.access_token;
	
},
fail: function (err) {
	alert(JASON.stringify(err));
}

});  
    </script>
 
    
  </body>


</html>






























