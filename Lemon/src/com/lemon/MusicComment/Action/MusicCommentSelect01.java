package com.lemon.MusicComment.Action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.MusicComment.db.MusicCommentBean;
import com.lemon.MusicComment.db.MusicCommentDAO;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class MusicCommentSelect01 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MusicCommentSelect01 execute()!!!!!!!!!!!");

		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		MusicCommentDAO mcdao = new MusicCommentDAO();
		ArrayList<MusicCommentBean> lmc = mcdao.selectMusic(mu_num);

		MemberDAO mdao = new MemberDAO();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		JSONArray arr = new JSONArray();

		for (int i = 0; i < lmc.size(); i++) {
			MusicCommentBean mcb = lmc.get(i);
			JSONObject obj = new JSONObject();

			MemberBean mb = mdao.nickname_img(mcb.getCmt_email());
			obj.put("num", mcb.getCmt_num());
			obj.put("content", mcb.getCmt_content());
			obj.put("time", mcb.getCmt_timestamp().toString());
			obj.put("img", mb.getImg());
			obj.put("nickname", mb.getNickname());
			arr.add(obj);
		}
		out.println(arr);
		out.close();
		return null;
	}

}
