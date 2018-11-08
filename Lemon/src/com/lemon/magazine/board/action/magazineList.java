package com.lemon.magazine.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;

public class magazineList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("LemonMagazine execute!");
		
		BoardDAO bdao=new BoardDAO();
		
		// 게시판 전체 글 개수 확인
		int count = bdao.getBoardCount();
		
		// 한 페이지에서 보여줄 글 개수를 설정
		int pageSize = 10;
		
		// 현재 페이지 위치
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작행을 계산하기
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)*pageSize+1;
		
		// 끝 행을 계산하기
		int endRow = currentPage * pageSize;
		
		
		// 전체 글 개수 가져옴
		ArrayList<BoardBean> boardList = bdao.selectboardList(startRow, pageSize);
		
		/*		int GoodNum = 0;
		for (int i = 0; i < chartList.size(); i++) {
			ChartBean cb = chartList.get(i);
			
		}*/
//		request.setAttribute("GoodNum", GoodNum);
		/***********************************************************************/
		// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌 => 5페이지
		// 게시판 글 77개 , 한페이지에 10개씩 보여줌 => 8페이지( 7+1 )
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0: 1);
		
		
		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 10;
		
		// 시작페이지 번호
		int startPage = ((currentPage -1) / pageBlock) * pageBlock + 1;
		
		// 끝 페이지 번호
		int endPage = startPage + pageBlock -1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./magazine/main.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
