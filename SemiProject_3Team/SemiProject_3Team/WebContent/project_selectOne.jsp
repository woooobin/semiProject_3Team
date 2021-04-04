<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%
loginDto logindto = (loginDto)session.getAttribute("dto"); /*  */
boolean isLiked = (boolean)request.getAttribute("isLiked");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link href="styles/reset.css" rel="stylesheet">
<!-- <link href="styles/bootstrap.min.css" rel="stylesheet"> -->
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/project_selectOne.css" rel="stylesheet">

<link href="styles/all.css" rel="stylesheet"> <!--load all styles -->
    <style type="text/css">
      #map {
        height: 400px;width:400px;
      }
    </style>
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<c:set var="projectDto" value="${requestScope.projectDto}" />
<%-- <c:set var="isLiked" value="${requestScope.isLiked}" /> --%>

<script>
	onload = function() {
		document.querySelector(".description").innerHTML = `${projectDto.detailDesc }`;
	}
	function openWin() {
		var url = "chatting.jsp";
		var title = "customerCenter";
		var prop = "top=200px,left=600px,width=400px,height=400px";
		window.open(url,"", prop);
	}
	function handleLike(){
	<%
		if(logindto != null){
			%>
			location.href="project.do?command=projectToggleLike&projectId="+${projectDto.projectId}+"&isLiked="+<%=isLiked%>
			<%
		}else{
			%>
			return alert("로그인 한 유저만 좋아요 할 수 있습니다. ")
			<%
		}
	%>
			
	}
	
</script>

 <script>
 
      let map;

      function initMap() {
        const mapOptions = {
          zoom: 15,
          center:  { lat:  ${projectDto.longitude }, lng: ${projectDto.latitude } },
          disableDefaultUI:true,
          zoomControl: true
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        
        const marker = new google.maps.Marker({
          position: { lat: ${projectDto.longitude } , lng: ${projectDto.latitude }},
          map: map,
        });
        
        google.maps.event.addListener(marker, "click", () => {
          infowindow.open(map, marker);
        });
      }
    </script>
    <meta property="og:type" content="website"> 
<meta property="og:title" content="${projectDto.projectMainTitle}">
<meta property="og:description" content="${projectDto.projectSubTitle }">
<meta property="og:image" content="images/imsimungmunglogo.jpeg">
<meta property="og:url" content="http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId}>
</head>
<body>
	<%@ include file="ui/header.jsp"%>
	<h1>select One</h1>
	<%-- <c:set var="projectItems" value="${requestScope.projectItems}" /> --%>

	
	<%-- projectId = ${projectDto.projectId} --%>
	<div class="project-detail-header" >
		<h2>${projectDto.projectMainTitle}</h2>
		<h3>${projectDto.projectSubTitle }</h3>
	</div>
	<div class="layout_wrap project-detail-section ">
		<div class="lft">
			<div class="wrapper">
				<div class="project-detail-nav">
					<ol>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">응원글보기</a></li>
						<li><a href="#">문의게시판</a></li>
					</ol>
				</div>
				<!-- end nav -->
				<div class="project-detail-hashtags">
					<c:choose>
						<c:when test="${empty projectHashtags}">
							<p>등록된 해시태그가 없어요!</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${projectHashtags}" var="projectHashtag">
								<a
									href="project.do?command=selectWHashtag&hashtagSeq=${ projectHashtag.hashtagSeq }">${ projectHashtag.hashtagName }</a>
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
					<p>달성</p>
					<div id="map"></div>
					<p>${projectDto.address }</p>
					
					<h3>남은 후원일<span></span></h3>
					
					<h3>펀딩액<span>${projectDto.totalPrice }</span></h3>
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
						
						<button class="btn" onclick="openWin()"><i class="far fa-comment"></i></button>
						
						<a id="kakao-link-btn" href="javascript:sendLink()">
							<i class="fas fa-share-alt"></i> share 카카오톡 공유하기 버튼 </a>
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
									<% if(logindto != null) {	
									%>										
										<a href="pay.do?command=orderpage&userid=<%=logindto.getUserid() %>&projectItemSeq=${ projectItem.projectItemSeq}">
										
											<div class="frame">
												<p>${projectItem.price}원 응원하기 </p>
												<h4>${projectItem.projectItemName}</h4>
												<p>${projectItem.projectItemDesc}</p>
												<p><span>배송비 </span>
													 ${projectItem.shippingFee}
												</p>
												<p>제한수량 ${projectItem.quantity}개 중 (수량-팔린갯수 )개 남음</p>
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
	<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d2cc856fd683da85b775d0d7fcce39ce');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: $('meta[property="og:title"]').attr( 'content' ),
        description: $('meta[property="og:description"]').attr( 'content' ),
        imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
        link: {
          mobileWebUrl:"http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId},
          webUrl: "http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId}
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            /* webUrl: window.location.href */
            webUrl: "http://localhost:8787/SemiProject_3Team/project.do?command=selectOne&projectId="+${projectDto.projectId}
          }
        }
      ]
    });
  //]]>
</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDq0AzhkYcg-kmHAxrEjRJV7JjG5TyO6sA&callback=initMap&libraries=&v=weekly" async></script>
</body>
</html>