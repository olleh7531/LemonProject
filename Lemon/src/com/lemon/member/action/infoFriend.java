package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.FriendDAO;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class infoFriend implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("acceptionFriend execute");

		String nickname = (String) request.getParameter("nickname");

		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.MemberInfo(nickname);
		String img = mb.getImg();
		
		System.out.println("mb.getImg() : " + mb.getImg());
		if(img == null) {
			img = "noimg.gif";
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String result =
			"<br> <label> 아이디 : "+mb.getEmail_id()+"</label><br>" + 
			"<br> <label> 이름 : "+mb.getName()+"</label><br>" +
			"<br> <label> 성별 : "+mb.getGender()+"</label><br>" +
			"<br> <label> 생일 : "+mb.getBirth()+"</label><br>" +
			"<br> <img src='./upload/member/img/"+img+"' width='60' height='60' style='border-radius: 50%;'><br>";
		out.print(result);
		
		return null;
	}
}