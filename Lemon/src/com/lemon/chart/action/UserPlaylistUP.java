package com.lemon.chart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;
import com.mysql.cj.Session;

public class UserPlaylistUP implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("UserPlaylistUP execute()!!!!!!!!!!! ");
		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		System.out.println("mu_num : " + mu_num);

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

		ChartDAO cdao = new ChartDAO();
		int check = cdao.userPlaryList(user, mu_num);
		if (check == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println(" alert(' 있는 노래 입니다. ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('노래 없음');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			return null;
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" alert('추가 되었습니다.');");
		out.println(" history.back(); ");
		out.println("</script>");
		out.close();
		return null;
		/*
		 * ActionForward forward = new ActionForward();
		 * forward.setPath("./LemonLatest_Chart.ct"); forward.setRedirect(true);
		 * return forward;
		 */
	}

}
