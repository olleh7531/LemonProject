package com.lemon.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;
import com.lemon.notice.db.NoticeDAO;

public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeContentAction execute");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// 디비 처리 객체
		NoticeDAO ndao = new NoticeDAO();
		
		// 1. Content가 호출 -> 해당 글을 open했음 -> 조회수 +1
		ndao.updateReadCount(num);
		
		// 2. 해당 번호 정보를 db에서 가져오기
		NoticeBean nb = ndao.getNotice(num);
		
		// 저장
		request.setAttribute("nb", nb);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동 ./board/content.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/content.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
