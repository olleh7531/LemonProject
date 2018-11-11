package com.lemon.search.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.search.db.SearchDAO;

public class SearchResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SearchResultAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		int check = 0;
		
		// 게시판 글 목록 디비에서 가져옴 -> view(jsp)페이지로 전달
		SearchDAO sdao = new SearchDAO();
		
		// 게시판 전체 글 개수 확인
		int count = sdao.getSearchResultCount(search);
		System.out.println("전체 글 개수 : " + count);
		
		/***********************************************************************/
		// 페이징
		// 한 페이지에서 보여줄 글 개수를 설정
		int pageSize = 10;
		// 현재 페이지 위치
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
			check=1;
		}

		// 시작행을 계산하기 1...11...21...31...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행을 계산하기 10..... 20.....30...40...
		int endRow = currentPage * pageSize;
		/***********************************************************************/
		// 전체 글개수 가져오겠음.
		List resultList = sdao.lyricSearch(search,startRow,pageSize,sort);	
		
		System.out.println(resultList.size());
		/***********************************************************************/
		// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌 => 5페이지
		// 게시판 글 77개 , 한페이지에 10개씩 보여줌 => 8페이지( 7+1 )

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 10;
		// 시작페이지 번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		if(check==1){
			
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println(" alert('이메일 계정 로그인 해주세요 ');");
		out.println(" history.back(); ");
		out.println("</script>");
		out.close();								
			
		return null;
		}
		
		
		// request 데이터 저장 
		request.setAttribute("resultList", resultList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);	
		
		// 페이지 이동  ./board/list.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./search/list.jsp");
		forward.setRedirect(false);
		return forward;


	}

}
