package com.lemon.search.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;

public class UniSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UniSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String test = request.getParameter("test");

		HttpSession session = request.getSession();
		String email_id = (String)session.getAttribute("email_id");
		
		System.out.println("test null?"+test);
		
		SearchDAO sdao = new SearchDAO();	
		List<SearchBean> song_ar_list = sdao.SongArtistSearch(search);
		List<SearchBean> song_mn_list = sdao.SongMusicNameSearch(search);
		List<SearchBean> song_an_list = sdao.SongAlbumNameSearch(search);
		List<SearchBean> album_list = sdao.AlbumSearch(search);
		
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
		
		
		
		request.setAttribute("song_ar_list", song_ar_list);
		request.setAttribute("song_mn_list", song_mn_list);
		request.setAttribute("song_an_list", song_an_list);
		request.setAttribute("album_list", album_list);
		
		
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/unisearch.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
