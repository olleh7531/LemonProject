package com.lemon.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.FriendBean;
import com.lemon.member.db.FriendDAO;

public class AddFriendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddFriendAction execute");
		
		String f_nickname = (String)request.getParameter("f_nickname");
		String m_nickname = (String)request.getParameter("m_nickname");
		
		FriendBean fb = new FriendBean();
		FriendDAO fdao = new FriendDAO();
		
		fb.setReceiver_nick(f_nickname);
		fb.setSender_nick(m_nickname);
		
		int check = fdao.addFriend(fb);
		int friendChk = fdao.FriendCheck(m_nickname, f_nickname);
		
		String str = "";
		
		if(check == 1) {
			str = "'"+f_nickname+"'에게 친구 요청을 했습니다!";
		} else {
			if(friendChk == 1) {
				str = "이미 '"+f_nickname+"'와 친구입니다!";
			} else {
				str = "이미 '"+f_nickname+"'에게 요청을 했거나, 요청이 온 상태입니다.";
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		
		return null;
	}
}