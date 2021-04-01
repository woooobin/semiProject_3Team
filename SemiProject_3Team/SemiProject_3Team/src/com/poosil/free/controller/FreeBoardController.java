package com.poosil.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.free.biz.FreeBoardBiz;
import com.poosil.free.biz.FreeBoardBizImpl;
import com.poosil.free.dao.FreeBoardDao;
import com.poosil.free.dao.FreeBoardDaoImpl;
import com.poosil.free.dto.FreeBoardDto;

/**
 * Servlet implementation class FreeBoardController
 */
@WebServlet("/free.do")
public class FreeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		FreeBoardDao dao = new FreeBoardDaoImpl();
		FreeBoardBiz biz = new FreeBoardBizImpl();
		String command = request.getParameter("command");
		
		if(command.equals("list")) {
			List<FreeBoardDto> list = biz.selectList();
			request.setAttribute("list", list);
			
			dispatch(request, response, "freeboard/list.jsp");
		} else if (command.equals("select")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			
			dao.readcount(freeboardseq);
			
			FreeBoardDto dto = biz.selectOne(freeboardseq);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "freeboard/select.jsp");
			
		} else if (command.equals("insertform")) {
			dispatch(request, response, "freeboard/insert.jsp");
			
		} else if (command.equals("insertres")) {
			String userid = request.getParameter("userid");
			String freeboardtitle = request.getParameter("freeboardtitle");
			String freeboardcontent = request.getParameter("freeboardcontent");
			
			FreeBoardDto dto = new FreeBoardDto(0, userid, freeboardtitle, freeboardcontent, null, 0);
			int res = biz.insert(dto);
			
			if(res > 0) {
				response.sendRedirect("free.do?command=list");
			} else {
				response.sendRedirect("free.do?command=insertform");
			}
			
		} else if (command.equals("updateform")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			
			FreeBoardDto dto = biz.selectOne(freeboardseq);
			
			request.setAttribute("fbdto", dto);
			
			dispatch(request, response, "freeboard/update.jsp");
			
		} else if(command.equals("updateres")) {
			
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			String freeboardtitle = request.getParameter("freeboardtitle");
			String freeboardcontent = request.getParameter("freeboardcontent");
			
			FreeBoardDto dto = new FreeBoardDto(freeboardseq, null, freeboardtitle, freeboardcontent, null, 0);
			
			int res = biz.update(dto);
			
			if(res > 0) {
				response.sendRedirect("free.do?command=select&freeboardseq="+freeboardseq);
			} else {
				response.sendRedirect("free.do?command=updateform&freeboardseq="+freeboardseq);
			}
			
		} else if(command.equals("delete")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			int res = biz.delete(freeboardseq);
			
			if(res > 0 ) {
				dispatch(request, response, "free.do?command=list");
			} else {
				dispatch(request, response, "free.do?command=select&freeboardseq="+freeboardseq);
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
