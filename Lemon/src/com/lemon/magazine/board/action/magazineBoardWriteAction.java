package com.lemon.magazine.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class magazineBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("magazineBoardWriteAction execute() 실행");
		request.setCharacterEncoding("UTF-8");

		String realpath = request.getRealPath("/magazine/image");
		System.out.println("realpath : " + realpath);

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		BoardBean bb = new BoardBean();
		// bb.setMa_num(Integer.parseInt(request.getParameter("ma_num")));
		bb.setMa_subject(multi.getParameter("ma_subject"));
		bb.setMa_category(multi.getParameter("ma_category"));
		bb.setMa_content(multi.getParameter("ma_content"));

		// System.out.println(request.getParameter("ma_num"));
		System.out.println(multi.getParameter("ma_subject"));
		System.out.println(multi.getParameter("ma_category"));
		System.out.println(multi.getParameter("ma_content"));
		System.out.println(multi.getFilesystemName("ma_file"));
		bb.setMa_file(multi.getFilesystemName("file"));

		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bb);

		ActionForward forward = new ActionForward();
		forward.setPath("./magazineList.maga");
		forward.setRedirect(true);

		return forward;
	}

}
