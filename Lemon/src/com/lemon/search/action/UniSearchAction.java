package com.lemon.search.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.SearchChartBean;
import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;
import java.util.List;

public class UniSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UniSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String test = request.getParameter("test");
		HttpSession session = request.getSession();
		String email_id = (String)session.getAttribute("email_id");
		
		SearchDAO sdao = new SearchDAO();
		SearchBean artist_profile = sdao.ArtistProfileSearch(search);
		List<SearchBean> artist_list = sdao.ArtistSearch(search);	
		
		List<SearchBean> song_ar_list = sdao.SongArtistSearch(search);
		List<SearchBean> song_mn_list = sdao.SongMusicNameSearch(search);
		List<SearchBean> song_an_list = sdao.SongAlbumNameSearch(search);
		
		List<SearchBean> album_list = sdao.AlbumSearch(search);
		List<SearchBean> lyric_list = sdao.LyricSearch(search);
		List<SearchChartBean> searchchart = sdao.getSearchChart(search);
		List<SearchChartBean> popular = sdao.popularSearches();
		
		if(test==null && email_id!=null){
			int checkSL = sdao.checkSearchLog(email_id, search);
			if(checkSL != 1){
				String ip ="";
				try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
				    ip = s.next();
				} catch (java.io.IOException e) {
				    e.printStackTrace();
				}
				
				sdao.insertSearchLog(email_id,search,ip);
			}
		}		
		
		request.setAttribute("artist_profile", artist_profile);		
		request.setAttribute("artist_list", artist_list);
		request.setAttribute("song_ar_list", song_ar_list);
		request.setAttribute("song_mn_list", song_mn_list);
		request.setAttribute("song_an_list", song_an_list);
		request.setAttribute("album_list", album_list);
		request.setAttribute("lyric_list", lyric_list);
		request.setAttribute("searchchart", searchchart);
		request.setAttribute("popular", popular);
		 
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/unisearch.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
