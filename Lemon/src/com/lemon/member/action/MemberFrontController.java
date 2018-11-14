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

		request.setCharacterEncoding("UTF-8");

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

		} else if (command.equals("/MemberSendJoinMailAction.mb")) {
			// 회원가입 메일 보내기 처리
			action = new MemberSendJoinMailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberJoinAuthAction.mb")) {
			// 회원가입 메일 인증 처리
			action = new MemberJoinAuthAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberJoinWelcome.mb")) {
			// 가입 환영 페이지
			forward = new ActionForward();
			forward.setPath("./member/joinComplete.jsp");
			forward.setRedirect(true);

		} else if (command.equals("/MemberLoginAction.mb")) {
			// 로그인 처리
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberLogoutAction.mb")) {
			// 로그아웃 처리
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ChooseMemberUpdate.mb")) {
			// 회원정보 변경 메뉴 선택
			forward = new ActionForward();
			forward.setPath("./member/chooseMemberUpdate.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/MemberUpdate.mb")) {
			// 회원정보 변경
			action = new MemberUpdate(); // Action

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberUpdateAction.mb")) {
			// 회원정보 수정 처리
			action = new MemberUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberDelete.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/MemberDeleteAction.mb")) {
			action = new MemberDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberPassUpdate.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/updatePassForm.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/MemberPassUpdateAction.mb")) {
			action = new MemberPassUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberFind.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/findForm.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/IdFindChk.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/findCheck.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/MemberPwFind.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/findPwForm.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/PwFindChk.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/findPwCheck.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/GoogleLoginAction.mb")) {
			action = new GoogleLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberFriend.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/memberFriend.jsp");
			forward.setRedirect(false);
			
		} else if (command.equals("/AddFriend.mb")) {
			action = new AddFriendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/FriendSearch.mb")) {
			action = new FriendSearch();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/requestFriend.mb")) {
			action = new requestFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/acceptionFriend.mb")) {
			action = new acceptionFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/refuseFriend.mb")) {
			action = new refuseFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/InfoFriend.mb")) {
			action = new infoFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/deleteFriend.mb")) {
			action = new deleteFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/ChattingFriend.mb")) {
			action = new chatFriend();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/NicknameCheck.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/checkNick.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/CallbackNaver.mb")) {
			forward = new ActionForward();
			forward.setPath("./member/callbackNaver.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/NaverloginAction.mb")) {
			action = new NaverloginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NaverJoin.mb")) {
			// 회원정보 변경 메뉴 선택
			forward = new ActionForward();
			forward.setPath("./member/naverInsertForm.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/NaverJoinAction.mb")) {
			// 회원가입 처리
			action = new NaverJoinAction();

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