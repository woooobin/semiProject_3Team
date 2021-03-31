package com.poosil.comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.comment.biz.CommentBiz;
import com.poosil.comment.biz.CommentBizImpl;
import com.poosil.comment.dto.CommentDto;

/**
 * Servlet implementation class CommentController
 */
@WebServlet("/comment.do")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CommentBiz biz = new CommentBizImpl();
		String command = request.getParameter("command");
		
		if(command.equals("list")) {
			List<CommentDto> clist = biz.selectList();
			request.setAttribute("clist", clist);
			dispatch(request, response, "freeboard/list.jsp");
			
		} else if (command.equals("insertform")) {
			
			
		} else if (command.equals("updateform")) {
			
			
		} else if (command.equals("delete")) {
			int commentno = Integer.parseInt(request.getParameter("commentno"));
			
			int res = biz.delete(commentno);
			PrintWriter out = response.getWriter();
			if(res > 0) {
				out.println("<script type='text/javascript'>");
				out.println("location.reload();");
				out.println("</script>");
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert('삭제 실패 다시 시도 하세요');");
				out.println("</script>");
			}
			
		} else if(command.equals("aswerproc")) {
			
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
