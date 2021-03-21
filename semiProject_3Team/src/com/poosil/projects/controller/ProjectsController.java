package com.poosil.projects.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.poosil.projects.biz.ProjectsBiz;
import com.poosil.projects.biz.ProjectsBizImpl;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

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
			request.setAttribute("list", list);
			dispatch(request, response, "project_list.jsp");
			
		}else if(command.equals("insertProject")) {
			
			String data = request.getParameter("data"); // 데이터 가져온다. 아직 스트링인 상태 
		    
			JsonElement element = JsonParser.parseString(data);// 데이터 파싱 
			JsonObject jsonData = element.getAsJsonObject(); // 파싱된 json을 jsonObject 로 가져옴 

			// =============== 쓸 수 있는 형태로 변환 완료 =============== // 
			
			String projectMainTitle =jsonData.get("projectMainTitle").getAsString();
			String thumbImage = jsonData.get("thumbnailImage").getAsString();
			String goalPrice = jsonData.get("goalPrice").getAsString();
			String projectStartDate = jsonData.get("projectStartDate").getAsString();
			String shippingStartDate = jsonData.get("shippingStartDate").getAsString();
			String projectSubTitle = jsonData.get("projectSubTitle").getAsString();
			String projectCategory = jsonData.get("projectCategory").getAsString();
			String projectEndDate = jsonData.get("projectEndDate").getAsString();
			String detailDesc = jsonData.get("detailDesc").getAsString();
			
			Map<String, Integer> resultMap = biz.insertProject("test1", projectMainTitle, projectSubTitle, thumbImage, goalPrice, projectCategory, projectStartDate, projectEndDate, shippingStartDate,detailDesc);
			
			// ================= end project
			
			// 상품들을 객체 어레이로 가지고 옴
			JsonElement projectItems =  jsonData.get("projectItems");
			// 어레이를 여기에 담아주었다. 
			JsonArray projectItemsArray= projectItems.getAsJsonArray();
			
			
			if(resultMap.get("result")>0) {
				Integer projectId = resultMap.get("projectId");
				System.out.print(projectId);
				System.out.println("db저장 성공 ");
				List<ProjectItemDto> list = new ArrayList<ProjectItemDto>();

				for(int i = 0; i < projectItemsArray.size(); i++) {
					
					String projectItemName = projectItemsArray.get(i).getAsJsonObject().get("projectItemName").getAsString();
					String projectItemDesc =  projectItemsArray.get(i).getAsJsonObject().get("projectItemDesc").getAsString();
					int shippingFee =  projectItemsArray.get(i).getAsJsonObject().get("shippingFee").getAsInt();
					int quantity =  projectItemsArray.get(i).getAsJsonObject().get("quantity").getAsInt();
					String ItemThumbImage =  projectItemsArray.get(i).getAsJsonObject().get("thumbImage").getAsString();

					ProjectItemDto dto = new ProjectItemDto ( 0,projectItemName, projectItemDesc,shippingFee,quantity,ItemThumbImage,projectId );
					
					list.add(dto);
				}
				
				
				int insertProjectItemsRes = biz.insertProjectItems(list);
			
				if(insertProjectItemsRes > 0) {
					System.out.println("projectItems 저장 성공~");
				}else {
					System.out.println("projectItems 저장 실패 ~");
				}
			}else {
				System.out.println("db저장 실패 ");
			}
			
			JsonObject result = new JsonObject();
			result.addProperty("result","성공");

			response.getWriter().append(result + "");
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
