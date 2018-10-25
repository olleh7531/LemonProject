package com.lemon.notice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;
import com.lemon.notice.db.NoticeDAO;

public class NoticeInitAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeInitAction execute");
		
		NoticeDAO ndao = new NoticeDAO();
		
		int count = ndao.getNoticeCount();
		int pageSize = 15;
		String pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		List<NoticeBean> noticeList = ndao.getNoticeList(startRow, pageSize);
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageBlock = 10;
		// 시작페이지 번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		String category = "분류";
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("category", category);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/notice.jsp");
		forward.setRedirect(false);
		System.out.println("NoticeInitAction execute 끝");
		
		return forward;
	}
}