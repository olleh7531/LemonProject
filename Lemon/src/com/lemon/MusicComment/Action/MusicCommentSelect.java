package com.lemon.MusicComment.Action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.MusicComment.db.MusicCommentBean;
import com.lemon.MusicComment.db.MusicCommentDAO;

public class MusicCommentSelect implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MusicCommentSelect execute()!!!!!!!!!!!!!!!!!!!!!!");

		int mu_num = Integer.parseInt(request.getParameter("mu_num"));
		System.out.println("번 : " + mu_num);

		MusicCommentDAO mcdao = new MusicCommentDAO();

		ArrayList<MusicCommentBean> mcb = mcdao.SelectMusicComment(mu_num);

		response.setContentType("applicatiom/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		JSONArray arr = new JSONArray();

		for (int i = 0; i < mcb.size(); i++) {
			MusicCommentBean mcbb = mcb.get(i);
			JSONObject obj = new JSONObject();
			obj.put("cmt_num", mcbb.getCmt_num());
			// System.out.println(mcbb.getCmt_num());
			obj.put("cmt_category", mcbb.getCmt_text_num());
			// System.out.println(mcbb.getCmt_text_num());
			obj.put("cmt_content", mcbb.getCmt_content());
			// System.out.println(mcbb.getCmt_content());
			obj.put("cmt_email", mcbb.getCmt_email());
			// System.out.println(mcbb.getCmt_email());
			obj.put("cmt_timestamp", mcbb.getCmt_timestamp());
			// System.out.println(mcbb.getCmt_timestamp());
			obj.put("cmt_ip", mcbb.getCmt_ip());
			// System.out.println(mcbb.getCmt_ip());
			obj.put("cmt_like", mcbb.getCmt_like());
			// System.out.println(mcbb.getCmt_like());
			obj.put("cmt_dislike", mcbb.getCmt_dislike());
			// System.out.println(mcbb.getCmt_dislike());
			obj.put("cmt_blame", mcbb.getCmt_blame());
			// System.out.println(mcbb.getCmt_blame());
			arr.add(obj);
		}
		System.out.println(arr);
		out.println(arr);
		return null;
	}

}
