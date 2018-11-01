package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;

public class GoogleLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email_id = request.getParameter("email_id");
		String name = request.getParameter("name");
		
		System.out.println("email_id는 "+ email_id);
		System.out.println("name은 " + name);
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.idCheck(email_id);
		System.out.println(check);
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		session.setAttribute("email_id", email_id);
		session.setAttribute("name", name);
		
		// 아이디가 가입되어 있으면 check = 1
		// -> 로그인
		if(check == 1) {
			forward.setPath("main.mi");
			forward.setRedirect(true);
		}
		
		// 아이디가 가입되어 있지 않으면 check = 0
		// -> 추가 정보를 입력해야함
		if(check == 0) {
			forward.setPath("MemberJoin.mb?email_id="+email_id+"&name="+name);
			forward.setRedirect(false);
		}
		return forward;
	}
}