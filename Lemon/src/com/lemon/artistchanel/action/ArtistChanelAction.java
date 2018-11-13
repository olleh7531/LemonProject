package com.lemon.artistchanel.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;
import com.lemon.artistchanel.db.ArtistChanelPhotoBean;
import com.lemon.artistchanel.db.ArtistChanelPhotoDAO;

public class ArtistChanelAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanel 페이지");

		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　common　　　　　　　　　　　　　　　　　　　*/
		/*----------------------------------------------------------*/
		// 아티스트 번호
		int artist = Integer.parseInt(request.getParameter("artist"));
		
		// request.setAttribute("artist", artist);
				
		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　info　　　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
		// 아티스트 정보를 ArtistChanel.jsp 페이지에 전달
		
		// 디비 처리 객체 ArtistChanelInfoDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
		ArtistChanelInfoBean info = acidao.getArtistChanelInfo(artist);
		
		request.setAttribute("info", info);
		
		// 그룹 -> 그룹 멤버 가져오기 
		// String group_member = acibean.getGroup_singer_name();
		String group_member_name = info.getGroup_singer_num();
	 	List group_member = acidao.getGroupMember(group_member_name);
		
	 	request.setAttribute("group_member", group_member);
	 	
	 	// 솔로 -> 그룹 이름 불러오기
 		List<ArtistChanelInfoDAO> solo_group = (ArrayList)acidao.getArtistChanelSoloGroupName(artist);
 		
 		if(solo_group.size() > 0) {
 			request.setAttribute("solo_group", solo_group);
 		}
 				
		
		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　photo　　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
 		// 사진 정보를 ArtistChanel.jsp 페이지에 전달
		
		// 디비 처리 객체 ArtistChanelPhotoDAO 객체 생성
 		ArtistChanelPhotoDAO acpdao = new ArtistChanelPhotoDAO();

		// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
		ArtistChanelPhotoBean acpbean = acpdao.getSingerNum(artist);
		
		int photo_singer_num = acpbean.getAr_singer_num();
		List photo = acpdao.getPhotoSinger(photo_singer_num);
		request.setAttribute("photo", photo);
 		
		// 페이지
		// 게시판 전체 글 개수
		int count = acpdao.getArtistChanelPhotoNum();
		System.out.println("photo 전체 글 개수 : " + count);
		
		// 한 페이지에서 보여줄 글 개수 설정
		int pageSize = 24;
		
		// 현재 페이지 위치
		String page_num = request.getParameter("page_num");
		
		if(page_num == null) {
			page_num = "1";
		}
		
		// 시작행 계산하기 1 / 11 / 21 / 31 / ...
		int currentPage = Integer.parseInt(page_num);
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 끝 행 계산 10 / 20 / 30 / 40 / ...
		int endRow = currentPage * pageSize;
		
		// 전체 글 개수 가져오기
		List photo_list = acpdao.getPhotoList(startRow, pageSize);
		
		// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌 => 5페이지
		// 게시판 글 77개 , 한페이지에 10개씩 보여줌 => 8페이지( 7+1 )
		int page_count = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		// 한 화면에 보여줄 페이지 번호의 개수
		int pageBlock = 10;
		
		// 시작 페이지 번호
		int start_page = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		
		// 끝 페이지 번호
		int end_page = start_page + pageBlock - 1;
		
		if(end_page > page_count) {
			end_page = page_count;
		}
		
		request.setAttribute("photo_list", photo_list);
		request.setAttribute("page_num", page_num);
		request.setAttribute("count", count);
		request.setAttribute("page_count", page_count);
		request.setAttribute("start_page", start_page);
		request.setAttribute("end_page", end_page);

		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　페이지 이동　　　　　　　　　　　　　　　　　　*/
		/*----------------------------------------------------------*/
 			
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("/starpost/artistChanel.jsp?artist=" + artist);
		forward.setRedirect(false);
		
		return forward;
	}
}