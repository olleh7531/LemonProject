package com.lamon.musicplayer.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lamon.musicplayer.db.MusicPlayerBean;
import com.lamon.musicplayer.db.MusicPlayerDAO;

public class LemonPlayList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonPlayList execute()!!!!!!!!!!");
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

		MusicPlayerDAO mdao = new MusicPlayerDAO();
		ArrayList<MusicPlayerBean> arr = mdao.selectPlayerList(user);
//		ArrayList<MusicPlayerBean> mpb01 = null;
//		for (int i = 0; i < arr.size(); i++) {
//			MusicPlayerBean mpb = arr.get(i);
//			mpb01 = mdao.albumImg(mpb.getAlbum_num());
//			request.setAttribute("mpb01", mpb01);
//		}

		request.setAttribute("arr", arr);

		ActionForward forward = new ActionForward();
		forward.setPath("./player/musicplayer.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
