package com.lemon.magazine.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;

public class magazineUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BoardUpdateAction_execute()까지 실행!");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// pageNum 파라미터 저장
		String pageNum = request.getParameter("pageNum");
		
		BoardBean bb = new BoardBean();
		
		bb.setMa_subject(request.getParameter("ma_subject"));
		bb.setMa_category(request.getParameter("ma_category"));
		bb.setMa_content(request.getParameter("ma_content"));
		bb.setMa_num(Integer.parseInt(request.getParameter("ma_num")));
		
		BoardDAO bdao = new BoardDAO();
		int check = bdao.updateBoard(bb);
		
		if(check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 오류');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시판 글 없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정 성공!');");
		out.println("location.href='./magazineList.maga?pageNum="+pageNum+",");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
