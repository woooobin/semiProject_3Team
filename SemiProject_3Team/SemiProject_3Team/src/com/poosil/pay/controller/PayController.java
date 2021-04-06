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
import com.poosil.pay.dao.PayDao;
import com.poosil.pay.dao.PayDaoImpl;
import com.poosil.pay.dto.PayDto;
import com.poosil.projects.biz.ProjectsBiz;
import com.poosil.projects.biz.ProjectsBizImpl;
import com.poosil.projects.dto.ProjectDto;
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
		PayDao dao = new PayDaoImpl();
		
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
					+request.getParameter("purchasePrice")
					+request.getParameter("deliveryFee")
					);		
			String userId = request.getParameter("userId");
			int projectItemSeq = Integer.parseInt(request.getParameter("projectItemSeq"));
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int price = Integer.parseInt(request.getParameter("price"));
			String address = request.getParameter("address");
			int phone = Integer.parseInt(request.getParameter("phone"));
			int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			//int totalPrice = 0;
			int deliveryFee = Integer.parseInt(request.getParameter("deliveryFee"));
			int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));
			
			PayDto dto = new PayDto(0, quantity, userId, projectItemSeq, address, phone, totalPrice, price, deliveryFee, purchasePrice, null);
			
			int res = biz.insertadminPayment(dto);
			
			if(res > 0) {
				
					/*
					ProjectDto projectdto = new ProjectDto();
					projectdto.setTotalPrice(totalPrice);
					*/
					
					int updateres = biz.updateTotalPrice(dto);
					
					if(updateres > 0) {
						response.sendRedirect("project_list.jsp");
					} else {
						response.sendRedirect("project_list.jsp");
					}
					
				} else {
					response.sendRedirect("project_list.jsp");
				
			} 
			
			    
			} else if (command.equals("custompaylist")) {
				
				HttpSession session = request.getSession();
				
				String userId = request.getParameter("userid");
				
				System.out.println("userid 1=" + userId);
				
				List<PayDto> paylist = biz.customerPaymentList(userId);
				
				System.out.println("paylist =" + paylist);
				
				request.setAttribute("paylist", paylist);
			
				dispatch(request, response, "customer_payment_history.jsp");
			} else if (command.equals("orderpage")) {
				//로그인 세션 가져오기
				HttpSession session = request.getSession();
				
				String userid = request.getParameter("userid");
				
				//세션에서 가져오는 값은 다 오브젝트 
				loginDto dto = loginbiz.selectMy(userid);
				//System.out.println("userid = " + dto.getUserid());
				session.setAttribute("dto", dto);
				
				//상품 정보 가져오기
				
				int projectItemSeq = Integer.parseInt(request.getParameter("projectItemSeq"));
				System.out.println("projectItemSeq 1 =" + projectItemSeq );
				ProjectItemDto projectitemdto = biz.selectProjectItem(projectItemSeq);
				System.out.println("projectItemSeq 2 = " + projectitemdto.getProjectItemSeq());
				request.setAttribute("projectitemdto", projectitemdto);
				
				//totalPrice 가져오기
				
				int projectId = Integer.parseInt(request.getParameter("projectId"));
				
				ProjectDto projectdto = projectbiz.selectOne(projectId);
				System.out.println("projectId 1 =" + projectId );
				request.setAttribute("projectdto", projectdto);
				
				dispatch(request, response, "orderpage.jsp");
				
				
				
				
			} 
				
		}
	
	
		public void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException  {
		
			RequestDispatcher dispatch = request.getRequestDispatcher(path);
			dispatch.forward(request, response);
		
	}
	

}
