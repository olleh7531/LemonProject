package com.lemon.notice.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;
import com.lemon.notice.db.NoticeDAO;

public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdateAction execute");

		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// pageNum 파라미터 저장
		String pageNum = request.getParameter("pageNum");
		
		NoticeBean nb = new NoticeBean();
		
		nb.setNo_subject(request.getParameter("subject"));
		nb.setNo_category(request.getParameter("category"));
		nb.setNo_content(request.getParameter("content"));
		nb.setNo_num(Integer.parseInt(request.getParameter("num")));
		
		NoticeDAO ndao = new NoticeDAO();
		ndao.updateNotice(nb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("  alert('수정성공');");
		out.println("  location.href='./noticeInit.nt?pageNum="+pageNum+"';");
		out.println("</script>");
		out.close();
		
		return null;
	}
}