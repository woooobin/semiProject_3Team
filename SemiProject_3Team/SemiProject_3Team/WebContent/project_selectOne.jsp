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
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="styles/reset.css" rel="stylesheet">
<link href="styles/bootstrap.min.css" rel="stylesheet">
<link href="styles/layout.css" rel="stylesheet">
<link href="styles/project_selectOne.css" rel="stylesheet">

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 400px;width:400px;
      }
    </style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<c:set var="dto" value="${requestScope.dto}" />

<script>
	onload = function() {
		document.querySelector(".description").innerHTML = `${dto.detailDesc }`;
	}
	function openWin() {
		var url = "chatting.jsp";
		var title = "customerCenter";
		var prop = "top=200px,left=600px,width=400px,height=400px";
		window.open(url,"", prop);
	}
	
</script>

<!--  -->
 <script>
      // In this example, we center the map, and add a marker, using a LatLng object
      // literal instead of a google.maps.LatLng object. LatLng object literals are
      // a convenient way to add a LatLng coordinate and, in most cases, can be used
      // in place of a google.maps.LatLng object.
      let map;

      function initMap() {
        const mapOptions = {
          zoom: 15,
          center:  { lat:  ${dto.longitude }, lng: ${dto.latitude } },
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        const marker = new google.maps.Marker({
          
          position: { lat: ${dto.longitude } , lng: ${dto.latitude }},
          map: map,
        });
        const infowindow = new google.maps.InfoWindow({
          content: "<p>Marker Location:" + marker.getPosition() + "</p>",
        });
        google.maps.event.addListener(marker, "click", () => {
          infowindow.open(map, marker);
        });
      }
    </script>
</head>
<body>
	<%@ include file="../ui/header.jsp"%>
	<h1>select One</h1>
	<%-- <c:set var="projectItems" value="${requestScope.projectItems}" /> --%>

	
	projectId = ${dto.projectId}
	<div class="project-detail-header">
		<h2>${dto.projectMainTitle}</h2>
		<h3>${dto.projectSubTitle }</h3>
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
				<!-- end description -->
			</div>

		</div>
		<div class="rgt">
			<div class="wrapper">
			
				<div class="project-detail-info">
					<p>달성</p>
					<div class="graph">
						<span class="graph-inner"
							style="display:block;width : calc( (${dto.goalPrice } / ${dto.totalPrice } ) * 100 ) %; background-color : #777;"></span>
					</div>
					<div id="map"></div>
					<p>${dto.address }</p>
					
					<p>${dto.province }</p>
					<h3>남은 후원일</h3>
					<p class="restDay"></p>
					<h3>펀딩액</h3>
					<p>${dto.totalPrice }</p>
					<h3>발송 시작일</h3>
					<p>${dto.shippingStartDate}</p>

					<div class="project-detail-sub-nav">
						<button>like</button>
						<button onclick="openWin()">채팅</button>
						<button>share</button>
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
										<div class="frame">
											<h4>${projectItem.projectItemName}</h4>
											<p>${projectItem.projectItemDesc}</p>
											<p>
												<span>배송비 </span> ${projectItem.shippingFee}
											</p>
											<p>${projectItem.quantity}개중(수량-팔린갯수 )개 남음</p>
											<p>${projectItem.price}</p>
											<button
												href="pay.do?command=orderpage&userid=${ userid}&projectItemSeq=${ projectItemSeq}">projectItemseq
												= ${projectItem.projectItemSeq} 후원하기</button>
											<span class="icon"><img
												src="${projectItem.thumbImage}" /></span>
										</div>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<%-- <img src="${dto.thumbImage}" width="100" /> --%>

	<div class="description"></div>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDq0AzhkYcg-kmHAxrEjRJV7JjG5TyO6sA&callback=initMap&libraries=&v=weekly"
		async></script>
</body>
</html>