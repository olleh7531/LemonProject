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

public class AlbumSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AlbumSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String aa = request.getParameter("aa");
		
		SearchDAO sdao = new SearchDAO();

		int count = sdao.getAlbumResultCount(search);
		System.out.println("전체 글 개수 : " + count);
		
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<SearchBean> album_list = sdao.AlbumSearch(search, startRow, pageSize, sort);
		List<SearchChartBean> searchchart = sdao.getSearchChart(search);
		List<SearchChartBean> popular = sdao.popularSearches();

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		int pageBlock = 10;

		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(aa!=null){		
			JSONArray arr = new JSONArray();	
				
			for(SearchBean sb:album_list){
				JSONObject obj = new JSONObject();
				obj.put("al_num", sb.getAl_num());
				obj.put("al_art_img", sb.getAl_art_img());
				obj.put("al_name", sb.getAl_name());
				obj.put("singer_name", sb.getSinger_name());
				obj.put("al_release", sb.getAl_release().toString());
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

		request.setAttribute("album_list", album_list);
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
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/album.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
