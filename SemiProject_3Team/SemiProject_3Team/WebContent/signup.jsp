<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
 <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer> </script>
<meta charset="UTF-8">
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	function idCheckProc() {
		var chk = document.getElementsByName("userid")[0].title;
		if (chk == 'n') {
			alert("id 중복체크를 해주세요!");
			document.getElementsByName("userid")[0].focus();
		}
	}
	
	function idCheck() {
		var userid = document.getElementsByName("userid")[0].value;
		
		if (userid == null || userid.trim() == "") {
			alert("id를 입력해 주세요!");
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
	 var onloadCallback = function() {
		  
		    var v = grecaptcha.getResponse();
		    if(v.length == 0)
		    {
		        return false;
		    }
		    if(v.length != 0)
		    {
		        return true;
		    }

		  };
	
</script>



</head>
<body>
<%@ include file="./ui/header.jsp" %>
<div class="container">
<div class="row justify-content-md-center">
  <div class="col-md-auto">
     
    </div>
  </div>
</div>
	<form action="login.do" method="post">
		<input type="hidden" name="command" value="insertuser" />
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userid" required="required" title="n" />
					<input type="button" value="중복체크" onclick="idCheck();" /> 
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
				<input type="password" name="password" id="userPw" placeholder="비밀번호" required="required" onclick="idCheckProc();" />
				<input type="password" id="userPwChk" placeholder="비밀번호 확인" required="required" onclick="idCheckProc();"/>
				<font id="chkNotice" size="2"></font>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="usernickname" required="required" onclick="idCheckProc();" /></td>	
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
				<td><input type="text" name="userphone" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="useremail" required="required" title="e" />
					<input type="button" value="중복체크" onclick="emailCheck();" /> 
				</td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td><!--<input type="text" name="avatar" required="required" onclick="idCheckProc();"  />-->
				<div>
						<input type="file" class="imageInput"  />
						<input type="text" id="thumbnailImage" name="avatar" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="g-recaptcha" data-sitekey="6LfBSYwaAAAAAKLUkLmLGoubHgGSYvYgAm8iRpuL"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit"  value="가입" />
					<!-- form 태그에 버튼 태그 왠만해선 쓰지 말기. submit 이벤트 발생하기 때문에. -->
				</td>
			</tr>
		</table>
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
	        document.getElementById("zipNo").value = zipNo; 
	        document.getElementById("addr").value = roadAddrPart1; 
	        document.getElementById("addr2").value = roadAddrPart2;
	        roadAddrPart1 += roadAddrPart2;
	        if(addrDetail.length>30){ 
	            alert('상세주소가 너무 길어 다시 입력해야 합니다.'); 
	            return; 
	        } 
	        document.getElementById("addrDetail").value = addrDetail; 

	    }
	</script>	
</body>
</html>











