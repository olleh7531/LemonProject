package com.lemon.chart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;

public class DownLogUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");
		if (user == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("2");
			out.close();
			return null;
		}
		
		ChartDAO cdao = new ChartDAO();
		int check = cdao.insertDownloadlog(user, mu_num);


		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		out.close();
		return null;
	}

}
