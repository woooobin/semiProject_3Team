package com.poosil.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/imageUploadbackup.do")
public class ImageUploadBackUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUploadBackUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		// 게시글 원글 등록 처리용 컨트롤러
		
		request.setCharacterEncoding("utf-8");
		// �뾽濡쒕뱶�븷 �뙆�씪�쓽 �슜�웾 �젣�븳 : 10Mbyte濡� �젣�븳�븳�떎硫�

		int maxSize = 1024 * 1024 * 10;

		RequestDispatcher view = null;

		String root = request.getSession().getServletContext().getRealPath("/");
//		System.out.println(root);
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리

		String savePath = root + "image";

		// web/board_upload 濡� 吏��젙�븿
		// request 瑜� MultipartRequest 媛앹껜濡� 蹂��솚�븿

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
//		String originFileName = mrequest.getFilesystemName("upfile");
		
		Enumeration files = mrequest.getFileNames();
		
		String str = (String) files.nextElement(); // �뙆�씪 �씠由꾩쓣 諛쏆븘�� string�쑝濡� ���옣
		String originFileName = mrequest.getFilesystemName(str); // �뾽濡쒕뱶 �맂 �뙆�씪 �씠由� 媛��졇�샂
		
		System.out.println(originFileName);


		JsonObject result = new JsonObject();
		result.addProperty("url", originFileName);

		response.getWriter().append(result + "");
		response.setContentType("text/html; charset=utf-8");

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		// TODO Auto-generated method stub

		doGet(request, response);

	}

}
