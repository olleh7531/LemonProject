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

		FriendDAO fdao = new FriendDAO();
		
		ArrayList<String> check = fdao.requestFriend(m_nickname);
		ArrayList<String> friendList = fdao.listFriend(m_nickname);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String result = "";
		
		if(check.size() != 0) {
			String count = "<label style='font-size:14px;color:blue;'>--------["+check.size()+"]개의 친구 요청이 있습니다!--------</label><br>";
			out.print(count);
			for(int i=0 ; i<check.size() ; i++) {
				String nickname = check.get(i);
				
				result =
					"<input type='hidden' id='nick' value='"+ nickname +"'>"+ 
					"<label style='width: 100px; display: inline-block;'>"+nickname+"</label>" + 
					"<input type='button' class='fr_acception' value='수락'>" + 
					"<input type='button' class='fr_refuse' value='거절'> <br>";
				out.print(result);
			}
		} else {
			result = "<label style='font-size:14px;color:red;'>받은 친구요청이 없습니다.</label><br><br>"; 
			out.print(result);
		}
		
		if(friendList.size() != 0) {
			String count = "<br><label style='font-size:14px;color:blue;'>----------["+friendList.size()+"]명의 친구가 있습니다!----------</label><br>";
			out.print(count);
			for(int i=0 ; i<friendList.size() ; i++) {
				String nickname = friendList.get(i);
				
				result = 
					"<input type='hidden' id='nick' value='"+ nickname +"'>"+ 
					"<label style='width: 100px; display: inline-block;'>"+nickname+"</label>" + 
					"<input type='button' class='fr_info' value='정보보기'>" +
					"<input type='button' class='fr_del' value='친구삭제'> <br>";
				out.print(result);
			}
		} else {
			result = "<br><br><label style='font-size:14px;color:red;'>친구가 없습니다....</label><br>"; 
			out.print(result);
		}
		
		return null;
	}
}