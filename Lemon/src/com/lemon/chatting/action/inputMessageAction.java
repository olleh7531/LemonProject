package com.lemon.chatting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class inputMessageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("inputMessageAction execute()!!!!");
		System.out.println("sender : " + request.getParameter("sender"));
		System.out.println("receiver : " + request.getParameter("receiver"));
		System.out.println("Message : " + request.getParameter("Message"));
		return null;
	}

}
