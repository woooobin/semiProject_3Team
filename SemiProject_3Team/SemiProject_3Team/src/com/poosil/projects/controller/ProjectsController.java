package com.poosil.projects.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.poosil.login.dto.loginDto;
import com.poosil.projects.biz.ProjectsBiz;
import com.poosil.projects.biz.ProjectsBizImpl;
import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

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
		
		
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		ProjectsBiz biz = new ProjectsBizImpl();

		if (command.equals("selectList")) {
			String province = request.getParameter("province");
			String sortOpt = request.getParameter("sortOpt");
			if(sortOpt == null || sortOpt.length() <= 0 ) {
				sortOpt = "LIKECOUNT";
			}
			if(province == null) {
				province = "경기";
			}
			System.out.println(province);
			
			
			List<ProjectDto> list = biz.selectList(province, sortOpt);
			request.setAttribute("list", list);
			dispatch(request, response, "project_list.jsp");

		} else if (command.equals("insertProject")) {

			String data = request.getParameter("data"); // 데이터 가져온다. 아직 스트링인 상태

			JsonElement element = JsonParser.parseString(data);// 데이터 파싱
			JsonObject jsonData = element.getAsJsonObject(); // 파싱된 json을 jsonObject 로 가져옴

			// =============== 쓸 수 있는 형태로 변환 완료 =============== //
			String projectMainTitle = jsonData.get("projectMainTitle").getAsString();
			String thumbImage = jsonData.get("thumbnailImage").getAsString();
			String goalPrice = jsonData.get("goalPrice").getAsString();
			String projectStartDate = jsonData.get("projectStartDate").getAsString();
			String shippingStartDate = jsonData.get("shippingStartDate").getAsString();
			String projectSubTitle = jsonData.get("projectSubTitle").getAsString();
			String projectCategory = jsonData.get("projectCategory").getAsString();
			String projectEndDate = jsonData.get("projectEndDate").getAsString();
			String detailDesc = jsonData.get("detailDesc").getAsString();
			String address = jsonData.get("address").getAsString();
			String latitude = jsonData.get("latitude").getAsString();
			String longitude = jsonData.get("longtitude").getAsString();
			String province = jsonData.get("province").getAsString();


			Map<String, Integer> resultMap = biz.insertProject("test1", projectMainTitle, projectSubTitle, thumbImage,
					goalPrice, projectCategory, projectStartDate, projectEndDate, shippingStartDate, detailDesc,address,latitude,longitude, province);

			// ================= end project

			// 상품들을 객체 어레이로 가지고 옴
			JsonElement projectItems = jsonData.get("projectItems");
			// 어레이를 여기에 담아주었다.
			JsonArray projectItemsArray = projectItems.getAsJsonArray();

			// hashtag들
			List<String> hashtags = new ArrayList<String>();
			if(jsonData.get("hashtags").getAsString().length() > 0) {
				
				hashtags = Arrays.asList(jsonData.get("hashtags").getAsString().split(","));
			}
			
			
		
			JsonObject result = new JsonObject(); //=========== 받는 json 전체를 뜻한다 

			if (resultMap.get("result") > 0) {
				Integer projectId = resultMap.get("projectId");
				// ============= System.out.print(projectId); =============  //
				System.out.println("db저장 성공 ");
				List<ProjectItemDto> list = new ArrayList<ProjectItemDto>();

				for (int i = 0; i < projectItemsArray.size(); i++) {

					String projectItemName = projectItemsArray.get(i).getAsJsonObject().get("projectItemName")
							.getAsString();
					String projectItemDesc = projectItemsArray.get(i).getAsJsonObject().get("projectItemDesc")
							.getAsString();
					int shippingFee = projectItemsArray.get(i).getAsJsonObject().get("shippingFee").getAsInt();
					int quantity = projectItemsArray.get(i).getAsJsonObject().get("quantity").getAsInt();
//					String ItemThumbImage = projectItemsArray.get(i).getAsJsonObject().get("thumbImage").getAsString();
					int price = projectItemsArray.get(i).getAsJsonObject().get("price").getAsInt();
					System.out.println(projectItemName+projectItemDesc+shippingFee + quantity + projectId + price );
					
					
					ProjectItemDto dto = new ProjectItemDto(0, projectItemName, projectItemDesc, shippingFee, quantity, projectId, price);

					list.add(dto);
				}

				int insertProjectItemsRes = biz.insertProjectItems(list);

				if(hashtags.size() > 0) {
					// hashtag가 디비에 들어오게 되면 디비에 업로드 한다. 
					int insertHashtagsRes = biz.insertHashtags(hashtags, projectId);
				}
				
				if (insertProjectItemsRes > 0) {
					System.out.println("projectItems 저장 성공~");
					result.addProperty("result", "success");

				} else {
					System.out.println("projectItems 저장 실패 ~");
					result.addProperty("result", "failed");
				}
			} else {
				System.out.println("db저장 실패 ");
			}

			response.getWriter().append(result + "");

			// =============== end select List ===============//
		} else if (command.equals("selectOne")) {
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			System.out.println("in selectOne" + projectId);
			ProjectDto dto = biz.selectOne(projectId);

			System.out.println("dto = " + dto);
			
			request.setAttribute("projectDto", dto);
			
			List<ProjectItemDto> projectItems = new ArrayList<ProjectItemDto>();
			
			projectItems = biz.selectProjectItems(projectId);
			request.setAttribute("projectItems", projectItems);

			List<HashtagDto> projectHashtags = new ArrayList<HashtagDto>();
			projectHashtags = biz.selectProjectHashtags(projectId);
			
			request.setAttribute("projectHashtags", projectHashtags);
			
			loginDto loginDto = (loginDto)session.getAttribute("dto"); 
			
			if(loginDto != null && loginDto.getUserid() != null ) {		
				
				boolean isLiked = biz.isLiked(projectId,loginDto.getUserid() );
				System.out.println("isLiked = "+isLiked);
				request.setAttribute("isLiked", isLiked);
			}else {
				request.setAttribute("isLiked", false);
			}
			
			dispatch(request, response, "project_selectOne.jsp");
		}else if(command.equals("selectWHashtag")) {
			int hashtagSeq = Integer.parseInt(request.getParameter("hashtagSeq"));
			
			List<ProjectDto> resultList = biz.selectProjectsWithHashtag(hashtagSeq);
			request.setAttribute("projects", resultList);
			
			dispatch(request, response, "project_hashtags.jsp");
			
		}else if(command.equals("projectToggleLike")) {
			
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			String isLiked = request.getParameter("isLiked");
			loginDto loginDto = (loginDto)session.getAttribute("dto"); 
			String userId = loginDto.getUserid();
			int result = 0;
			if(loginDto != null) { //혹시 몰라서 한 번 더 로그인 한 유저 확인 해줌 
				result = biz.projectLike(projectId, userId, isLiked);
			}
			if(result > 0 ) {
				response.sendRedirect("project.do?command=selectOne&projectId="+projectId);
			}
			System.out.println("userId = "+userId);
			
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
