package com.lemon.magazine.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardDAO;

public class magazineDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("magazineDeleteAction_execute() 메서드 실행완료");

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO bdao = new BoardDAO();
		bdao.deleteBoard(num);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("  alert('삭제 완료 ');");
		out.println("  location.href='./magazineList.maga?pageNum=" + pageNum + "'; ");
		out.println("</script>");
		out.close();

		return null;
	}

}
