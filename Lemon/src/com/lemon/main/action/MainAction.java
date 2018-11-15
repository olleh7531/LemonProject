package com.lemon.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.main.db.MainDAO;
import com.lemon.main.db.SearchChartBean;



public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Object minute = request.getParameter("minute");
		if(minute==null){
			minute=10;
		}
		int min=(int)minute;
		MainDAO mdao = new MainDAO(); 
		List<SearchChartBean> realtime = mdao.realTimeRising(min);
		
		session.setAttribute("realtime", realtime);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
