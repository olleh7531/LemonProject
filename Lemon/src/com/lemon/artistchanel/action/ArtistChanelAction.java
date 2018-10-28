package com.lemon.artistchanel.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;

public class ArtistChanelAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanel 페이지");

		// 아티스트 번호
		int artist = Integer.parseInt(request.getParameter("artist"));
		
		// 디비 처리 객체
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();
		
		// 디비에서 아티스트 정보 가져오기(아티스트 번호에 해당하는 정보)
		ArtistChanelInfoBean acibean = acidao.getArtistChanelInfo(artist);

		// 전달, info 저장
		// 아티스트 정보를 ArtistChanel.jsp 페이지에 전달
		request.setAttribute("artist", artist);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("/starpost/artistChanel.jsp?artist=" + artist);
		forward.setRedirect(false);
		
		return forward;
	}
}