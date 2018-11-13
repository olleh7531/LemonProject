package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/searchChart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
