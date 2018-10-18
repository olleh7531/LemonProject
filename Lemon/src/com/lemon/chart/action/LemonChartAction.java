package com.lemon.chart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartDAO;

public class LemonChartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonChart_execute()");


		ActionForward forward = new ActionForward();

		
		// ChartDAO 객체 생성 -> 메서드 getChart(id) -> 차트정보를 가져오기(JavaBean)
		ChartDAO cdao = new ChartDAO();
		List<ChartBean> list = cdao.getMuReadCount();
		ChartBean cb = new ChartBean();
		
		
		// 차트정보를 request 객체에 저장 ,페이지 이동 (./board/lemonChart.jsp)-Actionforward
		request.setAttribute("cb", cb);
		
		forward.setPath("./board/lemonChart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
