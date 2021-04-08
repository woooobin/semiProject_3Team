<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String userEmail = (String)request.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
 <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer> </script>
<meta charset="UTF-8">
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/login.css" rel="stylesheet">
<link href="styles/project_list.css" rel="stylesheet">
 <link rel="stylesheet" href="css/signup.css">
    
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("Q_3L44elkR1gsILyh0Fi",
			"http://localhost:8787/SemiProject_3Team/naverlogincallback.jsp");
	naver_id_login.get_naver_userprofile("naveremail()");
	function naveremail() {
		naver_id_login.getProfileData('email')
	}
</script>
<script type="text/javascript">
	
	function idCheckProc() {
		var chk = document.getElementsByName("userid")[0].title;
		if (chk == 'n') {
			alert("ID중복체크 먼저 하십시오.");
			document.getElementsByName("userid")[0].focus();
		}
	}
	
	function idCheck() {
		var userid = document.getElementsByName("userid")[0].value;
		
		if (userid == null || userid.trim() == "") {
			alert("ID를 입력해 주세요.");
		} else {
			open("login.do?command=idchk&userid="+userid, "", "width=200, height=200");
		}
	}
	function emailCheck() {
		var useremail = document.getElementsByName("useremail")[0].value;
		
		if (useremail == null || useremail.trim() == "") {
			alert("이메일를 입력해 주세요!");
		} else {
			open("login.do?command=emailchk&useremail="+useremail, "", "width=200, height=200");
		}
	}
	
	
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
	
	$(function(){
	    $('#userPw').keyup(function(){
	      $('#chkNotice').html('');
	    });

	    $('#userPwChk').keyup(function(){

	        if($('#userPw').val() != $('#userPwChk').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함<br><br>');
	          $('#chkNotice').attr('color', '#199894b3');
	        }

	    });
	});
	
</script>
</head>
<body>

   <!-- header -->
        <div id="header">
        <h1>SNS&nbsp;회원가입</h1>
        </div>

	<form action="sns.do" method="post">
		<input type="hidden" name="command" value="insertuser" />
		<!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                        <input type="button" value="check" class="idchk" onclick="idCheck();" /> 
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="userid" name="userid" class="int"required="required" maxlength="20" title="n" />
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="userPw" name="password" class="int" maxlength="20" onclick="idCheckProc();" />
                        <span id="alertTxt">사용불가</span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label>&nbsp;&nbsp;<font id="chkNotice" size="2"></font></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="userPwChk" class="int" maxlength="20" onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="username" name="username" class="int" maxlength="20"onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                 <!-- NICKNAME -->
                <div>
                    <h3 class="join_title"><label for="nickname">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="nickname" name="usernickname" class="int" maxlength="20"onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="useremail">이메일 &nbsp;<input type="button" value="check" class="idchk" onclick="emailCheck();" /> <span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="text"value='<%=userEmail %>'id="naveremail();"  name="useremail" class="int" maxlength="100" title="e" onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="userphone" name="userphone" class="int" maxlength="16" onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                  <!-- ADDRESS -->
                <div>
                    <h3 class="join_title"><label for="address">주소</label> &nbsp;<button type="button" class="btnjuso" onClick="goPopup();">검색</button></h3>
                    <span class="box int_name">
                    <input  type="text"  name="address" id="address" class="int"   required readonly onclick="idCheckProc();"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>
        
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>join</span>
                    </button>
                </div>

                

            </div> 
            <!-- content-->

        </div> 
        </form>
        <!-- wrapper -->
    <script src="main.js"></script>
    <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/>   <br/><br/><br/><br/><br/><br/><br/>   <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

 <div class="container">
<div class="row justify-content-md-center">
  <div class="col-md-auto">
     
    </div>
  </div>
</div>



		<!--<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userid" required="required"
					title="n" /> <input type="button" value="중복체크"
					onclick="idCheck();" /></td>
			</tr>
			<td>
				<input type="password" name="password" id="userPw" placeholder="비밀번호" required="required" onclick="idCheckProc();" />
				<input type="password" id="userPwChk" placeholder="비밀번호 확인" required="required" onclick="idCheckProc();"/>
				<font id="chkNotice" size="2"></font>
				</td>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username" required="required"
					onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="usernickname" required="required"
					onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
                </div>
                <input type="hidden" name="address" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
                <input type="text" name="zipNo" id="zipNo" class="form-control" placeholder="우편 번호" required readonly><br/>
                <input style="width: 300px;" type="text" name="addr" id="addr" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
                <input  type="text" name="addr2" id="addr2" class="form-control" placeholder="참고 주소" required readonly /><br/>
                <input type="text" name="addrDetail" id="addrDetail" class="form-control" placeholder="나머지 주소를 입력해 주세요"/>
				<td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="userphone" required="required"
					onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="useremail" required="required" value=
					id="naveremail();" /></td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td>
					<!--<input type="text" name="avatar" required="required" onclick="idCheckProc();"  />-->
					<!--<div>
						<input type="file" class="imageInput" /> <input type="text"
							id="thumbnailImage" name="avatar" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="가입" />
					<!-- form 태그에 버튼 태그 왠만해선 쓰지 말기. submit 이벤트 발생하기 때문에. --></td>
			<!-- </tr>
		</table>-->
	</form>
	<script>
	
	
	function goPopup() {
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("signup/jusoPopup.jsp", "pop",
                "width=570,height=420, scrollbars=yes, resizable=yes");
    }
    var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){ 
        document.getElementById("address").value = roadFullAddr; 
      
    }
	</script>	
</body>
</html>