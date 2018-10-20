package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;

public class MemberPassCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberPassCheckAction_execute()");

		String email_id = request.getParameter("email_id");
		String pass = request.getParameter("pass");
		
		MemberDAO mdao = new MemberDAO();

		int check = mdao.idCheck(email_id, pass);
		// 0 - "비밀번호 오류"
		// -1 - "아이디 없음"
		// 1 - 로그인 
		
		if(check ==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('비밀번호가 맞지 않습니다. 다시 입력해주세요.');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('아이디없음 오류 ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}

		HttpSession session = request.getSession();
		session.setAttribute("email_id", email_id);
		session.setAttribute("pass", pass);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberDelete.mb");
		forward.setRedirect(true);		
		return forward;
	}

}
