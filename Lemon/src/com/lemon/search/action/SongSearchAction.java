package com.lemon.search.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.chart.db.SearchChartBean;
import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;

public class SongSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SongSearchAction_execute!");
		
		String search = request.getParameter("search");
		String stateCategory = request.getParameter("stateCategory");
		String sort = request.getParameter("sort");
		
		SearchDAO sdao = new SearchDAO();
		List<SearchBean> song_list = new ArrayList();
		List<SearchChartBean> searchchart = sdao.getSearchChart(search);
		List<SearchChartBean> popular = sdao.popularSearches();
		
		if(stateCategory == null){
			song_list = sdao.SongArtistSearch(search);
		}else if(stateCategory.equals("artist")){
			song_list = sdao.SongArtistSearch(search);
		}else if(stateCategory.equals("musicname")){
			song_list = sdao.SongMusicNameSearch(search);
		}else if(stateCategory.equals("albumname")){
			song_list = sdao.SongAlbumNameSearch(search);
		}
		
		if(stateCategory != null){		
			JSONArray arr = new JSONArray();	
				
			for(SearchBean sb:song_list){
				JSONObject obj = new JSONObject();
				
				obj.put("music_name", sb.getMusic_name());
				obj.put("singer_name", sb.getSinger_name());
				obj.put("al_name", sb.getAl_name());
				obj.put("al_release", sb.getAl_release().toString());

				arr.add(obj);
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(arr);
			out.close();								
			
			return null;
		}
				
		request.setAttribute("song_list", song_list);		
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);
		request.setAttribute("searchchart", searchchart);
		request.setAttribute("popular", popular);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/song.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
