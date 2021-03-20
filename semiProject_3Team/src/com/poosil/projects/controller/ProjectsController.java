package com.poosil.projects.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.projects.biz.ProjectsBiz;
import com.poosil.projects.biz.ProjectsBizImpl;
import com.poosil.projects.dto.ProjectDto;

/**
 * Servlet implementation class ProjectsController
 */
@WebServlet("/project.do")
public class ProjectsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProjectsController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String command = request.getParameter("command");

		ProjectsBiz biz = new ProjectsBizImpl();
		
		if (command.equals("selectList")) {
			List<ProjectDto> list = biz.selectList();
			
			System.out.println(list);
			request.setAttribute("list", list);
			dispatch(request, response, "project_list.jsp");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	protected void dispatch(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);

		dispatch.forward(request, response);
	}
}
