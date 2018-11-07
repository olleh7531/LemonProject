package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.db.MemberDAO;

public class FindFriend implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FindFriend execute!!");
		/*
		String f_nickname = request.getParameter("f_nickname");
		String m_nickname = request.getParameter("m_nickname");
		System.out.println(f_nickname + " : f");
		System.out.println(m_nickname + " : m");
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.checkNick(f_nickname);
		*/
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String result = 
				"<input type='text' id='f_nickname' name='f_nickname'>" + 
				"<input type='button' value='찾기' onclick='friendSearch()'> <br><br>" + 
				"<span class='findResult'> </span>";
		out.print(result);
		
		/*if(!f_nickname.equals(m_nickname)) {
			if(check == 1) {
				// 아이디 있음
				result =
						"<b style='font-size:14px;color:blue'>친구를 찾았습니다.</b><br>" +
						"<input type='button' value='친구맺기' onclick='addFriend()'>";
				out.print(result);
			} else {
				// 아이디 없음
				result = "<b style='font-size:14px;color:red'>친구를 찾지 못했습니다.</b>";
				out.print(result);
			}
		} else {
			result = "<b style='font-size:14px;color:red'>본인입니다.</b>";
			out.print(result);
		}
		*/
		return null;
	}	
}