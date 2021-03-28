package com.poosil.pay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.pay.biz.PayBiz;
import com.poosil.pay.biz.PayBizImpl;
import com.poosil.pay.dto.PayDto;


@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayController() {
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PayBiz biz = new PayBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		if(command.equals("adminpaylist")) {
			
			List<PayDto> list = biz.adminPaymentList();
			
			request.setAttribute("list", list);
			
			dispatch(request, response, "admin_payment_history.jsp");
			
		} else if (command.equals("orderres")) {
			System.out.println(
					request.getParameter("projectName")
					+request.getParameter("projectItemSeq")
					+request.getParameter("quantity")
					+request.getParameter("price")
					+request.getParameter("address")
					+request.getParameter("phone")
					+request.getParameter("userId")
					);		
			String userId = request.getParameter("userId");
			int projectItemSeq = Integer.parseInt(request.getParameter("projectItemSeq"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int price = Integer.parseInt(request.getParameter("price"));
			String address = request.getParameter("address");
			int phone = Integer.parseInt(request.getParameter("phone"));
			int totalprice = 0;
			
			PayDto dto = new PayDto(0, quantity, userId, projectItemSeq, address, phone, totalprice, price, null);
			
			int res = biz.insertadminPayment(dto);
			
			if(res > 0) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("orderpage.jsp");
			}
			} else if (command.equals("custompaylist")) {
				
				List<PayDto> list = biz.customerPaymentList();
				
				request.setAttribute("list", list);
				
				dispatch(request, response, "custom_payment_history.jsp");
			}
				
		}
	
	
		public void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException  {
		
			RequestDispatcher dispatch = request.getRequestDispatcher(path);
			dispatch.forward(request, response);
		
	}
	

}
