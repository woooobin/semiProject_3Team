package com.poosil.notice.noticecontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		NoticeBiz biz = new NoticeBizImpl();
		String command = request.getParameter("command");
		
		//  메인 페이지에서 눌렀을때 작동하도록 메인페이지쪽 controller에서 만들어야함
		    if(command.equals("list")) {
		    String userrole = request.getParameter("userrole");
			List<NoticeDto> list = biz.selectList();
			// 이게 맞을까? 이거 물어봐야함.
			NoticeDto dto = new NoticeDto(0, null, null, null, userrole, null, null);
			request.setAttribute("list", list);
			if(dto != null) {	
				if(dto.getUserrole().equals("ADMIN")) {
					dispatch(request, response, "notice/adminlist.jsp");//notice/adminlist.jsp
				} else {
					dispatch(request, response, "notice/userlist.jsp");//notice/userlist.jsp
				}
			} 
			
		} else if(command.equals("select")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			
			NoticeDto dto = biz.selectOne(noticeseq);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "notice/select.jsp");
			
		} else if(command.equals("insertform")) {
			dispatch(request, response, "notice/insert.jsp");
			
		} else if(command.equals("insertres")) {
			// 이거도 스트링인가?
			String option = request.getParameter("option");
			String noticetitle = request.getParameter("noticetitle");
			String noticecontent = request.getParameter("noticecontent");
			
			NoticeDto dto = new NoticeDto(0, null, noticetitle, noticecontent, null, null, null);
			int res = biz.insert(dto);
			
			if(res > 0) {
				response.sendRedirect("notice.do?command=list");
			} else {
				response.sendRedirect("notice.do?command=insertform");
			}
			
		} else if(command.equals("updateform")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			
			NoticeDto dto = biz.selectOne(noticeseq);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "notice/update.jsp");
			
		} else if(command.equals("updateres")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			String option = request.getParameter("option");
			String noticetitle = request.getParameter("noticetitle");
			String noticecontent = request.getParameter("noticecontent");
			
			NoticeDto dto = new NoticeDto(noticeseq, null, noticetitle, noticecontent, null, null, null);
			
			int res = biz.update(dto);
			
			if(res > 0) {
				response.sendRedirect("notice.do?command=select&noticeseq"+noticeseq);
			} else {
				response.sendRedirect("notice.do?command=updateform&noticeseq"+noticeseq);
			}
			
		} else if (command.equals("delete")) {
			int noticeseq = Integer.parseInt(request.getParameter("noticeseq"));
			int res = biz.delete(noticeseq);
			if(res > 0) {
				dispatch(request, response, "mvc.do?command=list");
			} else {
				dispatch(request, response, "mvc.do?command=select&noticeseq="+noticeseq);
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
