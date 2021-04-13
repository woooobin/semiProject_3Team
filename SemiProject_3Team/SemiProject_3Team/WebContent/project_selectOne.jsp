<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 카카오톡 공유시 썸네일에 보일 값들 -->
<meta property="og:type" content="website"> 
<meta property="og:title" content="${projectDto.projectMainTitle}">
<meta property="og:description" content="${projectDto.projectSubTitle }">
<meta property="og:image" content="images/logo/logo_transparent_notypo.png">
<meta property="og:url" content="http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId}>

<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/project_selectOne.css" rel="stylesheet">
<link href="styles/all.css" rel="stylesheet"> <!-- font awesome -->

<c:set var="projectDto" value="${requestScope.projectDto}" />

<style type="text/css">
#map {
   height: 240px;width:240px;
}
</style>

<%boolean isLiked = (boolean)request.getAttribute("isLiked"); %>
<script>
var mobileWebUrl = "http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId};
var webUrl = "http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId};

//하단 구글맵 사용시 위도 경도 값
var googlemap_lat = ${ projectDto.longitude } ;
var googlemap_lng = ${ projectDto.latitude } ;

</script>  
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="js/kakaoLinkShare.js"></script>
<script src="js/project-googlemap.js"></script>

</head>
<body>
	<%@ include file="ui/header.jsp"%>
	
	<script>
		onload = function() {
			document.querySelector(".description").innerHTML = `${projectDto.detailDesc }`;
		}
		
		let isLikeClicked = false;
		
		function handleLike(){
			if(!isLikeClicked){
				<%
				if(isLoggedIn){
					%>
					location.href="project.do?command=projectToggleLike&projectId="+${projectDto.projectId}+"&isLiked="+<%=isLiked%>
					<%
				}else{
					%>
					alert("로그인 한 유저만 좋아요 할 수 있습니다. ")
					<%
				}
				%>
			}
		}
	
	    
		
	</script>
	
	<div class="project-detail-header">
		<h2>${projectDto.projectMainTitle}</h2>
		<h3>${projectDto.projectSubTitle }</h3>
		<img src="${projectDto.thumbImage }"/>
	</div>
	<div class="layout_wrap project-detail-section ">
		<div class="lft">
			<div class="wrapper">
			
				<div class="project-detail-hashtags">
					<c:choose>
						<c:when test="${empty projectHashtags}">
							<p>등록된 해시태그가 없어요!</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${projectHashtags}" var="projectHashtag">
								<a href="project.do?command=selectWHashtag&hashtagSeq=${ projectHashtag.hashtagSeq }">${ projectHashtag.hashtagName }</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- end hashtags -->
				<div class="project-detail-description">
					<div class="description"></div>
				</div>
			</div>

		</div>
		<div class="rgt">
			<div class="wrapper">
			
				<div class="project-detail-info">
					<div class="graph">
						<span class="graph-inner"
							style="display:block;width : calc( (${projectDto.goalPrice } / ${projectDto.totalPrice } ) * 100 ) %; background-color : #777;"></span>
					</div>
					<div id="map"></div>
					<p>${projectDto.address }</p>
					<!-- <h3>남은 후원일<span></span></h3> -->
					<h3>펀딩액<span>${projectDto.totalPrice }</span>원 달성!</h3>
					<h3>발송 시작일 <span>${projectDto.shippingStartDate}</span></h3>
					

					<div class="project-detail-sub-nav">
						<button class="btn" onclick="handleLike()">
<%
							if(isLiked) {
								%>
							<i class="fas fa-heart"></i>
								<%
							}else{
								%>
							<i class="far fa-heart"></i>
								<%
							}
%>

							<span class="likeCount">${projectDto.likeCount }</span>
						</button>
						
						<a id="kakao-link-btn" href="javascript:sendLink()">
							<i class="fas fa-share-alt"></i>
						</a>
					</div>
				</div>
				<!-- end detail info -->
				<div class="project-items-wrap">
					<ul class="project-items-list">
						<c:choose>
							<c:when test="${empty projectItems}">
								<p>에러</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${projectItems}" var="projectItem">
									<li class="project-items-item">
									<% 
									if(isLoggedIn) {	
									%>										
										<a href="pay.do?command=orderpage&userid=<%=dto.getUserid() %>&projectItemSeq=${ projectItem.projectItemSeq}&projectId=${projectDto.projectId}">
										
											<div class="frame">
												<p>${projectItem.price}원 응원하기 </p>
												<h4>${projectItem.projectItemName}</h4>
												<p>${projectItem.projectItemDesc}</p>
												<p><span>배송비 </span>
													 ${projectItem.shippingFee}
												</p>
												<p>제한수량 ${projectItem.quantity}개 남음</p>
											</div>
										</a>
									</li>
										<%
									} else {
										%>
										<p>로그인 후에 펀딩하실 수 있습니다.</p>
										<%
									}
										%>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<div class="description"></div>
	<!-- 구글 맵 넣어주기  -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDq0AzhkYcg-kmHAxrEjRJV7JjG5TyO6sA&callback=initMap&libraries=&v=weekly" async></script>
</body>
</html>