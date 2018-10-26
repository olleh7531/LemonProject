package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction_execute()");

		// 로그인한 사람의 개인 정보를 출력
		// 세션정보를 가져오기
		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");

		// 비밀번호 저장
		String pass = request.getParameter("pass");

		System.out.println(email_id);
		System.out.println(pass);
		
		// MemberDAO 객체 생성후 , 메서드 생성
		MemberDAO mdao = new MemberDAO();
		int check = mdao.deleteMember(email_id, pass);

		
		// 0-> 비밀번호오류, -1-> 아이디오류, 1-> 수정성공
		if (check == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호 오류');");
			out.println(" history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('아이디 없음 오류');");
			out.println(" history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		// check =1
		// 세션 초기화 
		session.invalidate();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" alert('삭제성공(회원탈퇴)');");
		out.println(" location.href='./main.mi';");
		out.println("</script>");
		out.close();

		return null;

	}
}