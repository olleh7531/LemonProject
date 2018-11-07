package com.lemon.Good.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.Good.db.GoodDAO;

public class GoodMusicAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("GoodMusicAction execute()!!!!!!!!!!!!~~~~~~~~~");

		System.out.println(request.getParameter("go_num"));

		int go_text_num = Integer.parseInt(request.getParameter("go_num"));
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (user == null) {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<script>");
			out.println(" alert('로그인이 해주세요. ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			return null;
		}

		GoodDAO gdao = new GoodDAO();
		int check = gdao.MusicGoodUp(go_text_num, user);
		System.out.println("check :  " + check);

		out.println(check);

		return null;
	}

}
