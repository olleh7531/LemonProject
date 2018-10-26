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
		// http://localhost:8088/Lemon/index.me
		
		// /Lemon/index.me
		String requestURI = request.getRequestURI();
		System.out.println("StarPostFrontController : requserURI : " + requestURI);

		// /Lemon
		String contextPath = request.getContextPath();
		System.out.println("StarPostFrontController : contextPath : " + contextPath);

		// /index.me
		String command = requestURI.substring(contextPath.length());
		System.out.println("StarPostFrontController : command : " + command);

		// ActionForward (이동정보 - 페이지, 방법)
		Action action = null;
		ActionForward forward = null;

		// 가상주소와 내가 처리할 동작이랑 같은지 비교 
		// 스타포스트
		if (command.equals("")) {
			
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