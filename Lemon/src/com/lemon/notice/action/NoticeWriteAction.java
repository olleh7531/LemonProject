package com.lemon.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;

public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeWriteAction execute()");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// 게시판 글정보를 저장하는 객체 (BoardBean)
		NoticeBean bb = new NoticeBean();
		
		/*bb.setName(request.getParameter("name"));
		bb.setPass(request.getParameter("pass"));
		bb.setSubject(request.getParameter("subject"));
		bb.setContent(request.getParameter("content"));
		bb.setIp(request.getRemoteAddr());
		
		// 게시판에 글쓰는(DB에 저장) 객체 (BoardDAO)
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bb);*/
		
		// 이동준비   ./BoardList.bo		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);		
		return forward;
	}
}