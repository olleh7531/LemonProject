package com.lemon.notice.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.notice.db.NoticeBean;
import com.lemon.notice.db.NoticeDAO;

public class NoticeListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeListAction execute!");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 게시판 글 목록 디비에서 가져옴 -> view(jsp)페이지로 전달
		NoticeDAO ndao = new NoticeDAO();
		
		String category = request.getParameter("category");
		
		if(category == null) {
			category = "분류";
		}
		
		// 게시판 전체 글 개수 확인
		int count = ndao.getNoticeCount(category);
		/***********************************************************************/
		
		// 페이징
		// 한 페이지에서 보여줄 글 개수를 설정
		int pageSize = 15;
		// 현재 페이지 위치
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 시작행을 계산하기 1...11...21...31...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 끝행을 계산하기 10..... 20.....30...40...
		// int endRow = currentPage * pageSize;
		
		/***********************************************************************/
		
		// 전체 글 개수 가져오기
		List<NoticeBean> noticeList = ndao.getNoticeList(startRow, pageSize, category);
		
		PrintWriter out = response.getWriter();
		
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
		
		// request 데이터 저장
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("category", category);
		
		for(int i=0 ; i<noticeList.size() ; i++) {
			NoticeBean nb = noticeList.get(i);
			String result =
					"<tr>"+
						"<td>"+nb.getNo_num()+"</td>"+
						"<td>"+nb.getNo_category()+"</td>"+
						"<td id='subject'>"+
						"<a href='./noticeContent.nt?num="+nb.getNo_num()+"&pageNum="+pageNum+"'>"+nb.getNo_subject()+"</a>"+
						"</td>"+
						"<td>"+nb.getNo_readcount()+"</td>"+
						"<td><div class='wrap'>"+nb.getNo_reg_date()+"</div></td>"+
					"</tr>";
			out.print(result);
		}
		
		/***********************************************************************/
				
		return null;
	}
}