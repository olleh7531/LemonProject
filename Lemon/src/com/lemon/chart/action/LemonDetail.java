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
		// ./LemonDetai.ct?mu_num=<%=cb.getMu_num()%>pageNum=<%=pageNum%>

		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		String pageNum = request.getParameter("pageNum");

		System.out.println("글 번호 : " + mu_num);
		System.out.println("페이지 : " + pageNum);

		ChartDAO cdao = new ChartDAO();
		ChartBean cb = cdao.selectMusizDetail(mu_num);

		System.out.println("이름 : " + cb.getAl_name());

		String name = cb.getAl_name();

		ArrayList<ChartBean> MusizList = cdao.DetailMusizName(name);

		request.setAttribute("cb", cb);
		request.setAttribute("MusizList", MusizList);

		ActionForward forward = new ActionForward();
		forward.setPath("./chart/chart_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
