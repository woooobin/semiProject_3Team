package com.poosil.pay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poosil.login.biz.loginBiz;
import com.poosil.login.dto.loginDto;
import com.poosil.pay.biz.PayBiz;
import com.poosil.pay.biz.PayBizImpl;
import com.poosil.pay.dto.PayDto;
import com.poosil.projects.biz.ProjectsBiz;
import com.poosil.projects.biz.ProjectsBizImpl;
import com.poosil.projects.dto.ProjectItemDto;


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
		
		loginBiz loginbiz = new loginBiz();
		ProjectsBiz projectbiz = new ProjectsBizImpl();
		
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
				
				HttpSession session = request.getSession();
				String userId = request.getParameter("userid");
				
				List<PayDto> list = biz.customerPaymentList();
				
				request.setAttribute("list", list);
				
				dispatch(request, response, "customer_payment_history.jsp");
			} else if (command.equals("orderpage")) {
				//로그인 세션 가져오기
				HttpSession session = request.getSession();
				
				String userid = request.getParameter("userid");
				//세션에서 가져오는 값은 다 오브젝트 
				loginDto logindto = loginbiz.selectMy(userid);
				
				session.setAttribute("logindto", logindto);
				
				//상품 정보 가져오기
				/*
				int projectId = Integer.parseInt(request.getParameter("projectId"));
				
				List<ProjectItemDto> projectItems = new ArrayList<ProjectItemDto>();
				projectItems = projectbiz.selectProjectItems(106);
				request.setAttribute("projectItems", projectItems);
				*/
				response.sendRedirect("orderpage.jsp");
				
				
			}
				
		}
	
	
		public void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException  {
		
			RequestDispatcher dispatch = request.getRequestDispatcher(path);
			dispatch.forward(request, response);
		
	}
	

}
