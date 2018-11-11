package com.lamon.musicplayer.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MusicPlayerFrontController extends HttpServlet {

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);

		Action action = null;
		ActionForward forward = null;

		// if (command.equals("/LemonPlayerList.mp")) {
		// forward = new ActionForward();
		// forward.setPath("./player/musicplayer.jsp");
		// forward.setRedirect(false);
		// } else if (command.equals("/LemonPlayerListAction.mp")) {
		// action = new LemonPlayerListAction();
		//
		// try {
		// forward = action.execute(request, response);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// }

		if (command.equals("/LemonPlayerList.mp")) {
			action = new LemonPlayList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (command.equals("/LemonPlayer.mp")) {
			action = new LemonPlayer();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (forward != null) {
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
