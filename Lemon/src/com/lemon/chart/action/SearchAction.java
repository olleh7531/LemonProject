package com.lemon.chart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartDAO;
import com.lemon.chart.db.SearchChartBean;


public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String search = request.getParameter("search");
		Object minute = request.getParameter("minute");
		if(minute==null){
			minute=10;
		}
		int min=(int)minute;
		ChartDAO cdao = new ChartDAO();
		List<SearchChartBean> searchchart = cdao.getSearchChart(search);
		List<SearchChartBean> popular = cdao.popularSearches();
		List<SearchChartBean> realtime = cdao.realTimeRising(min);
		
		request.setAttribute("searchchart", searchchart);
		request.setAttribute("popular", popular);
		request.setAttribute("realtime", realtime);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/searchChart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
