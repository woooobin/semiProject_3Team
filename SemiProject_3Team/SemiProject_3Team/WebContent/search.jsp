<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Main</title>
<style type="text/css">
.suggest {
	display: none;
	position: absolute;
	left: 11px;
	top: 131px;
}
</style>
<script type="text/javascript" src="<c:url value="./js/httpRequest.js" />"></script>
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
		if (httpRequest.status == 4) {
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
								+ keywordList[i] + "')\">" + keywordList[i]
								+ "</a><br/>";
						// <a href="javascript:select('ajax');">ajax</a><br/>
					}
					var suggestListDiv = document.getElementById("suggestListDiv");
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
		hide();		// 다른 제시어 감춤
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
</head>
<body>
	<div class="s013">
		<form action="projectsearch.do" name="myForm" method="post">
			<input type="hidden" name="command" value="list"> 
			<input type="text" name="keyword" id="keyword" value="${map.keyword}" placeholder="ex: food, service " onkeyup="sendKeyword();" />
			<select data-trigger="" name="searchOption">
				<option value="all"
					<c:out value="${map.searchOption == 'all' ? 'selectd':'' }"/>>전체</option>
				<option value="projectMainTitle"
					<c:out value="${map.searchOption =='projectMainTitle'?'selectd': ''}"/>>제목</option>
				<option value="projectSubTitle"
					<c:out value="${map.searchOption == 'projectSubTitle'?'selectd':'' }"/>>부제목</option>
				<option value="detailDesc"
					<c:out value="${map.searchOption == 'detailDesc'?'selectd':'' }"/>>내용</option>
			</select>
			<button class="btn-search" type="submit">SEARCH</button>
	</form>
	</div>
	<form action="projectsearch.do" method="get">
		<input type="hidden" name="command" value="hashtagSearch"> <input
			type="text" name="hashtag" value="${map.hashtag}"
			placeholder="#으로 구분하세요" />
		<button class="btn-search-2" type="submit">HASHTAG SEARCH</button>
		
		<div id="suggestDiv" class="suggest" >
				<div id="suggestListDiv"></div>
		</div>
		
	</form>

</body>
</html>
