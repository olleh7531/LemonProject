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

		if(command.equals("/ArtistChanel.ac")) {
			// level값 체크 -> 1이면 관리자 페이지
			// 				-> 0이면 일반 화면 보기
			action = new ArtistChanelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/AdminArtistChanelInfo.ac")) {
			// 정보 글쓰기
			forward = new ActionForward();
			forward.setPath("./ArtistChanel.ac?artist=1");
			forward.setRedirect(true);
		}
		else if(command.equals("/ArtistChanelInfoWrtieAction.ac")) {
			// 정보 글쓰기 proc 
			action = new ArtistChanelInfoWrtieAction(); 
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/AdminArtistChanelPhoto.ac")) {
			// 포토 글쓰기
			forward = new ActionForward();
			forward.setPath("./starpost/adminArtistChanelPhoto.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/ArtistChanelPhotoWrtieAction.ac")) {
			// 포토 글쓰기 proc 
			action = new ArtistChanelPhotoWriteAction(); 
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ArtistChanelPhotoWrtieCheckAction.ac")) {
			// 포토 글쓰기 -> 가수 번호 체크해서 가수 이름 / 그룹 이름 가져오기
			action = new ArtistChanelPhotoWriteCheckAction(); 
			
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