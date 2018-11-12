package com.lemon.search.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.MusicComment.db.MusicCommentBean;
import com.lemon.member.db.MemberBean;
import com.lemon.search.db.SearchBean;
import com.lemon.search.db.SearchDAO;

public class SearchResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SearchResultAction_execute!");
		
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
		String test = request.getParameter("test");
		
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
		}

		// 시작행을 계산하기 1...11...21...31...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행을 계산하기 10..... 20.....30...40...
		int endRow = currentPage * pageSize;
		/***********************************************************************/
		// 전체 글개수 가져오겠음.
		List<SearchBean> resultList = sdao.lyricSearch(search,startRow,pageSize,sort);	
		
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
		
		if(test!=null){
			
		JSONArray arr = new JSONArray();	
				
		for(SearchBean sb:resultList){
			
			JSONObject obj = new JSONObject();
			
			obj.put("mu_num", sb.getMu_num());
			obj.put("lyrics", sb.getLyrics());
			obj.put("music_name", sb.getMusic_name());
			obj.put("al_name", sb.getAl_name());
			arr.add(obj);

		}
			JSONObject obj = new JSONObject();
			obj.put("startPage", startPage);
			obj.put("pageBlock", pageBlock);
			obj.put("endPage", endPage);
			obj.put("pageCount", pageCount);
			arr.add(obj);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(arr);
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
		request.setAttribute("search", search);	
		
		// 페이지 이동  ./board/list.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./search/list.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
