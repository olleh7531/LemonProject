package com.lemon.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.FriendBean;
import com.lemon.member.db.FriendDAO;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class refuseFriend implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("refuseFriend execute");
		
		String f_nickname = (String)request.getParameter("f_nickname");
		String m_nickname = (String)request.getParameter("m_nickname");
		
		FriendDAO fdao = new FriendDAO();
		
		fdao.refuseFriend(m_nickname, f_nickname);
		
		ActionForward forward = new ActionForward();
		forward.setPath("requestFriend.mb?f_nickname="+f_nickname+"&m_nickname="+m_nickname);
		forward.setRedirect(false);
		
		return forward;
	}
}