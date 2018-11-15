package com.lemon.chart.action;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartBean1;
import com.lemon.chart.db.ChartDAO;

public class LemonChartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonChart_execute()");
		String daytime = request.getParameter("dayTime");
		if (daytime == null) {
			Date date = new Date();
			daytime = date.toString().substring(date.toString().indexOf(":") - 2, date.toString().indexOf(":"));
		}
		int daytimex = Integer.parseInt(daytime);


		// ChartDAO 객체 생성 -> 메서드 getChart(id) -> 차트정보를 가져오기(JavaBean)
		ChartDAO cdao = new ChartDAO();
		List<ChartBean1> list = cdao.getChart(daytimex);
		List<Double> total = new ArrayList();
		double temp = 0;
		for (int i = 0; i < list.size() / 3; i++) {
			for (int j = i; j < list.size(); j = j + list.size() / 3) {
				temp += (list.get(j).getCh_playcnt() * 4) + (list.get(j).getCh_downcnt() * 6);
			}
			total.add(temp);
			temp = 0;
		}
		List totalarr = new ArrayList();

		for (int i = 0; i < list.size() / 3; i++) {
			for (int j = i; j < list.size(); j = j + list.size() / 3) {
				totalarr.add((int) Math
						.round((((list.get(j).getCh_playcnt() * 4) + (list.get(j).getCh_downcnt() * 6)) / total.get(i))
								* 100));
			}
			temp = 0;
		}
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCh_num((int) totalarr.get(i));
		}

		// 차트정보를 request 객체에 저장 ,페이지 이동 (./board/lemonChart.jsp)-Actionforward
		request.setAttribute("list", list);

		ActionForward forward = new ActionForward();
		forward.setPath("./board/lemonChart.jsp?dayTime=" + daytime + "");
		forward.setRedirect(false);
		return forward;
	}

}
