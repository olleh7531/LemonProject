package com.lamon.musicplayer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lamon.musicplayer.db.MusicPlayerBean;
import com.lamon.musicplayer.db.MusicPlayerDAO;

public class LemonPlayer implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonPlayer execute()!!!!");

		int musicNum = Integer.parseInt(request.getParameter("musicNum"));
		int album = Integer.parseInt(request.getParameter("album"));

		MusicPlayerDAO mpdao = new MusicPlayerDAO();

		MusicPlayerBean mpb = mpdao.lemonPlayer(musicNum, album);
		request.setAttribute("mpb", mpb);

		ActionForward forward = new ActionForward();
		forward.setPath("./player/player.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
