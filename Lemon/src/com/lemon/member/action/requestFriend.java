package com.lemon.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.FriendBean;
import com.lemon.member.db.FriendDAO;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class requestFriend implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String friendNickname = (String)request.getParameter("f_nickname");
		String myNickname = (String)request.getParameter("m_nickname");
		
		MemberBean db = new MemberBean();
		MemberDAO ddao = new MemberDAO();
		
		FriendBean fb = new FriendBean();
		FriendDAO fdao = new FriendDAO();
		
		ArrayList<String> check = fdao.requestFriend(myNickname);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check.size() != 0) {
			for(int i=0 ; i<check.size() ; i++) {
				String nickname = check.get(i);
				System.out.println(nickname);
				
				String result =
						"<input type='hidden' id='nick"+i+"' value='"+ nickname +"'>"+ 
						"<br> <label>"+nickname+"</label>" + 
						"<input type='button' value='수락' onclick='acception()'>" + 
						"<input type='button' value='거절' onclick='refuse()'> <br>";
				out.print(result);
			}
		} else {
			String result = "<label>받은 요청이 없습니다.</label>"; 
			out.print(result);
		}
		return null;
	}
}