package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction_execute()");
		
		// 로그인한 사람의 개인 정보를 출력 
		// 세션정보를 가져오기 
		HttpSession session = request.getSession();
		String email_id =(String)session.getAttribute("email_id");
		
		// 세션이 없을경우 -> 로그인 
		ActionForward forward = new ActionForward();
		if(email_id == null){
			forward.setPath("./main.mi");
			forward.setRedirect(true);
			return forward;			
		}
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// MemberBean 객체 생성 -> 수정페이지(폼태그) 정보를 저장
		// 파라미터값 -> MemberBean객체로 저장
		MemberBean mb = new MemberBean();
		
		mb.setEmail_id(request.getParameter("email_id"));
		mb.setPass(request.getParameter("pass"));
		mb.setName(request.getParameter("name"));
		mb.setNickname(request.getParameter("nickname"));
		mb.setGender(request.getParameter("gender"));
		mb.setBirth(request.getParameter("birth"));
		mb.setImg(request.getParameter("img"));
		
		mb.setMobile(request.getParameter("mobile"));
		mb.setZip_code(request.getParameter("zip_code"));
		mb.setAddress1(request.getParameter("address1"));
		mb.setAddress2(request.getParameter("address2"));	
//		mb.setreceive_email(Integer.parseInt(request.getParameter("age")));
				
		
		// MemberDAO 객체 생성 -> 메서드 생성  updateMember(mb);
		MemberDAO mdao = new MemberDAO();
		int check = mdao.updateMember(mb);
		// 0-> 비밀번호오류, -1-> 아이디오류, 1-> 수정성공
		
		if(check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호 오류');");
			out.println(" history.back();");
			out.println("</script>");
			out.close();
			return null;			
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('아이디 없음 오류');");
			out.println(" history.back();");
			out.println("</script>");
			out.close();
			return null;
		}	
		
		//check =1 
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println(" alert('수정성공');");
		out.println(" location.href='./main.mi';");
		out.println("</script>");
		out.close();
		
		return null;
	}
}
