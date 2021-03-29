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


@WebServlet("/project.do")
public class ProjectSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	String command = request.getParameter("command");
	System.out.println("command : " + command);
	
	ProjectSearchDao projectdao = new ProjectSearchDao();
	
	// 게시물 리스트
	if (command.equals("list")) {
		System.out.println("searchcontroller로 넘어오기");
		
		String searchOption = request.getParameter("searchOption");				// 검색 옵션
		String keyword = request.getParameter("keyword");						// 검색어
		int currPage = Integer.parseInt(request.getParameter("currPage"));		// 페이지
		
		System.out.println("옵션:"+searchOption+"키워드:"+keyword+"현재페이지:"+currPage);
		
		// 게시물 카운트
		int count = projectdao.listCount(searchOption, keyword);
		System.out.println("글개수:"+count);
		
		// 페이지 나누기 처리
		ProjectPager projectpager = new ProjectPager(count, currPage);
		
		// 페이지당 게시물 수
		int start = projectpager.getPageBegin();
		int end = projectpager.getPageEnd();
		
		List<ProjectSearchDto> list = projectdao.selectList(start, end, searchOption, keyword);
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); 					// list
		map.put("count", count);				// 게시물 갯수
		map.put("searchOption", searchOption);	// 검색 옵션
		map.put("keyword", keyword);			// 검색 키워드
		map.put("projectpager", projectpager);
		
		request.setAttribute("map", map);
		dispatch(request, response, "projectlist.jsp");
	
	}
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
