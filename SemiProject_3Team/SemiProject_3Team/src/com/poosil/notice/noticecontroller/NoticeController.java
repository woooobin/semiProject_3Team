package com.poosil.notice.noticecontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poosil.login.dto.loginDto;
import com.poosil.notice.noticebiz.NoticeBiz;
import com.poosil.notice.noticebiz.NoticeBizImpl;
import com.poosil.notice.noticedto.NoticeDto;



@WebServlet("/notice.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		NoticeBiz biz = new NoticeBizImpl();
		String command = request.getParameter("command");
		
		if(command.equals("list")) {
			String userrole = request.getParameter("userrole");
			String userId= request.getParameter("userId");
			
				List<NoticeDto> list = biz.selectList();
				NoticeDto dto = new NoticeDto(0, userId, null, null, userrole, null);
				request.setAttribute("list", list);
				dispatch(request, response, "notice/list.jsp");
				
			
		} else if(command.equals("select")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			
			NoticeDto dto = biz.selectOne(noticeseq);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "notice/select.jsp");
			
		} else if(command.equals("insertform")) {
			dispatch(request, response, "notice/insert.jsp");
			
		} else if(command.equals("insertres")) {
			
			loginDto loginDto = (loginDto)session.getAttribute("dto");
			String userid = loginDto.getUserid();
			String noticetitle = request.getParameter("noticetitle");
			String noticecontent = request.getParameter("noticecontent");
			
			
			System.out.println("logindto" + loginDto + "notietitle = " + noticetitle + "noticecontent = " + noticecontent);
			
			
			NoticeDto dto = new NoticeDto(0, userid, noticetitle, noticecontent, "ADMIN", null);
			
			int res = biz.insert(dto);
			System.out.println("res= " + res);
			if(res > 0) {
				response.sendRedirect("notice.do?command=list");
			} else {
				response.sendRedirect("notice.do?command=insertform");
			}
			
		} else if(command.equals("updateform")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			
			NoticeDto dto = biz.selectOne(noticeseq);
			
			request.setAttribute("ntdto", dto);
			
			dispatch(request, response, "notice/update.jsp");
			
		} else if(command.equals("updateres")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			String noticetitle = request.getParameter("noticetitle");
			String noticecontent = request.getParameter("noticecontent");
			
			NoticeDto dto = new NoticeDto(noticeseq, null, noticetitle, noticecontent, null, null);
			
			int res = biz.update(dto);
			
			if(res > 0) {
				response.sendRedirect("notice.do?command=select&noticeseq="+noticeseq);
			} else {
				response.sendRedirect("notice.do?command=updateform&noticeseq="+noticeseq);
			}
			
		} else if (command.equals("delete")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			int res = biz.delete(noticeseq);
			if(res > 0) {
				dispatch(request, response, "index.jsp");
			} else {
				dispatch(request, response, "notice.do?command=select&noticeseq="+noticeseq);
			}
		
		}
	}
		
		
		
		
	
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
}
