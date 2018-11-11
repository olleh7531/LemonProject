package com.lemon.chart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartDAO;

public class AlbumList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AlbumList execute()!!!!!!!!");
		
		ChartDAO cdao = new ChartDAO();
		
		int count = cdao.getChartCount();
		
		int pageSize = 20;
		
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		
		int endRow = currentPage * pageSize;
		
		ArrayList<ChartBean> albumList = cdao.selectalbumList(startRow, pageSize);

		ActionForward forward = new ActionForward();
		forward.setPath("./chart/albumList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
