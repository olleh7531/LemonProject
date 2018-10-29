package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LemonDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonDetail execute()!!!");

		ActionForward forward = new ActionForward();
		forward.setPath("./cahart/chart_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
