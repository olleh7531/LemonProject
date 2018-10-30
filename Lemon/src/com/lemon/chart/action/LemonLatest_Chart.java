package com.lemon.chart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartDAO;

public class LemonLatest_Chart implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonLatest_Chart execute()!!!");
		
		ChartDAO cdao = new ChartDAO();
		ArrayList<ChartBean> chartList =  cdao.selectChart();
		
		request.setAttribute("chartList", chartList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./cahart/latest_chart.jsp");
		return forward;
	}

}
