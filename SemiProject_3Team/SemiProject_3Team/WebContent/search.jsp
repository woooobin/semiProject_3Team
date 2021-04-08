<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&display=swap"
	rel="stylesheet">
<link href="./styles/search.css" rel="stylesheet" media="all">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function sendKeyword() {

		var keyword = document.myForm.keyword.value;

		if (keyword == "") {
			hide(); // 검색창이 비워져 있으면 숨김.
			return;
		}
		var params = "keyword=" + keyword;
		sendRequest("search_suggestClient.jsp", params, displaySuggest, "POST");

	}

	function displaySuggest() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) { // 서버 응답 정상
				var resultText = httpRequest.responseText; // response로 넘어온 텍스트 할당
				// alert(resultText);
				// 5|abc,ajax,adf
				var resultArray = resultText.split("|"); // {5, {abc,ajax,adf}}로 나눔
				var count = parseInt(resultArray[0]); // 5
				var keywordList = null;

				if (count > 0) {
					keywordList = resultArray[1].split(",");
					var html = "";
					for (var i = 0; i < keywordList.length; i++) {
						html += "<a href=\"javascript.select('"
								+ keywordList[i] + "');\">" + keywordList[i]
								+ "</a><br/>";
						// <a href="javascript:select('ajax');">ajax</a><br/>
					}
					var suggestListDiv = document
							.getElementById("suggestListDiv");
					suggestListDiv.innerHTML = html;
					show();
				} else {
					// count == 0
					hide();
				}
			} else {
				// status != 200
				hide();
			}
		} else {
			// readyState != 4
			hide();
		}
	} // function..end

	// 사용자가 제시어 중에서 클릭한 키워드
	function select(selectKeyword) {
		// 클릭한 제시어를 inputbox에 넣어줌
		document.myForm.keyword.value = selectKeyword;
		hide(); // 다른 제시어 감춤
	}

	function show() {
		var suggestDiv = document.getElementById("suggestDiv");
		suggestDiv.style.display = "block";
	}

	function hide() {
		var suggestDiv = document.getElementById("suggestDiv");
		suggestDiv.style.display = "none";
	}

	// 처음 DOM이 로드되었을 때 보이지 않도록
	window.onload = function() {
		hide();
	}
</script>

<title>Search Main</title>
<style type="text/css">
.suggest {
	display: none;
	position: absolute;
	left: 11px;
	top: 131px;
}

body {
	padding: 0px;
	margin: 0px;
	font-weight: 400;
	font-size: 20px;
}

html {
	margin: 0;
	background-size: cover;
	background: url("./images/background/1.jpg") no-repeat center center
		fixed;
	background-blend-mode: darken;
	transition: 3s;
}

.btn-submit {
	display: inline-block;
	line-height: 80px;
	font-family: inherit;
	background: #ffe151;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	text-transform: capitalize;
	color: #333;
	font-size: 18px;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
	padding: 0 30px;
	-webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
	box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
}

.btn-submit:hover {
	background: #ebcd3d;
}

div.searchEngine {
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
}

h1 {
	color: #ffe151;
	font-size: 47px;
	font-family: 'Nanum Myeongjo', serif;
	text-align: center;
	text-shadow: #533d4a 1px 1px, #533d4a 2px 2px, #533d4a 3px 3px, #533d4a
		4px 4px;
}

.logo {
	justify-content: center;
	align-items: center;
	width: 130px;
	height: 94px;
}
}
</style>
<script type="text/javascript"
	src="<c:url value="./js/httpRequest.js" />"></script>
<script>
	var bgImageArray = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg" ], base = "./images/background/", secs = 4;
	bgImageArray.forEach(function(img) {
		new Image().src = base + img;
		// caches images, avoiding white flash between background replacements
	});

	function backgroundSequence() {
		window.clearTimeout();
		var k = 0;
		for (i = 0; i < bgImageArray.length; i++) {
			setTimeout(function() {
				document.documentElement.style.background = "url(" + base
						+ bgImageArray[k] + ") no-repeat center center fixed";
				document.documentElement.style.backgroundSize = "cover";
				if ((k + 1) === bgImageArray.length) {
					setTimeout(function() {
						backgroundSequence()
					}, (secs * 1000))
				} else {
					k++;
				}
			}, (secs * 1000) * i)
		}
	}

	backgroundSequence();
</script>

</head>
<body>
	<a href="index.jsp"><img
		src="./images/logo/logo_transparent_notypo.png" class="logo"></a>

	<div class="searchEngine">
		<form action="projectsearch.do" class="form" name="myForm"
			method="post">

			<h1>프로젝트를 빠르게 찾아보세요!</h1>


			<div class="input-group input--large">
				<label class="label">WHAT</label> <input type="hidden"
					name="command" value="list"> <input class="input--style-1"
					type="text" name="keyword" id="keyword" value="${map.keyword}"
					placeholder="검색어를 입력해주세요! " onkeyup="sendKeyword();" />
			</div>



			<div class="input-group input--medium">
				<label class="label">CATEGORY</label>
				<div class="input--style-1">
					<select name="searchOption"
						style="border: none; border-radius: 0px;">
						<option value="all"
							<c:out value="${map.searchOption == 'all' ? 'selectd':'' }"/>>전체</option>
						<option value="projectMainTitle"
							<c:out value="${map.searchOption == 'projectMainTitle'?'selectd': ''}"/>>프로젝트
							명</option>
						<option value="projectSubTitle"
							<c:out value="${map.searchOption == 'projectSubTitle'?'selectd':'' }"/>>프로젝트
							서브명</option>
						<option value="detailDesc"
							<c:out value="${map.searchOption == 'detailDesc'?'selectd':'' }"/>>프로젝트
							내용</option>
					</select>
				</div>
			</div>
			<button class="btn-submit" type="submit">SEARCH</button>
		</form>
	</div>

	<div id="suggestDiv" class="suggest">
		<div id="suggestListDiv"></div>
	</div>
</body>
</html>
