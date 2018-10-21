package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;


public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction_execute()");

		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");
		String pass = (String) session.getAttribute("pass");

		MemberDAO mdao = new MemberDAO();
		mdao.deleteMember(email_id, pass);

		// 세션 초기화 
		session.invalidate();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" alert('회원탈퇴 되었습니다.');");
		out.println(" location.href='./main.mi';");
		out.println("</script>");
		out.close();

		return null;
	}

}
