<%@page import="com.poosil.projects.dto.ProjectDto"%>
<%@page import="com.poosil.pay.dto.PayDto"%>
<%@page import="com.poosil.projects.dto.ProjectItemDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>

<%@page import="com.poosil.login.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="./styles/reset.css" rel="stylesheet">
<link href="./styles/layout.css" rel="stylesheet">
<link href="./styles/main.css" rel="stylesheet">
<link rel="stylesheet" href="styles/orderpage.css">

<link href="images/logo/favicon.png" rel="shortcut icon">
<title>POOSIL</title>

 <script>
      
      function goPopup() {
           // 주소검색을 수행할 팝업 페이지를 호출합니다.
           // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
           var pop = window.open("signup/jusoPopup.jsp", "pop",
                   "width=570,height=420, scrollbars=yes, resizable=yes");
       }
       var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){ 
           document.getElementById("address").value = roadFullAddr; 
         
       }
   </script>

</head>

<%
	loginDto logindto = (loginDto)session.getAttribute("dto"); 
	System.out.println("logindto = " + logindto.getUserid());
	ProjectItemDto projectitemdto = (ProjectItemDto)request.getAttribute("projectitemdto");
	System.out.println("projectItemSeq 3 = " + projectitemdto.getProjectItemSeq());
%>
<body>

	<%@ include file="./ui/header.jsp"%>
	
	<!-- header -->
        <div id="header">
        <h1>주문서 작성</h1>
        </div>
<form action="pay.jsp" method="post">
      
        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- projectItemSeq -->
                <div>
                    <h3 class="join_title">
                        <label for="projectItemSeq">상품 번호</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="projectItemSeq" name="projectItemSeq" class="int"required="required" maxlength="20" readonly="readonly" value="<%=projectitemdto.getProjectItemSeq() %>"/>
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- projectId -->
                <div>
                    <h3 class="join_title">
                    <label for="projectId">프로젝트 번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="projectId" name="projectId" class="int" maxlength="20" readonly="readonly" value="<%=projectitemdto.getProjectId() %>" />
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- pw2 -->
                <div>
                    <h3 class="join_title">
                    <label for="projectName">프로젝트 이름</label><font id="chkNotice" size="2"></font></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="projectName" name="projectName" class="int" maxlength="20" required="required" readonly="readonly" value="<%=projectitemdto.getProjectItemName() %>"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- 상품가 -->
                <div>
                    <h3 class="join_title"><label for="price">프로젝트 펀딩금액</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="price" name="price" class="int" maxlength="20" required="required" readonly="readonly" value="<%=projectitemdto.getPrice()%>" />
                    </span>
                    <span class="error_next_box"></span>
                </div>
             
                <!-- 상품가 -->
                <div>
                    <h3 class="join_title"><label for="deliveryFee">배송비</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="deliveryFee" name="deliveryFee" class="int" maxlength="20" required="required" readonly="readonly" value="3000" />
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- 결제 금액 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">결제 금액</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="purchasePrice" name="purchasePrice" class="int" maxlength="20" required="required" readonly="readonly" value="<%=projectitemdto.getPrice()+3000%>" />
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- ID -->
                <div>
                    <h3 class="join_title"><label for="userId">ID</label></h3>
                    <span class="box int_name">
                        <input type="text" id="userId" name="userId" class="int" maxlength="20" readonly="readonly" required="required" value="<%=logindto.getUserid() %>"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" maxlength="20" required="required" value="<%=logindto.getUsername() %>"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                 
                <div>
                    <h3 class="join_title"><label for="address">주소</label> &nbsp;<button type="button" class="btnjuso" onClick="goPopup();">검색</button></h3>
                    <span class="box int_name">
                    <input type="text" id="address" name="address" class="int" required="required" value="<%=logindto.getAddress()%>"/>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                 <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text" id="phone" name="phone" class="int" maxlength="16" required="required" value="<%=logindto.getUserphone() %>"/>
                    </span>
                    <span class="error_next_box"></span>    
                </div>
 
                <!-- EMAIL -->
                 
                <div>
                    <h3 class="join_title"><label for="useremail">이메일 &nbsp; <span class="optional"></span></label></h3>
                    <span class="box int_email">
                         <input type="text" id="useremail" name="useremail" class="int" maxlength="100" required="required" value="<%=logindto.getUseremail() %>"/>
                    </span>
                    <span class="error_next_box"></span>    
                </div>
              	
                <!-- PAY BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>카카오페이 결제</span>
                    </button>
                </div>

                

            </div> 
            <!-- content-->

        </div> 
        </form>
        <!-- wrapper -->
    <script src="main.js"></script>
    <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/>   <br/><br/><br/><br/><br/><br/><br/>   <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/>
       <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

 <div class="container">
<div class="row justify-content-md-center">
  <div class="col-md-auto">
     
    </div>
  </div>
</div>

   
</body>
</html>


