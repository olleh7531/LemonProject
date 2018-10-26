package com.lemon.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;
import com.lemon.notice.db.NoticeDAO;

public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeWriteAction execute()");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// 게시판 글정보를 저장하는 객체 (BoardBean)
		NoticeBean nb = new NoticeBean();
		
		nb.setNo_category(request.getParameter("category"));
		nb.setNo_subject(request.getParameter("subject"));
		nb.setNo_content(request.getParameter("content"));
		
		// 게시판에 글쓰는(DB에 저장) 객체 (BoardDAO)
		NoticeDAO bdao = new NoticeDAO();
		bdao.insertNotice(nb);
		
		// 이동준비
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeInit.nt");
		forward.setRedirect(true);		
		
		return forward;
	}
}