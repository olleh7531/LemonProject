package com.lemon.Good.Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LemonGoodController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 223168621298841744L;

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("/GoodMusicAction.go")) {
			action = new GoodMusicAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) { // 이동할 정보가 있으면
			// 이동방식 따른 페이지 이동
			if (forward.isRedirect()) {// true
				response.sendRedirect(forward.getPath());
			} else {// false
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
