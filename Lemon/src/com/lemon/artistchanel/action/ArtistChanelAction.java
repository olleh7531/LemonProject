package com.lemon.artistchanel.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;

public class ArtistChanelAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanel 페이지");

		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　info　　　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
		// 아티스트 정보를 ArtistChanel.jsp 페이지에 전달
		
		// 아티스트 번호
		int artist = Integer.parseInt(request.getParameter("artist"));
		
		// request.setAttribute("artist", artist);
		
		// 디비 처리 객체 ArtistChanelInfoDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
		ArtistChanelInfoBean info = acidao.getArtistChanelInfo(artist);
		
		request.setAttribute("info", info);
		
		// 그룹 -> 그룹 멤버 가져오기 
		// String g_singer_name = acibean.getGroup_singer_name();
		String g_singer_num = info.getGroup_singer_num();
	 	List group_member = acidao.getGroupMember(g_singer_num);
		
	 	request.setAttribute("group_member", group_member);
	 	
	 	// 솔로 -> 그룹 이름 불러오기
 		List<ArtistChanelInfoDAO> solo_group = (ArrayList)acidao.getArtistChanelSoloGroupName(artist);
 		
 		if(solo_group.size() > 0) {
 			request.setAttribute("solo_group", solo_group);
 		}
 				
		
		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　photo　　　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("/starpost/artistChanel.jsp?artist=" + artist);
		forward.setRedirect(false);
		
		return forward;
	}
}