<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<style>
footer{
  background-color: #f5f6f7;
  width: 60%;
  margin-left: 20%;
}

footer img{
  width: 120px;
  height: 120px;
  boder-radius: 50%;
  margin-top: -14px;
}

.foo_div{
  float: left;
}

.foo_div1{
  text-align: center;
}
.foo_div1 span{
  font-size: 15px;
  font-weight: bold;
  color: black;
}

.foo_div1 p{
  margin-top: 5px;
  color: black;
}
.foo_div1 img{
  width: 25px;
  height: 25px;
  margin-top: 10px;
}
</style>
<footer>
	<div class="foo_div">
		<img src="images/logo/logo_transparent.png">
	</div>
	<div class="foo_div1">
		<span>㈜ POOSIL</span><span> | </span>
		<span>대표 : 한우빈</span><span> | </span>
		<span>전화 번호 : 010 - 0000 - 0000</span><span> | </span>
		<p>주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩</p>
		<a href="#" target="_blank"><img src="images/sns/facebook.png"></a>
		<a href="#" target="_blank"><img src="images/sns/kakao.png"></a>
		<a href="#" target="_blank"><img src="images/sns/youtube.png"></a>
		<a href="#" target="_blank"><img src="images/sns/insta.png"></a>
		<a href="#" target="_blank"><img src="images/sns/band.png"></a>
		<p>Copyright © 2021 POOSIL. All Rights Reserved.</p>
	</div>
</footer>