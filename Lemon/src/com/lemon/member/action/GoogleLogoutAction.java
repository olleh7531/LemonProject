package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoogleLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("GoogleLogoutAction execute()");
		
		// 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// "로그아웃" 메시지, main.me 페이지 이동 (자바스크립트)
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" alert('?');");
		out.println(" location.href='https://accounts.google.com/Logout'");
		/*out.println(" location.href='./main.mi'");*/
		out.println("</script>");
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.mi");
		forward.setRedirect(false);
		
		return forward;
	}
}