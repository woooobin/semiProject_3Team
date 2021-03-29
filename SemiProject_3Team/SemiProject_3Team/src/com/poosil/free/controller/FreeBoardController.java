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
		
		FreeBoardBiz biz = new FreeBoardBizImpl();
		String command = request.getParameter("command");
		
		if(command.equals("list")) {
			String userid = request.getParameter("userid");
			List<FreeBoardDto> list = biz.selectList();
			request.setAttribute("list", list);
			dispatch(request, response, "freeboard/list.jsp");
		} else if (command.equals("select")) {
			int freeboardseq = Integer.parseInt(request.getParameter("freeboardseq"));
			String userid = request.getParameter("userid");
			
			FreeBoardDto dto = biz.selectOne(freeboardseq);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "freeboard/select.jsp");
			
		} else if (command.equals("insertform")) {
			dispatch(request, response, "freeboard/insert.jsp");
			
		} else if (command.equals("insertres")) {
			
			
			
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
