package com.lemon.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class MemberUpdate implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdate_execute()");
		
		// 세션정보 체크 -> 로그인페이지 
		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");
		
		ActionForward forward = new ActionForward();
		if(email_id == null){
			forward.setPath("./main.mi");
			forward.setRedirect(true);
			return forward;
		}
		
		// 수정 (디비에서 정보를 가져와서 화면에 뿌려주기 -> 정보를 수정 -> 디비에 저장)
		// MemberDAO 객체 생성 -> 회원 정보를 가져오기
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(email_id);
		
		// 회원정보를 updateForm.jsp 페이지에 전달(request객체)
		request.setAttribute("mb", mb);
		
		// ./member/updateForm.jsp 생성
		// 페이지 이동 (주소 : ./MemberUpdate.me(화면 : ./member/updateForm.jsp))
		forward.setPath("./member/updateForm.jsp");	
		forward.setRedirect(false);	
		return forward;
	}

}
