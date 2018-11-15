package com.lemon.chart.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.chart.db.ChartBean;
import com.lemon.chart.db.ChartBean1;
import com.lemon.chart.db.ChartDAO;

public class LemonLatest_Chart implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonLatest_Chart execute()!!!"); 
		ChartDAO cdao = new ChartDAO();

		// 게시판 전체 글 개수 확인
		int count = cdao.getChartCount();

		// 한 페이지에서 보여줄 글 개수를 설정
		int pageSize = 50;
		// 현재 페이지 위치
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 시작행을 계산하기 1...11...21...31...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행을 계산하기 10..... 20.....30...40...
		int endRow = currentPage * pageSize;

		/***********************************************************************/
		// 전체 글개수 가져오겠음.
		ArrayList<ChartBean> chartList = cdao.selectChart(startRow, pageSize);
		ArrayList<ChartBean> ChartList = cdao.GoodList(chartList);
		/*
		 * int GoodNum = 0; for (int i = 0; i < chartList.size(); i++) {
		 * ChartBean cb = chartList.get(i);
		 * 
		 * }
		 */
		// request.setAttribute("GoodNum", GoodNum);
		/***********************************************************************/
		// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌 => 5페이지
		// 게시판 글 77개 , 한페이지에 10개씩 보여줌 => 8페이지( 7+1 )
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 10;
		// 시작 페이지 번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		/*최우성*/
		String daytime = request.getParameter("dayTime");
		if (daytime == null) {
			Date date = new Date();
			if(Integer.parseInt(date.toString().substring(date.toString().indexOf(":")+1 , date.toString().indexOf(":")+3))<5){
				daytime = String.valueOf(Integer.parseInt(date.toString().substring(date.toString().indexOf(":") - 2, date.toString().indexOf(":")))-1);
			}else{
				
				daytime = date.toString().substring(date.toString().indexOf(":") - 2, date.toString().indexOf(":"));
			}
				
			
			
		}
		int daytimex = Integer.parseInt(daytime);
		

		// ChartDAO 객체 생성 -> 메서드 getChart(id) -> 차트정보를 가져오기(JavaBean)
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

		List<com.lemon.main.db.ChartBean> Realmusic = cdao.realTimeMusic(daytimex, startRow, pageSize);
		List<com.lemon.main.db.ChartBean> realmusic = cdao.GoodList2(Realmusic);
		request.setAttribute("realmusic", realmusic);
		/*최우성*/
		
//		request.setAttribute("chartList", ChartList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("album", request.getParameter("album"));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./chart/latest_chart.jsp?dayTime=" + daytime + "");
		forward.setRedirect(false);
		return forward;
	}
}