package com.lemon.magazine.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MagazineFrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);

		ActionForward forward = null;
		Action action = null;

		if (command.equals("/magazineBoardWrite.maga")) {
			forward = new ActionForward();
			forward.setPath("./magazine/write.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/magazineBoardWriteAction.maga")) {
			action = new magazineBoardWriteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/magazineList.maga")) {
			action = new magazineList();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/magazineth.maga")){
			action = new magazinethAction();
			
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/magazineContent.maga")){
			action = new magazineContentAction(); 
			
			try{
				forward = action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/magazineUpdate.maga")){
			// action
			// BoardUpdate 객체생성 execute()
			
			action = new magazineUpdate();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/magazineUpdateAction.maga")){
			action = new magazineUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}  else if(command.equals("/magazineDeleteAction.maga")){
			action = new magazineDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
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
