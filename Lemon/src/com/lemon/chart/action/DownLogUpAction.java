package com.lemon.chart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;

public class DownLogUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		String musicfile = request.getParameter("musicfile");
		
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
		String ip ="";
		try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
		    ip = s.next();
		} catch (java.io.IOException e) {
		    e.printStackTrace();
		}
		int check = cdao.insertDownloadlog(user, musicfile,ip);


		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(check);
		out.close();
		return null;
	}

}
