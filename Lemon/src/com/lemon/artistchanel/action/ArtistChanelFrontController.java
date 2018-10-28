package com.lemon.artistchanel.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtistChanelFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 가상주소 가져오기
		// http://localhost:8088/Lemon/index.me
		
		// /Lemon/index.me
		String requestURI = request.getRequestURI();
		System.out.println("ArtistChanelFrontController : requserURI : " + requestURI);

		// /Lemon
		String contextPath = request.getContextPath();
		System.out.println("ArtistChanelFrontController : contextPath : " + contextPath);

		// /index.me
		String command = requestURI.substring(contextPath.length());
		System.out.println("ArtistChanelFrontController : command : " + command);

		// ActionForward (이동정보 - 페이지, 방법)
		Action action = null;
		ActionForward forward = null;

		// 가상주소와 내가 처리할 동작이랑 같은지 비교 
		// 아티스트 채널 관리자 화면
		if (command.equals("/ArtistChanelInfoWrite.ac")) { // 아티스트 채널 정보 글쓰기
			// 페이지 이동 방식
			// 1. response 이동
			// response.sendRedirect("./member/insertForm.jsp");
			// http://localhost:8088/Model2/member/insertForm.jsp
			
			// 2. forward 이동 
			// A 정보를 가지고  => B 이동, 주소줄에는 A의주소, 실제화면 B
			// RequestDispatcher dis =
			// request.getRequestDispatcher("./member/insertForm.jsp");
			// dis.forward(request, response);
			
			// 이동할 정보를 저장 (이동할 페이지 주소,이동방식)
			// net.member.action -> ActionForward
			
			// ActionForward()객체 생성
			// starPost/adminArtistChanelInfoWrite.jsp
			forward = new ActionForward();
			forward.setPath("./starpost/adminArtistChanelInfo.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/ArtistChanelWrtieAction.ac")) {
			// 아티스트 채널 정보 글쓰기 proc 
			action = new ArtistChanelWrtieAction(); 
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ArtistChanel.ac")) {
			// 아티스트 채널 내용
			action = new ArtistChanelAction(); 
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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