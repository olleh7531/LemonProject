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
		ChartDAO cdao = new ChartDAO();
		List<SearchChartBean> list = cdao.getSearchChart(search);
		List<SearchChartBean> popular = cdao.popularSearches();
		request.setAttribute("list", list);
		request.setAttribute("popular", popular);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/searchChart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
