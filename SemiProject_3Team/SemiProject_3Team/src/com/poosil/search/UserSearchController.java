package com.poosil.search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poosil.login.dao.loginDao;
import com.poosil.login.dto.loginDto;

@WebServlet("/usersearch.do")
public class UserSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

			String username = request.getParameter("username");
			System.out.println("search : " + username);
			
			response.getWriter().write(getJSON(username));
		
		}

	// json 파싱하기
	public String getJSON(String username) {
		if(username == null) username = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		loginDao dao = new loginDao();
		List<loginDto> list = dao.userSearch(username);
		
		for(int i = 0; i < list.size(); i++) {
			result.append("[{\"value\": \"" + list.get(i).getUserid() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getPassword() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUsername() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getAddress() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUserphone() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUseremail() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUserrole() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getAddresslatitude() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getAddresslongitude() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getSellersOpt() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUsernickname() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getAvatar() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getUserenabled() + "\"}],");
		}
		
		result.append("]}");
		
		return result.toString();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
