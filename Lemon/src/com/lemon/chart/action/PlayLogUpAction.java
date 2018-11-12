package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;

public class PlayLogUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");
		String file = request.getParameter("musicfile");
		String ip ="";
		try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
		    ip = s.next();
		} catch (java.io.IOException e) {
		    e.printStackTrace();
		}
		ChartDAO cdao = new ChartDAO();
		cdao.insertPlaylog(email_id, file, ip);
		//라이브러리에서에 있는 music_file
		
		return null;
	}

}
