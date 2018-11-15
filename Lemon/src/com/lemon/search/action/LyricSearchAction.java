package com.lemon.search.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.chart.db.SearchChartBean;
import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;

public class LyricSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LyricSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String test = request.getParameter("test");

		SearchDAO sdao = new SearchDAO();
		List<SearchChartBean> searchchart = sdao.getSearchChart(search);
		List<SearchChartBean> popular = sdao.popularSearches();

		int count = sdao.getLyricResultCount(search);
		System.out.println("전체 글 개수 : " + count);
		
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		
		List<SearchBean> lyric_list = sdao.LyricSearch(search,startRow,pageSize,sort);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 10;
		// 시작페이지 번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(test!=null){
			
		JSONArray arr = new JSONArray();	
				
		for(SearchBean sb:lyric_list){
			
			JSONObject obj = new JSONObject();
			
			obj.put("mu_num", sb.getMu_num());
			obj.put("lyrics", sb.getLyrics());
			obj.put("music_name", sb.getMusic_name());
			obj.put("al_name", sb.getAl_name());
			obj.put("singer_name", sb.getSinger_name());
			arr.add(obj);

		}
			JSONObject obj = new JSONObject();
			obj.put("startPage", startPage);
			obj.put("pageBlock", pageBlock);
			obj.put("endPage", endPage);
			obj.put("pageCount", pageCount);
			arr.add(obj);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(arr);
			out.close();								
			
			return null;
		}
		
		// request 데이터 저장 
		request.setAttribute("lyric_list", lyric_list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);	
		request.setAttribute("searchchart", searchchart);
		request.setAttribute("popular", popular);

		request.setAttribute("search", search);	
		request.setAttribute("sort", sort);
		
		// 페이지 이동  ./board/list.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./search/lyric.jsp");
		forward.setRedirect(false);
		return forward;
	
	}

}
