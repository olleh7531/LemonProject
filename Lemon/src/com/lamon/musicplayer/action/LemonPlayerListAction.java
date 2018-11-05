package com.lamon.musicplayer.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lamon.musicplayer.db.MusicPlayerBean;
import com.lamon.musicplayer.db.MusicPlayerDAO;

public class LemonPlayerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("LemonPlayerListAction execute()!!!!!s");
//		MusicPlayerDAO pdao = new MusicPlayerDAO();
//		ArrayList<MusicPlayerBean> mppb = pdao.selectPlayerList();
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		JSONArray arr = new JSONArray();
//		for (int i = 0; i < mppb.size(); i++) {
//			MusicPlayerBean mbp = mppb.get(i);
//			JSONObject obj = new JSONObject();
//			obj.put("img", mbp.getAl_art_img());
//			obj.put("file", mbp.getMusicfile());
//			obj.put("name", mbp.getAl_name());
//			obj.put("time", mbp.getMusic_time());
//			arr.add(obj);
//		}
//		out.println(arr);
		return null;
	}

}
