package com.lemon.search.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchFrontController extends HttpServlet {
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			
		request.setCharacterEncoding("UTF-8");
			
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("test : " + command);
	
		Action action = null;
		ActionForward forward = null;

		
		if (command.equals("/UniSearch.sc")) {
			action = new UniSearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ArtistSearch.sc")) {
			action = new ArtistSearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/SongSearch.sc")) {
			action = new SongSearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/AlbumSearch.sc")) {
			action = new AlbumSearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/LyricSearch.sc")) {
			action = new LyricSearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/TT.sc")) {
			forward = new ActionForward();
			forward.setPath("./search/test.jsp");
			forward.setRedirect(false);
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
