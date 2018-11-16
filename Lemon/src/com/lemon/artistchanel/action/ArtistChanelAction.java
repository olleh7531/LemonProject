package com.lemon.artistchanel.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		Object artist_num = request.getParameter("artist");
//		System.out.println("ArtistChanelAction.java photo artist_num : " + artist_num);
		
		int artist = 0;
		
		if(artist_num != null) {
			artist = Integer.parseInt(request.getParameter("artist"));
//			System.out.println("ArtistChanelAction.java photo artist : " + artist);
		}
		
		// request.setAttribute("artist", artist);
				
		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　info　　　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
		// 아티스트 정보를 ArtistChanel.jsp 페이지에 전달
		
		// 디비 처리 객체 ArtistChanelInfoDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 디비에서 가수 정보 번호 가져오기(번호에 해당하는 가수 정보)
		ArtistChanelInfoBean info = acidao.getArtistChanelInfo(artist);
//		System.out.println("ArtistChanelAction.java photo info : " + info);
		
		/*info.getGroup_singer_num();
		request.setAttribute("info.getGroup_singer_num()", info.getGroup_singer_num());*/
		request.setAttribute("info", info);
		
		// 그룹 -> 그룹 멤버 가져오기 
		// String group_member = acibean.getGroup_singer_name();
		String group_member_name = info.getGroup_singer_num();
//		System.out.println("ArtistChanelAction.java photo group_member_name : " + group_member_name);
		
	 	List group_member = acidao.getGroupMember(group_member_name);
//	 	System.out.println("ArtistChanelAction.java photo group_member : " + group_member);
	 	
	 	request.setAttribute("group_member", group_member);
	 	
	 	// 솔로 -> 그룹 이름 불러오기
 		List<ArtistChanelInfoDAO> solo_group = (ArrayList)acidao.getArtistChanelSoloGroupName(artist);
// 		System.out.println("ArtistChanelAction.java photo solo_group : " + solo_group);
 		
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
		
		if(acpdao != null) {
			int photo_singer_num = acpbean.getAr_singer_num();
			List photo = acpdao.getPhotoSinger(photo_singer_num);
//			System.out.println("ArtistChanelAction.java photo photo : " + photo);
			
			request.setAttribute("photo", photo);
		}
		
		// 페이지
		// 게시판 전체 글 개수
		int count = acpdao.getPhotoCount();
//		System.out.println("ArtistChanelAction.java photo 전체 글 개수 : " + count);
		
		// 한 페이지에서 보여줄 글 개수 설정
		int pageSize = 24;
//		System.out.println("ArtistChanelAction.java photo 한 페이지에서 보여줄 글 개수 : " + pageSize);
		
		// 현재 페이지 위치
		String page_num = request.getParameter("page_num");
//		System.out.println("ArtistChanelAction.java photo 현재 페이지 위치 : " + page_num);
		
		if(page_num == null) {
			page_num = "1";
		}
//		System.out.println("ArtistChanelAction.java photo 현재 페이지 위치 : " + page_num);
		
		// 시작행 계산하기 1 / 11 / 21 / 31 / ...
		int currentPage = Integer.parseInt(page_num); // 현재 행
//		System.out.println("ArtistChanelAction.java photo 현재 행 : " + currentPage);
		
		int startRow = (currentPage - 1) * pageSize + 1; // 시작 행
//		System.out.println("ArtistChanelAction.java photo 시작 행 : " + startRow);
		
		// 끝 행 계산 10 / 20 / 30 / 40 / ...
		int endRow = currentPage * pageSize;
//		System.out.println("ArtistChanelAction.java photo 끝 행 : " + endRow);
		
		// 전체 글 개수 가져오기
		List photo_list = acpdao.getPhotoList(startRow, pageSize);
//		System.out.println("ArtistChanelAction.java photo 전체 글 개수 가져오기 : " + photo_list);
		
		// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌 => 5페이지
		// 게시판 글 77개 , 한페이지에 10개씩 보여줌 => 8페이지( 7+1 )
		int page_count = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//		System.out.println("ArtistChanelAction.java photo 전체 페이지수 계산 : " + page_count);
		
		// 한 화면에 보여줄 페이지 번호의 개수
		int page_block = 10;
//		System.out.println("ArtistChanelAction.java photo 한 화면에 보여줄 페이지 번호의 개수 : " + page_block);
		
		// 시작 페이지 번호
		int start_page = ((currentPage - 1) / page_block) * page_block + 1;
//		System.out.println("ArtistChanelAction.java photo 시작 페이지 번호 : " + start_page);
		
		// 끝 페이지 번호
		int end_page = start_page + page_block - 1;
//		System.out.println("ArtistChanelAction.java photo 끝 페이지 번호 : " + end_page);
		
		if(end_page > page_count) {
			end_page = page_count;
		}
//		System.out.println("ArtistChanelAction.java photo 끝 페이지 번호 : " + end_page);
		
		/*----------------------------------------------------------*/
		/*　　　　　　　　　　　　　　　　　　포토 내용　　　　　　　　　　　　　　　　　　  */
		/*----------------------------------------------------------*/
		String photo_content_ajax = request.getParameter("photo_content_ajax");
//		System.out.println("ArtistChanelAction.java photo photo_content_ajax : " + photo_content_ajax);
		
		// photo_content_ajax 일 때만 내용 보이게 한다
			
			ArtistChanelPhotoBean acpbean_content = new ArtistChanelPhotoBean();
			
			Object o_ar_num = request.getParameter("ar_num");
//			System.out.println("ArtistChanelAction.java photo o_ar_num : " + o_ar_num);
			

			
			if(o_ar_num != null) {
				int ar_num = Integer.parseInt(request.getParameter("ar_num"));
//				System.out.println("ArtistChanelAction.java photo ar_num : " + ar_num);
			
				
				acpbean_content = acpdao.getPhotoContentNum(ar_num);
//				System.out.println("ArtistChanelAction.java photo acpbean_content : " + acpbean_content);
			}
			
			// "" : db 컬럼 명
			
			if(photo_content_ajax != null) {
				JSONArray arr = new JSONArray();
			JSONObject obj = new JSONObject();
			// 포토 번호
			obj.put("ar_num", acpbean_content.getAr_num());
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_num());
			
			// 제목
			obj.put("ar_subject", acpbean_content.getAr_subject());
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_subject());
			
			// 내용
			obj.put("ar_content", acpbean_content.getAr_content());
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_content());
			
			// 등록 날짜
			obj.put("ar_registerdate", String.valueOf(acpbean_content.getAr_registerdate()));
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_registerdate());
			
			// 좋아요
			
			// 조회수
			obj.put("ar_readcount", acpbean_content.getAr_readcount());
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_readcount());
			
			// 사진
			obj.put("ar_photo", acpbean_content.getAr_photo());
			System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content.getAr_photo());
			
			// 댓글

			// arr에 obj 담기
			arr.add(obj);
			
			// 포토 리스트에서 포토 선택 후 선택한 포토 내용 보여줄 때
			// 포토 슬라이더 내용 가져온다
			List<ArtistChanelPhotoBean> photolist = acpdao.getPhotoSlider();
			
			for(ArtistChanelPhotoBean acpbean_content_slider:photolist) {
				obj = new JSONObject();
				
				// 포토 번호
				obj.put("ar_num", acpbean_content_slider.getAr_num());
				System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content_slider.getAr_num());
				
				// 포토 제목
				obj.put("ar_subject", acpbean_content_slider.getAr_subject());
				System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content_slider.getAr_subject());
				
				// 포토
				obj.put("ar_photo", acpbean_content_slider.getAr_photo());
				System.out.println("ArtistChanelAction.java photo ar_num : " + acpbean_content_slider.getAr_photo());
				
				arr.add(obj);
			}
			
			// 페이지 관련
			/*obj = new JSONObject();
			
			obj.put("start_page", start_page);
			obj.put("pageBlock", page_block);
			obj.put("end_page", end_page);
			obj.put("page_count", page_count);
			
			arr.add(obj);*/
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(arr);
			out.close();								
			
			return null;
		}
		
		request.setAttribute("photo_list", photo_list);
		request.setAttribute("page_num", page_num);
		request.setAttribute("count", count);
		request.setAttribute("page_count", page_count);
		request.setAttribute("page_block", page_block);
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