package com.lemon.member.action;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinAction의 execute 호출");

		request.setCharacterEncoding("UTF-8");
		
		// MultipartRequest 객체 사용 업로드
		ServletContext ctx = request.getSession().getServletContext();
		
		// 실제 파일 저장경로 가져와서 출력
		String realPath = ctx.getRealPath("/member/upload/img/");
		
		// 파일의 최대 크기 지정
		int maxSize = 10 * 1024 * 1024;
		
		// 파일의 정보를 포함한 글 전체의 정보 -> DB에 저장
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		// 2. 전달받은 데이터를 저장 -> 자바빈(DTO) -> 디비 처리 객체(DAO) -> DB 테이블
		// 자바빈 객체 생성 net.member.db / MemberBean
		MemberBean mb = new MemberBean();
		// mb 객체에 값 저장 - 파라미터 값으로 저장
		
		String email_1 = multi.getParameter("email_1");
		String email_2 = multi.getParameter("email_2");
		String email = email_1 + "@" + email_2;

		mb.setEmail_id(email);
		mb.setPass(multi.getParameter("passward"));
		mb.setName(multi.getParameter("name"));
		mb.setNickname(multi.getParameter("nickname"));
		mb.setGender(multi.getParameter("gender"));
		mb.setBirth(multi.getParameter("birth"));
		String img = multi.getFilesystemName("file");
		mb.setImg(img);
		mb.setReg_ip(request.getRemoteAddr());
				
		// DB 처리 객체 생성 net.member.db / MemberDAO
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mb);
				
		// ActionForward 객체에 이동정보(경로/방법) 담아서 이동
		// 로그인 페이지로 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.mi");
		forward.setRedirect(true);
		
		return forward;	
	}
}