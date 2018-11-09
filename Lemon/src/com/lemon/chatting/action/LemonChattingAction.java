package com.lemon.chatting.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LemonChattingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" LemonChattingAction execute() ");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");
		if (user == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('로그인이 해주세요. ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			return null;
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Chatting/ChattingView.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
