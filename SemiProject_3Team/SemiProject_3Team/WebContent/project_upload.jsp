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
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="js/proj4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
	
		/* summernote에서 이미지 업로드시 실행할 함수 */
		function sendFile(file, editor) {
			// 파일 전송을 위한 폼생성
			data = new FormData();
			data.append("uploadFile", file);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data: data,
				type: "POST",
				url: "imageUpload.do",
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) { // 처리가 성공할 경우
					// 에디터에 이미지 출력
					console.log("succes =", data)
					$(editor).summernote('editor.insertImage', "image/" + JSON.parse(data).url);
				}
			});
		}
		$(document).ready(function () {
			$('#summernote').summernote({ // summernote를 사용하기 위한 선언
				height: 400,
				callbacks: { // 콜백을 사용
					// 이미지를 업로드할 경우 이벤트를 발생
					onImageUpload: function (files, editor, welEditable) {
						sendFile(files[0], this);
					}
				}
			});



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
						console.log("succes =", data)
						const url = "image/" + JSON.parse(data).url;
						currentInput.next().val(url);
					}
				});
			})
		});



		function handleUploadProject() {

			
			//com.poosil.projects.biz.ProjectsBizImpl.insertProjectItems
			/**
			
				String projectItemName = projectItemsArray.get(i).getAsJsonObject().get("projectItemName")
							.getAsString();
					String projectItemDesc = projectItemsArray.get(i).getAsJsonObject().get("projectItemDesc")
							.getAsString();
					int shippingFee = projectItemsArray.get(i).getAsJsonObject().get("shippingFee").getAsInt();
					int quantity = projectItemsArray.get(i).getAsJsonObject().get("quantity").getAsInt();
//					String ItemThumbImage = projectItemsArray.get(i).getAsJsonObject().get("thumbImage").getAsString();
					int price = projectItemsArray.get(i).getAsJsonObject().get("price").getAsInt();
					
					*/

			const projectItems = [...document.querySelectorAll(".projectsItem")].map((x, idx) => {
				return {
					projectItemName: x.querySelector(".projectItemName").value,
					projectItemDesc: x.querySelector(".projectItemDesc").value,
					shippingFee: x.querySelector(".shippingFee").value,
					quantity: x.querySelector(".quantity").value,
					price : x.querySelector(".price").value
				}
			});
			
					
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
					// 에디터에 이미지 출력
					console.log("upload Success =", resData.result)
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
			
			console.log(lonAndLat) //[127.25313872031843, 37.65626868953749]
			
			var addressEl = document.querySelector("#address").value = roadFullAddr;
			document.querySelector("#latitude").value = lonAndLat[0];
			document.querySelector("#longtitude").value =  lonAndLat[1];
			document.querySelector("#province").value = province;
			
			
			/* console.log(x,y, province) */
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