package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogout_execute()");
		
		// 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		// "로그아웃" 메시지, main.me 페이지 이동 (자바스크립트)
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" location.href='./index.html'");
		out.println("</script>");
		return null;
	}
}