function searchFunction() {
	var username = "username" + encodeURIComponent(document.getElementById("userName").value);

}

function load() {
	var url = "usersearch.do" + searchFunction();

	httpRequest = new XMLHttpRequest();			// server와 통신하는 것을 도와주는 객체
	httpRequest.onreadystatechange = callback;	// 처리할 함수. 레디스테이트 변경하는 이벤트가 발생할때마다 callback(필요할때만 요청하고, 요청하면 응답함. 바로 사용X) 함수 호출할꺼야
	httpRequest.open("GET", url, true);			// 연결할 준비. GET 방식으로 url + 쿼리스트링. 붙여서 오픈. true : 비동기, false : 동기
	httpRequest.send();
}


function searchProcess() {
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";

	if (request.readyState == 4 && request.status == 200) {
		var object = eval('(' + request.responseText + ')');
		var result = object.result;

		for (var i = 0; i < result.length; i++) {
			var row = table.insertRow(0);
			for (var j = 0; j < result[i].length; j++) {
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
		}
	}
}