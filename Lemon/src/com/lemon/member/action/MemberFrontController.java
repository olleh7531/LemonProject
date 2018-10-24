package com.lemon.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet {
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("test : " + command);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("/MemberJoin.mb")) {
			// System.out.println("회원가입 페이지 이동 ");
			// 페이지 이동 방식

			// 1. response 이동
			// response.sendRedirect("./member/insertForm.jsp");
			// http://localhost:8088/Model2/member/insertForm.jsp

			// 2. forward 이동
			// A 정보를 가지고 => B 이동, 주소줄에는 A의주소, 실제화면 B
			// RequestDispatcher dis =
			// request.getRequestDispatcher("./member/insertForm.jsp");
			// dis.forward(request, response);

			// 이동할 정보를 저장 (이동할 페이지 주소,이동방식)
			// net.member.action -> ActionForward

			// ActionForward()객체 생성
			forward = new ActionForward();
			// 이동할 페이지 정보
			forward.setPath("./member/insertForm.jsp");
			// 이동할 방식
			forward.setRedirect(false);
			
		} else if (command.equals("/MemberJoinAction.mb")) {
			// 회원가입 처리
			action = new MemberJoinAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/MemberLoginAction.mb")){
			// 로그인 처리 
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/MemberLogoutAction.mb")){
			// 로그아웃 처리
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ChooseMemberUpdate.mb")){
			// 회원정보 변경 메뉴 선택
			forward = new ActionForward();
			forward.setPath("./member/chooseMemberUpdate.jsp");
			forward.setRedirect(false);
			
		} else if(command.equals("/MemberUpdate.mb")){
			// 회원정보 변경
			action = new MemberUpdate(); // Action
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/MemberUpdateAction.mb")){	
			// 회원정보 수정 처리
			action = new MemberUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if(command.equals("/MemberDelete.mb")){
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false);			

		} else if(command.equals("/MemberDeleteAction.mb")){
			action = new MemberDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberPassUpdate.mb")){
			forward = new ActionForward();
			forward.setPath("./member/updatePassForm.jsp");
			forward.setRedirect(false);		
			
		} else if(command.equals("/MemberPassUpdateAction.mb")){
			action = new MemberPassUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
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
