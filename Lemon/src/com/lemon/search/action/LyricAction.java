package com.lemon.search.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.search.db.SearchDAO;



public class LyricAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LemonChart_execute()");
		
		String search = request.getParameter("search");
		String keyword = request.getParameter("keywordLink");
		String sort = request.getParameter("sort");
		SearchDAO sdao = new SearchDAO();
		List list = sdao.lyricSearch(search,sort);
System.out.println("list size" +list.size());
		
		
		
		
		
		ActionForward forward = new ActionForward();



		// 차트정보를 request 객체에 저장 ,페이지 이동 (./board/lemonChart.jsp)-Actionforward
		request.setAttribute("list", list);
		request.setAttribute("search", search);

		forward.setPath("./search/lyric.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
