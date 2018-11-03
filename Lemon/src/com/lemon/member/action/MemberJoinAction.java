package com.lemon.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;
import com.mysql.cj.ParseInfo;
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
		String realPath = ctx.getRealPath("/upload/member/img/");
		
		// 파일의 최대 크기 지정
		int maxSize = 10 * 1024 * 1024;
		
		// 파일의 정보를 포함한 글 전체의 정보 -> DB에 저장
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		if(multi.getParameter("email_cert") == null || multi.getParameter("email_cert").equals("0")){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('이메일 인증을 받지 않았습니다. ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
		}
		
		// 2. 전달받은 데이터를 저장 -> 자바빈(DTO) -> 디비 처리 객체(DAO) -> DB 테이블
		// 자바빈 객체 생성 net.member.db / MemberBean
		MemberBean mb = new MemberBean();
		// mb 객체에 값 저장 - 파라미터 값으로 저장
		
		String email_1 = multi.getParameter("email_1");
		String email_2 = multi.getParameter("email_2");
		String email = email_1+email_2;
		
		mb.setEmail_id(email);
		mb.setPass(multi.getParameter("password"));
		mb.setName(multi.getParameter("name"));
		mb.setNickname(multi.getParameter("nickname"));
		mb.setGender(multi.getParameter("gender"));
		mb.setBirth(multi.getParameter("birth"));
		mb.setChk(Integer.parseInt(multi.getParameter("chk")));
		String img = multi.getFilesystemName("file");
		mb.setImg(img);
		mb.setReg_ip(request.getRemoteAddr());
		System.out.println("email_cert : " + Integer.parseInt(multi.getParameter("email_cert")));
		mb.setEmail_cert(Integer.parseInt(multi.getParameter("email_cert")));
		if(multi.getParameter("mailTermsAgree") == null){
			mb.setReceive_email(0);	
		}else if(multi.getParameter("mailTermsAgree").equals("on")){
			mb.setReceive_email(1);			
		}
		
		// DB 처리 객체 생성 net.member.db / MemberDAO
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mb);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("main.mi");
		forward.setRedirect(true);
		
		return forward;	
	}
}