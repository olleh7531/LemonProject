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
		
		// 디비 처리 객체 ArtistChanelInfoDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
		ArtistChanelInfoBean acibean = acidao.getArtistChanelInfo(artist);
		
		// 그룹 -> 그룹 멤버 가져오기 
		// String g_singer_name = acibean.getGroup_singer_name();
		String g_singer_num = acibean.getGroup_singer_num();
	 	List group = acidao.getGroupMember(g_singer_num);
		 	
		// null이거나 "" 일 때 처리 사항 관련
		// -> 에러나서 여기에서 불러옴
	/*		// 본명 -> ""
			String real_name = acibean.getReal_name();
			
			// 데뷔 날짜 -> null
			Date debut_year = acibean.getDebut_year();
			
			// 생일 -> null
			Date siger_birth = acibean.getSi_birth();
			
			// 소속사 -> ""
			String agency = acibean.getSi_agency();
			
			// 그룹 -> 멤버 ""
			String group_member = acibean.getGroup_singer_name();
			
			if(!group_member.equals("")) {
				group_member = group_member.substring(0, group_member.length() - 1);
			}
			
			// 솔로 -> 그룹 ""
			String group_name = acibean.getSinger_name();*/
			
		// request.setAttribute("artist", artist);
		request.setAttribute("acibean", acibean);
		request.setAttribute("group", group);
		// 솔로 -> 그룹 이름 불러오기
		List<ArtistChanelInfoDAO> list = (ArrayList)acidao.getArtistChanelSoloGroupName(artist);
		
		if(list.size() > 0) {
			request.setAttribute("list", list);
		}
		
		// 그룹 -> 멤버 이름 불러오기
		
		
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