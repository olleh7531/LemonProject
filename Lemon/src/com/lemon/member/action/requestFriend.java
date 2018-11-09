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
		
		String f_nickname = (String)request.getParameter("f_nickname");
		String m_nickname = (String)request.getParameter("m_nickname");
		
		MemberBean db = new MemberBean();
		MemberDAO ddao = new MemberDAO();
		
		FriendBean fb = new FriendBean();
		FriendDAO fdao = new FriendDAO();
		
		ArrayList<String> check = fdao.requestFriend(m_nickname);
		ArrayList<String> friendList = fdao.listFriend(m_nickname);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check.size() != 0) {
			for(int i=0 ; i<check.size() ; i++) {
				String nickname = check.get(i);
				System.out.println(nickname);
				
				String result =
						"<input type='hidden' id='nick' value='"+ nickname +"'>"+ 
						"<br> <label>"+nickname+"</label>" + 
						"<input type='button' class='acception' value='수락'>" + 
						"<input type='button' class='refuse' value='거절'> <br>";
				out.print(result);
			}
		} else {
			String result = "<label>받은 요청이 없습니다.</label>"; 
			out.print(result);
		}
		System.out.println("friendList.size() : " + friendList.size());
		if(friendList.size() != 0) {
			System.out.println("friendList out : " + friendList);
			for(int i=0 ; i<friendList.size() ; i++) {
				String nickname = friendList.get(i);
				System.out.println(nickname);
				
				String result =
						"<input type='hidden' id='nick' value='"+ nickname +"'>"+ 
						"<br><br> <label>"+nickname+"</label>" + 
						"<input type='button' class='info' value='정보보기'> <br>";
				out.print(result);
			}
		} else {
			String result = "<br><br><label>현재 친구가 없습니다.</label><br>"; 
			out.print(result);
		}
		
		return null;
	}
}