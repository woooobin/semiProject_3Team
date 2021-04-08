// XMLHttpRequest 객체 생성
function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");	// IE5.0이후
		} catch (e) {

			try {
				return new ActiveXObject("Microsoft.XMLHTTP");	// IE5.0이전
			} catch (e) {
				return null;

			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();	// non IE
	} else {
		return null;
	}

}

// Ajax 요청, 처리작업
var httpRequest = null;
function sendRequest(url,params,callback,method){
	httpRequest = getXMLHttpRequest();
	
	// method 처리
	var httpMethod = method?method:"GET";
	// method가 있으면 그 내용을 담고, null일 경우 GET으로 셋팅
	
	if(httpMethod != "GET" && httpMethod !="POST"){
		httpMethod = "GET";
	}
	
	// params 처리
	var httpParams = (params == null || params == "")?null:params;
	
	//url 처리
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl += "?" + httpParams;
	}
	
	httpRequest.open(httpMethod,httpUrl,true); //POST 방식일 경우
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == "POST"?httpParams:null);
}