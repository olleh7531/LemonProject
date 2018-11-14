package com.lemon.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.main.db.MainDAO;
import com.lemon.main.db.SearchChartBean;



public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		MainDAO mdao = new MainDAO(); 
		List<SearchChartBean> realtime = mdao.realTimeRising();
		
		request.setAttribute("realtime", realtime);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
