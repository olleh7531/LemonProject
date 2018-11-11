package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PlayLogUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");
		String file = request.getParameter("musicfile");
		//라이브러리에서에 있는 music_file
		
		return null;
	}

}
