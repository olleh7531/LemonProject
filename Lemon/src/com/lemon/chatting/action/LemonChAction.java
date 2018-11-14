package com.lemon.chatting.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chatting.db.ChattingDAO;
import com.lemon.member.db.MemberDAO;

public class LemonChAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonChAction execute()!!!!!!!");
		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");

		MemberDAO mdao = new MemberDAO();
		String nickname = mdao.getNick(email_id);

		System.out.println("접속자 : " + nickname);

		System.out.println("sender_id : " + request.getParameter("sender_id"));
		System.out.println("receiver_id : " + request.getParameter("receiver_id"));

		String sender = request.getParameter("sender_id");
		String receiver = request.getParameter("receiver_id");

		ChattingDAO cdao = new ChattingDAO();
		int ch_num = cdao.selectCh_Num(sender, receiver);
		System.out.println("채널 : " + ch_num);

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

		request.setAttribute("sender", sender);
		request.setAttribute("receiver", receiver);
		request.setAttribute("ch_num", ch_num);

		ActionForward forward = new ActionForward();
		forward.setPath("./Chatting/chatting.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
