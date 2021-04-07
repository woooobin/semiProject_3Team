package com.poosil.projects.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.projects.biz.RankBiz;
import com.poosil.projects.biz.RankBizImpl;
import com.poosil.projects.dto.ProjectDto;

@WebServlet("/rank.do")
public class RankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RankController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
 		String command = request.getParameter("command");
		RankBiz biz = new RankBizImpl();
		
		if(command.equals("selectAll")) {
			List<ProjectDto> topLikeList = biz.selectTopLike();
			List<ProjectDto> topPriceList = biz.selectTopPrice();
			List<Integer> topCategoryList = biz.selectTopCategoryCount();
			List<String> topCategoryNameList = biz.selectTopCategoryName();
			
			request.setAttribute("topLikeList", topLikeList);
			request.setAttribute("topCategoryList", topCategoryList);
			request.setAttribute("topPriceList", topPriceList);
			request.setAttribute("topCategoryNameList", topCategoryNameList);
			
			dispatch(request, response, "rank.jsp");			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void dispatch(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);

		dispatch.forward(request, response);
	}

}
