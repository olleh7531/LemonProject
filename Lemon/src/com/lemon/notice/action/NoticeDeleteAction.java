package com.lemon.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeDAO;

public class NoticeDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDeleteAction execute");
		
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDAO ndao = new NoticeDAO();
		ndao.deleteNotice(num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./noticeInit.nt");
		forward.setRedirect(true);
		return forward;
	}
}