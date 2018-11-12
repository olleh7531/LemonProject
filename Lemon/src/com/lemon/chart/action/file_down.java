package com.lemon.chart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;

public class file_down implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("file_down execute()!!!!!!!!!!!");
		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
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
		String fileName = cdao.DownLoad(mu_num);
		System.out.println("fileName : " + fileName);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(fileName);

		return null;
	}

}
