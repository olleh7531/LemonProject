package com.lemon.chart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartDAO;

public class rankingupdate implements Action{
	
@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	ChartDAO cdao = new ChartDAO();
	cdao.rankingupdate();
	System.out.println("xxxxxx");
	ActionForward forward = new ActionForward();
	forward.setPath("./board/rankingup.jsp");
	forward.setRedirect(false);
	return forward;
	}

}
