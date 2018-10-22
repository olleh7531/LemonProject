package com.lemon.admin.starpost.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AStarPostFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 가상주소 가져오기
		String requestURI = request.getRequestURI();
		System.out.println("StarPostFrontController : requserURI : " + requestURI);

		String contextPath = request.getContextPath();
		System.out.println("StarPostFrontController : contextPath : " + contextPath);

		String command = requestURI.substring(contextPath.length());
		System.out.println("StarPostFrontController : command : " + command);

		Action action = null;
		ActionForward forward = null;

		// 가상주소 비교
		// 아티스트 채널 관리자 화면
		if (command.equals("/adminArtistChanel.asp")) { // 아티스트 채널 관리자 글쓰기 모드
			// starPost/artist_chanel_admin.jsp
			forward = new ActionForward();
			forward.setPath("./starPost/artist_chanel_admin.jsp");
			forward.setRedirect(false);
		}

		// 이동
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());

				dis.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}