package com.lemon.chatting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chatting.db.ChattingBean;
import com.lemon.chatting.db.ChattingDAO;

public class inputMessageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("inputMessageAction execute()!!!!!!!!!!!");
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String message = request.getParameter("message");
		int channel = Integer.parseInt(request.getParameter("channel"));

		ChattingDAO cdao = new ChattingDAO();
		ChattingBean cb = new ChattingBean();
		cb.setChannel(channel);
		cb.setCon_content(message);
		cb.setCon_receiver(receiver);
		cb.setCon_sender(sender);
		cdao.insertMessage(cb);

		return null;
	}

}
