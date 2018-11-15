package com.lemon.main.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartBean;
import com.lemon.main.db.MainDAO;
import com.lemon.main.db.SearchChartBean;



public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Object minute = request.getParameter("minute");
		MainDAO mdao = new MainDAO(); 
		if(minute==null){
			minute=10;
		}
		int min=(int)minute;
		List<SearchChartBean> realtime = mdao.realTimeRising(min);
		
		Object hour = request.getParameter("hour");
		if(hour==null){
			hour=1;
		}
		int ho=(int)hour;
		List<com.lemon.main.db.ChartBean> realmusic = mdao.realTimeMusic(ho);
		
		
		
		/* 김성일 */
		int num = 6;
		String music_genre = "Ballad";
		String music_genre01 = "Rap / Hip-hop";
		ArrayList<ChartBean> cb = mdao.musicCountList00(music_genre, num);
		ArrayList<ChartBean> cb01 = mdao.musicCountList01(music_genre01, num);

		int countimg = 7;
		ArrayList<ChartBean> listimg = mdao.MusicImgList(countimg);

		request.setAttribute("cb", cb);
		request.setAttribute("cb01", cb01);
		request.setAttribute("listimg", listimg);
		/* 김성일 */

		session.setAttribute("realtime", realtime);
		request.setAttribute("realmusic", realmusic);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
