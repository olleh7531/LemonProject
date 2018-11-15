package com.lemon.chart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lemon.chart.db.ChartDAO;

public class file_down implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("file_down execute()!!!!!!!!!!!");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email_id");
		
		if (user == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("로그인이 필요합니다.");
			out.close();
			return null;
		}
		
		String mu_num[] = request.getParameterValues("mu_num[]");
		int[] file_num = new int[mu_num.length];
		
		for(int i=0 ; i<mu_num.length ; i++) {
			file_num[i] = Integer.parseInt(mu_num[i]);
		}
		
		ChartDAO cdao = new ChartDAO();
		String fileName[] = cdao.DownLoads(file_num);
		
		for(int i=0 ; i<fileName.length ; i++) {
			System.out.println("fileName : " + fileName[i]);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		ActionForward forward = new ActionForward();
		
		String str = "./chart/file_downs.jsp?";
		
		for(int i=0 ; i<fileName.length ; i++) {
			if(i == fileName.length-1) {
				str = str + ("file_name"+i+"="+fileName[i]);
			} else {
				str = str + ("file_name"+i+"="+fileName[i]+"&");
			}
		}
		
		System.out.println(str);
		forward.setPath(str);
		forward.setRedirect(false);
		
		return forward;
	}
}