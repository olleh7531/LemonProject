package com.lemon.chatting.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;

public class LemonChattingAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" LemonChattingAction execute() ");
		
		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");
		
		MemberDAO mdao = new MemberDAO();
		String nickname = mdao.getNick(email_id);
		
		System.out.println("접속자 : " + nickname);
		
		if (nickname == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('로그인을 해주세요. ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Chatting/ChattingView.jsp?nickname="+nickname);
		forward.setRedirect(false);
		return forward;
	}
}