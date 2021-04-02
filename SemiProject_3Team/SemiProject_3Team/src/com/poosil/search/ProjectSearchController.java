package com.poosil.search;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/projectsearch.do")
public class ProjectSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		System.out.println("command : " + command);

		// 게시물 리스트
		if (command.equals("list")) {
			ProjectSearchDto projectdto = new ProjectSearchDto();
			ProjectSearchDao projectdao = new ProjectSearchDao();
			
			System.out.println("searchcontroller로 넘어오기");

			String searchOption = request.getParameter("searchOption"); // 검색 옵션
			System.out.println(searchOption);
			String keyword = request.getParameter("keyword"); // 검색어
			System.out.println(keyword);

			System.out.println("옵션:" + searchOption + "키워드:" + keyword);

			List<ProjectSearchDto> list = projectdao.searchList(searchOption, keyword);

			// 데이터를 맵에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list); // list
			map.put("searchOption", searchOption); // 검색 옵션
			map.put("keyword", keyword); // 검색 키워드
			
			System.out.println("map : " + map);

			request.setAttribute("map", map);
			dispatch(request, response, "project_list.jsp");

		} 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
