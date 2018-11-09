package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.MemberDAO;

public class FriendSearch implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FriendSearch execute!!");
		
		String f_nickname = request.getParameter("f_nickname");
		String m_nickname = request.getParameter("m_nickname");
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.checkNick(f_nickname);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(!f_nickname.equals(m_nickname)) {
			if(check == 1) {
				// 아이디 있음
				String result =
						"<b style='font-size:14px;color:blue;'>'"+f_nickname+"' 친구를 찾았습니다.</b><br>" +
						"<input type='button' class='FindBtn' value='친구맺기' onclick='addFriend()'>";
				out.print(result);
			} else {
				// 아이디 없음
				String result = "<b style='font-size:14px;color:red;'>'"+f_nickname+"' 친구를 찾지 못했습니다.</b>";
				out.print(result);
			}
		} else {
			String result = "<b style='font-size:14px;color:red;'>본인입니다.</b>";
			out.print(result);
		}
		out.close();
		return null;
	}	
}