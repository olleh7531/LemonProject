package com.lemon.artistchanel.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoDAO;

public class ArtistChanelAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanel 페이지");
		
		// 디비 처리 객체
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 데이터 가져옴
		List info = acidao.getArtistChanelInfo();
		
		// 전달, info 저장
		request.setAttribute("info", info);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("/starpost/artistChanel.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}