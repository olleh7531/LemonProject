package com.lemon.MusicComment.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.MusicComment.db.MusicCommentBean;
import com.lemon.MusicComment.db.MusicCommentDAO;

public class MusicCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" MusicCommentAction execute()!!!!!!!!!!!! ");

		String comment = request.getParameter("comment");
		//System.out.println("comment : " + comment);
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");
		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		String ip = request.getRemoteAddr();
		MusicCommentDAO mcdao = new MusicCommentDAO();
		int check = mcdao.MusicComment(mu_num, comment, user, ip);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println(check);
		out.close();
		return null;
	}

}
