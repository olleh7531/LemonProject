package com.lemon.chart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartDAO;

public class LemonDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonDetail execute()!!!");
		
		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		String pageNum = request.getParameter("pageNum");
		
		ChartDAO cdao = new ChartDAO();
		ChartBean cb = cdao.selectMusizDetail(mu_num);
		System.out.println("ggg : " + cb.getAl_name());
		String name = cb.getAl_name();
		
		ArrayList<ChartBean> MusizList = cdao.DetailMusizName(name);
		ArrayList<ChartBean> ChartList = cdao.GoodList(MusizList);
		
		request.setAttribute("cb", cb);
		request.setAttribute("MusizList", ChartList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./chart/chart_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
