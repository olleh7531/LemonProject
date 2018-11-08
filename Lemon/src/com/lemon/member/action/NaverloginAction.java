package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.MemberDAO;

public class NaverloginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NaverloginAction execute()~~~~");
		String email = request.getParameter("email");
		System.out.println("email : "+email);
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.chkCheck(email);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		return null;
	}

}
