package com.lemon.member.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		ServletContext ctx = request.getServletContext();
		String realPath=ctx.getRealPath("/upload/member/img/");
	    
		int maxSize = 10 * 1024 * 1024;
		
		String img="";
		
		MultipartRequest multi = new MultipartRequest(
			request,
			realPath,
			maxSize,
			"UTF-8",
			new DefaultFileRenamePolicy()		  
		);
		
		String pass = multi.getParameter("pass");
		String chkPass = multi.getParameter("chkPass");
		int chk = Integer.parseInt(multi.getParameter("chk"));
		
		if(chk == 0) {
			if(!pass.equals(chkPass)){
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println(" alert('비밀번호가 일치하지 않습니다.');");
				out.println(" history.back(); ");
				out.println("</script>");
				out.close();
			}
		}
		
		img = multi.getFilesystemName("img");		
		
		// MemberBean 객체 생성 -> 수정페이지(폼태그) 정보를 저장
		// 파라미터값 -> MemberBean객체로 저장
		MemberBean mb = new MemberBean();

		mb.setEmail_id(multi.getParameter("email_id"));
		mb.setPass(pass);
		mb.setName(multi.getParameter("name"));
		mb.setNickname(multi.getParameter("nickname"));
		mb.setGender(multi.getParameter("gender"));
		mb.setBirth(multi.getParameter("birth"));
		mb.setImg(img);
		if(img == null){
			mb.setImg(multi.getParameter("preImg"));
		}
		mb.setChk(chk);
		mb.setMobile(multi.getParameter("mobile"));
		mb.setZip_code(multi.getParameter("zip_code"));
		mb.setAddress1(multi.getParameter("address1"));
		mb.setAddress2(multi.getParameter("address2"));	
		if(multi.getParameter("receive_email") == null){
			mb.setReceive_email(0);	
		} else if(multi.getParameter("receive_email").equals("on")){
			mb.setReceive_email(1);			
		}
		
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
			
		} else if(check == -1){
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
