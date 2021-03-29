<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<%
	int projectItemSeq = Integer.parseInt(request.getParameter("projectItemSeq"));
	System.out.println("projectItemSeq = " + projectItemSeq);
	String projectName = request.getParameter("projectName");
	System.out.println("projectName = " + projectName);
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	System.out.println("quantity = " + quantity);
	int price = Integer.parseInt(request.getParameter("price"));
	System.out.println("price = " + price);
	String userId = request.getParameter("userId");
	System.out.println("userId = " + userId);
	String name = request.getParameter("name");
	System.out.println("name = " + name);
	String address = request.getParameter("address");
	System.out.println("address = " + address);
	int phone = Integer.parseInt(request.getParameter("phone"));
	System.out.println("phone = " + phone);
%>
<body>
<form action="pay.do" method="post" id="formdata">
<input type="hidden" name="command" value="orderres"/>
<script>
 
 $(function(){
     var IMP = window.IMP; 
     IMP.init('가맹점 식별 코드'); //필요하신분 김대진 문의  
     var msg;

 	IMP.request_pay({
 		 	
	    pg : 'kakao',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '<%=projectName%>',
	    amount : <%=price%>,
	    buyer_email : 'iamport@siot.do',
	    buyer_name :'<%=name%>',
	    buyer_tel : <%=phone%>,
	    buyer_addr : '<%=address%>',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log("here 1 = ")
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            
            $.ajax({
                url: "pay.do", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {		
                	
                	command : "orderres",
                    imp_uid : rsp.imp_uid,
                    projectItemSeq : <%=projectItemSeq%>,
                    projectName : '<%=projectName%>',
                    quantity : <%=quantity%>,
                    price : <%=price%>,
                    userId : '<%=userId%>',
                    name : '<%=name%>',
                    address : '<%=address%>',
                    phone : <%=phone%>
               	
                },
                success : function(res){
                	console.log(res)
                }, 
                error : function (err){
                	console.log(err)
                }
            
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                console.log("data = ", data);
                if ( everythings_fine ) {
                	console.log("data = ", data);
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
                
            });
            
            //성공시 이동할 페이지
            console.log("rsp = ", rsp);
            
            alert("결제 성공!")
            
            location.href="index.jsp";
            
            
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="orderpage.jsp";
            alert(msg);
        }
    });

});
    </script> 
</form>
</body>
</html>