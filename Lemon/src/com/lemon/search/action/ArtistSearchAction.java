package com.lemon.search.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;

public class ArtistSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		SearchDAO sdao = new SearchDAO();

		SearchBean artist_profile = sdao.ArtistProfileSearch(search);
		List<SearchBean> artist_list = sdao.ArtistSearch(search);
		
		request.setAttribute("artist_profile", artist_profile);		
		request.setAttribute("artist_list", artist_list);		
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./search/artist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
