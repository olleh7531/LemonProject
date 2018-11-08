package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginAction의 execute 호출");

		HttpSession session = request.getSession();

		MemberDAO mdao = new MemberDAO();

		String email_id = request.getParameter("email_id");
		String pass = request.getParameter("pass");

		MemberBean mb = new MemberBean();
		mb = mdao.getMember(email_id);
		
		int check;
		int chkChk = mdao.chkCheck(email_id); 
		if(pass == null && chkChk != 0){
			check = chkChk;
		}else{
			check = mdao.idCheck(email_id, pass);
		}
		
		// 0 - "비밀번호 오류"
		// -1 - "아이디 없음"
		// 1 - 로그인 
		
		if(check == 0 && chkChk != 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println(" alert('이메일 계정 로그인 해주세요 ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();								
				
			return null;

		}else if(check ==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println(" alert('비밀번호 오류 ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();								
				
			return null;
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('아이디없음 오류 ');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}

		// check ==1 일때 로그인 처리 ,세션값 생성 "id" -> Main.mi
		//System.out.println("이미지 확인 : " + mb.getImg());
		session.setAttribute("email_id", email_id);
		session.setAttribute("nickname", mb.getNickname());
		session.setAttribute("img_user", mb.getImg());

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.mi");
		forward.setRedirect(true);
		return forward;
	}

}