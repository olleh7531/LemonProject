package com.lemon.search.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UniSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UniSearchAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		
		
		
		
		
		request.setAttribute("search", search);
		request.setAttribute("sort", sort);
		
		
		
		
		return null;
	}

}
