package com.lemon.magazine.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;

public class magazineBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("magazineBoardWriteAction execute()!!!");
		request.setCharacterEncoding("UTF-8");
		
		BoardBean bb = new BoardBean();
		//bb.setMa_num(Integer.parseInt(request.getParameter("ma_num")));
		bb.setMa_subject(request.getParameter("ma_subject"));
		bb.setMa_category(request.getParameter("ma_category"));
		bb.setMa_content(request.getParameter("ma_content"));
		
		//System.out.println(request.getParameter("ma_num"));
		System.out.println(request.getParameter("ma_subject"));
		System.out.println(request.getParameter("ma_category"));
		System.out.println(request.getParameter("ma_content"));
		
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main.mi");
		forward.setRedirect(true);
		
		return forward;
	}

}
