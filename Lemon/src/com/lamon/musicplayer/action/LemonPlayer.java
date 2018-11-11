package com.lamon.musicplayer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LemonPlayer implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonPlayer execute()!!!!");
		ActionForward forward = new ActionForward();
		forward.setPath("./player/player.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
