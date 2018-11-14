package com.lemon.search.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		if(stateCategory == null){
			song_list = sdao.SongArtistSearch(search);
		}else if(stateCategory.equals("artist")){
			song_list = sdao.SongArtistSearch(search);
		}else if(stateCategory.equals("song")){
			song_list = sdao.SongMusicNameSearch(search);
		}else if(stateCategory.equals("album")){
			song_list = sdao.SongAlbumNameSearch(search);
		}
		
		request.setAttribute("song_list", song_list);		
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/artist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
