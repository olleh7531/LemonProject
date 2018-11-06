package com.lemon.chart.action;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartBean1;
import com.lemon.chart.db.ChartDAO;

public class LemonChartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonChart_execute()");
		String daytime = request.getParameter("dayTime");
		if(daytime==null){
			Date date = new Date();
			daytime=date.toString().substring(date.toString().indexOf(":")-2,date.toString().indexOf(":"));
		}
		int daytimex = Integer.parseInt(daytime);

		ActionForward forward = new ActionForward();

		
		// ChartDAO 객체 생성 -> 메서드 getChart(id) -> 차트정보를 가져오기(JavaBean)
		ChartDAO cdao = new ChartDAO();
		List<ChartBean1> list = cdao.getChart(daytimex);
		
		
		// 차트정보를 request 객체에 저장 ,페이지 이동 (./board/lemonChart.jsp)-Actionforward
		request.setAttribute("list", list);
		
		forward.setPath("./board/lemonChart.jsp?dayTime="+daytime+"");
		forward.setRedirect(false);
		return forward;
	}

}
