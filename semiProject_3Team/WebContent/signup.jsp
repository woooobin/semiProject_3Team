<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://www.google.com/recaptcha/api.js'></script>
<meta charset="UTF-8">
<link href="./styles/reset.css" rel="stylesheet">
  	<!-- Bootstrap CSS -->
    <link href="./styles/bootstrap.min.css" rel="stylesheet" >
<title>Insert title here</title>
<script type="text/javascript">
	
	function idCheckProc() {
		var chk = document.getElementsByName("userid")[0].title;
		if (chk == 'n') {
			alert("id 중복체크를 해주세요!");
			document.getElementsByName("userid")[0].focus();
		}
		
		var seller =document.getElementsByName("isseller")
		if(seller == '구매자'){	
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
				<td><input type="password" name="password" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>구매자&후원자</th>
				<td><select name ="isseller" required="required" onclick="idCheckProc();""> 
				<option value="">선택 </option>
				<option value="Y">구매자</option>
				<option value="N">판매자</option>
				  </select> </td>
				<!-- <td><input type="text" name="isseller" required="required" onclick="idCheckProc();" /></td>-->
			</tr>
			<tr>
				<th>주소</th>
				<td><div class="d-flex justify-content-end">
					<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
				</div>
				<input type="text" name="address" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="userphone" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="useremail" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td><input type="text" name="avatar" required="required" onclick="idCheckProc();" /></td>
			</tr>
			<tr>
				<td>
				<form name="fRec" method="post" onsubmit="return fRecs(this);" autocomplete="off" style='margin:0px;'>
		<input type=hidden id="remoteip" name="remoteip" value="<?=$_SERVER[REMOTE_ADDR]?>" />
		<div class="g-recaptcha" data-sitekey="6LfBSYwaAAAAAKLUkLmLGoubHgGSYvYgAm8iRpuL"></div>
		</form>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="가입" />
					<!-- form 태그에 버튼 태그 왠만해선 쓰지 말기. submit 이벤트 발생하기 때문에. -->
				</td>
			</tr>
		</table>
		<script>
	
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("signup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr) {
		var addressEl = document.querySelector("#address");
		addressEl.value = roadFullAddr;
	}
	function fRecs(f)

	  {
	    f.action = "signup/recaptch.php";
	  }
	</script>	
	</form>
</body>
</html>