package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LemonLatest_Chart implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonLatest_Chart execute()!!!");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./cahart/latest_chart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
