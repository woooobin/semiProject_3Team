<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="styles/reset.css" rel="stylesheet" />
	<link href="styles/layout.css" rel="stylesheet" />
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<!-- 
	proj4 :기상청에서 제공하는 좌표값이 위도 경도로 변환하기 까다로워서 보니까 이 라이브러리 쓰라고 되어있어서 가지고 옴
	 -->
	<script src="js/proj4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="js/summernote_upload.js"></script>
	<script type="text/javascript">
	
		
		$(document).ready(function () {
			// image input에 이미지 업로드시 해당 리스너가 호출된다. 
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
						const url = "image/" + JSON.parse(data).url;
						currentInput.next().val(url);
					}
				});
			})
		});



		function handleUploadProject() {

			const projectItems = [...document.querySelectorAll(".projectsItem")].map((x, idx) => {
				return {
					projectItemName: x.querySelector(".projectItemName").value,
					projectItemDesc: x.querySelector(".projectItemDesc").value,
					shippingFee: x.querySelector(".shippingFee").value,
					quantity: x.querySelector(".quantity").value,
					price : x.querySelector(".price").value
				}
			});
			
			// input에 있는 것을 전체를 가지고 와서 #에 맞춰서 잘라서 끊어 넣어줌 . 
			const hashtags = document.getElementById("hashtags").value ? document.getElementById("hashtags").value.match(/#[^\s#]+/g).join(",") : "";
			const data = {
				projectMainTitle: $("#projectMainTitle").val(),
				thumbnailImage: $("#thumbnailImage").val(),
				goalPrice: $("#goalPrice").val(),
				projectStartDate: $("#projectStartDate").val(),
				shippingStartDate: $("#shippingStartDate").val(),
				projectSubTitle: $("#projectSubTitle").val(),
				projectCategory: $("#projectCategory").val(),
				projectEndDate: $("#projectEndDate").val(),
				detailDesc: $(".detailDesc").val(),
				address: $("#address").val(),
				latitude: $("#latitude").val(),
				longtitude: $("#longtitude").val(),
				province: $("#province").val(),
				projectItems: projectItems,
				hashtags : hashtags
			};
			$.ajax({ 
				data: { "command": "insertProject", "data": JSON.stringify(data) },
				type: "POST",
				dataType: "json",
				url: "project.do",
				success: function (resData) { // 처리가 성공할 경우
					// 에디터에 이미지 출력 성공시 서버로부터 result success 인 것을 리턴 
					if (resData.result == "success") {
						location.href = "project.do?command=selectList";
					}
				},
				error: function (error) {
					console.log("error=", error)
				}
			});
		}

		function goPopup() {
			var pop = window.open("jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}
		function jusoCallBack(roadFullAddr,x,y, province) {
			
			const point1 = [+x,+y];
		    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs"; // from
		    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; 
			var lonAndLat = proj4(firstProjection, secondProjection, point1); //변환된 위도, 경도 
			
			var addressEl = document.querySelector("#address").value = roadFullAddr;
			document.querySelector("#latitude").value = lonAndLat[0];
			document.querySelector("#longtitude").value =  lonAndLat[1];
			document.querySelector("#province").value = province;
		}
	</script>

</head>

<body>

	<br /><br /><br />
	<div class="container">

		<form action="" method="post">
			<div class="layout_wrap">
				<div class="half">
					<input type="text" id="projectMainTitle" name="projectMainTitle" placeholder="프로젝트의 메인 제목"
						class="form-control" value="misi maintitle" />
					<br />
					<div>
						<input type="file" class="imageInput" />
						<input type="text" id="thumbnailImage" name="thumbImage" />
					</div>
					<br />
					<input type="text" name="goalPrice" id="goalPrice" placeholder="목표 금액" class="form-control"
						value="1000000" />
					<br />
					<input type="date" name="projectStartDate" id="projectStartDate" placeholder="프로젝트 시작일"
						class="form-control" value="2021-03-21" />
					<br />
					<input type="date" name="shippingStartDate" id="shippingStartDate" placeholder="발송 시작일"
						class="form-control" value="2021-04-02" />
				</div>
				<!-- end left -->
				<div class="half">
					<input type="text" name="projectSubTitle" id="projectSubTitle" placeholder="프로젝트의 부제목"
						class="form-control" value="projectSubTitle" />
					<br />
					<select class="form-control" name="projectCategory" id="projectCategory">
						<option value="뷰티" selected>뷰티</option>
						<option value="음식">음식</option>
						<option value="테크">테크</option>
						<option value="문화예술">문화예술</option>
					</select>
					<br />
					<input type="date" name="projectEndDate" id="projectEndDate" class="form-control"
						value="2021-04-02" />
					<br/><button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
						<input type="text" name="address" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
						<input type="text" name="latitude" id="latitude" class="form-control" readonly/>
						<input type="text" name="longtitude" id="longtitude" class="form-control" readonly/>
						<input type="text" name="province" id="province" class="form-control" readonly/>
				</div>
			</div>
			<br />
			<br />

			<div class="wrap clearfix">
				<div class="lft projectsItem">
					<input type="text" placeholder="상품의 메인 이름" name="projectItemName"
						class="form-control projectItemName" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" placeholder="상품의 구성 내역" name="projectItemDesc"
						class="form-control projectItemDesc" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" name="shippingFee" placeholder="배송비" value="3000" class="form-control shippingFee" />
					<input type="text" name="price" placeholder="물품의 가격" class="form-control price" value="3000"/>
					<input type="number" name="quantity" placeholder="수량" value="5" class="form-control quantity" />
				</div>
				<div class="lft projectsItem">
					<input type="text" placeholder="상품의 메인 이름" name="projectItemName"
						class="form-control projectItemName" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" placeholder="상품의 구성 내역" name="projectItemDesc"
						class="form-control projectItemDesc" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" name="shippingFee" placeholder="배송비" value="3000" class="form-control shippingFee" />
					<input type="text" name="price" placeholder="물품의 가격" class="form-control price" value="3000"/>
					<input type="number" name="quantity" placeholder="수량" value="5" class="form-control quantity" />
				</div>
				<div class="lft projectsItem">
					<input type="text" placeholder="상품의 메인 이름" name="projectItemName"
						class="form-control projectItemName" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" placeholder="상품의 구성 내역" name="projectItemDesc"
						class="form-control projectItemDesc" value="projectItemnameasdfasdf" />
					<br />
					<input type="text" name="shippingFee" placeholder="배송비" value="3000" class="form-control shippingFee" />
					<input type="text" name="price" placeholder="물품의 가격" class="form-control price" value="3000"/>
					<input type="number" name="quantity" placeholder="수량" value="5" class="form-control quantity" />
				</div>
			</div>
			<br />
			<br />

			<textarea rows="30" cols="100" name="detailDesc" class="detailDesc" id="summernote"
				placeholder="write something"></textarea>
			<br />
			<br />
			<input 
				type="text" 
				placeholder="사용할 해쉬태그를 #으로 구분하여 입력" 
				name="hashtags" 
				id="hashtags" 
				class="form-control"  />
			<br />
			<br />

			<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
			<button type="button" class="btn btn-default" onclick="handleUploadProject()">제출</button>
		</form>
	</div>
	<br /><br /><br />
</body>

</html>