package com.lemon.artistchanel.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelPhotoDAO;

public class ArtistChanelPhotoWriteCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int inputSingerNum = Integer.parseInt(request.getParameter("inputSingerNum"));
		
		ArtistChanelPhotoDAO acpdao = new ArtistChanelPhotoDAO();
		
		if(inputSingerNum != 0){
			String singerName = acpdao.singerCheckNum(inputSingerNum);
			
			// 가수 번호 체크해서 가수 이름 / 그룹 가져오기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(singerName);
		}
		
		return null;
	}
}
