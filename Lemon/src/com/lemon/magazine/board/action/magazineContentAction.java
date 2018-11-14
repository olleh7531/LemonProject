package com.lemon.magazine.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;

public class magazineContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("magazineContentAction_execute()!");

		// num, pageNum 파라미터값 저장
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		// 디비 처리 객체 생성
		BoardDAO bdao = new BoardDAO();

		// 조회수 증가
		bdao.updateReadcount(num);

		// 해당 번호의 정보를 DB에서 가져오기
		BoardBean bb = bdao.getBoard(num);

		// 저장
		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);

		// 페이지 이동 content.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./magazine/content.jsp");
		forward.setRedirect(false);

		return forward;

	}

}
