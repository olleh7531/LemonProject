package com.lemon.chatting.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemon.chatting.db.ChattingBean;
import com.lemon.chatting.db.ChattingDAO;

public class SelectMessage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SelectMessage execute()!!!!!!!!!!!!!");
		System.out.println("channel ㅂㅂㅂㅂㅂㅂ : " + request.getParameter("channel"));
		int channel = Integer.parseInt(request.getParameter("channel"));
		ChattingDAO cdao = new ChattingDAO();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		JSONArray arr = new JSONArray();
		ArrayList<ChattingBean> cblist = cdao.selectMessage(channel);
		for (int i = 0; i < cblist.size(); i++) {
			ChattingBean cb = cblist.get(i);
			JSONObject obj = new JSONObject();
			obj.put("num", cb.getCon_num());
			obj.put("sender", cb.getCon_sender());
			obj.put("receiver", cb.getCon_receiver());
			obj.put("message", cb.getCon_content());
			obj.put("sendtime", cb.getSendtime().toString());
			obj.put("channel", cb.getChannel());
			arr.add(obj);
		}
		out.println(arr);
		out.close();
		return null;
	}

}
