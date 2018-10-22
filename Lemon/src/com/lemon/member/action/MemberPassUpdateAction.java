package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberDAO;

public class MemberPassUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberPassUpdateAction_execute()");
		
		HttpSession session = request.getSession();
		
		String email_id = (String)session.getAttribute("email_id");
		String crtPass = request.getParameter("crtPass");
		String newPass = request.getParameter("newPass");
		String chkPass = request.getParameter("chkPass");
		
		System.out.println("email_id: "+email_id);
		System.out.println("crtPass: "+crtPass);
		System.out.println("newPass: "+newPass);
		System.out.println("chkPass: "+chkPass);
		MemberDAO mdao = new MemberDAO();

		int check = mdao.updateMemPass(email_id, crtPass, newPass, chkPass);
		// -1 - 현재 비밀번호 틀림
		// 0 - 새 비밀번호 확인 틀림
		// 1 - 비밀번호 변경 성공
		
		if(check ==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('새 비밀번호 확인 틀림');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println(" alert('현재 비밀번호 틀림');");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close();
			
			return null;
		}
				
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.mi");
		forward.setRedirect(true);		
		return forward;

	}

}
