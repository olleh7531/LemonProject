package com.lemon.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.MemberDAO;

public class MemberJoinAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoginAuthAction의 execute 호출");
		
		//호출된 페이지에서 code값 받기
		String code = request.getParameter("code");

		//code값 비교 후 해당 회원에 email_cert: 1로 변경
		MemberDAO mdao = new MemberDAO();
		mdao.emailAuth(code);
		
		//가입 환영 페이지 호출
		ActionForward forward = new ActionForward();
		forward.setPath("MemberJoinWelcome.mb");
		forward.setRedirect(true);
		
		return forward;
	}

}
