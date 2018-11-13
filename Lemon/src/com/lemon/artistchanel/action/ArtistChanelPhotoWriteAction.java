package com.lemon.artistchanel.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;
import com.lemon.artistchanel.db.ArtistChanelPhotoBean;
import com.lemon.artistchanel.db.ArtistChanelPhotoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtistChanelPhotoWriteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanelPhotoWriteAction.java execute()");
		
		// upload/starpost/singerPhoto 폴더 생성
		// 업로드 할 실제 서버 경로를 가져오기
		ServletContext photoContext = request.getServletContext();
		String photoRealPath = photoContext.getRealPath("/upload/starpost/singerPhoto");
		System.out.println("ArtistChanelPhotoWriteAction.java photoContext : " + photoContext);
		System.out.println("ArtistChanelPhotoWriteAction.java photoRealPath : " + photoRealPath);
		
		// 한번에 업로드할 파일의 최대 용량 지정 
		int photoMaxSize = 10*1024*1024; // 10MB

		// MultipartRequest 객체 사용 파일 업로드
		// MultipartRequest 생성만 해주면 파일이 업로드 된다. (파일 자체의 업로드 완료)
		MultipartRequest photoMulti = new MultipartRequest
		(
				// form 태그에서 가져온 파일, 텍스트 정보를 가져오기 위해서 , request 영역의 데이터를 전달
				request,
				photoRealPath, // 업로드 파일의 위치
				photoMaxSize, // 업로드할 파일의 최대 크기 지정
				"UTF-8", // 파일 이름이 한글처리 인코딩 처리 (UTF-8)
				// 똑같은 파일이름에 대해서 업로드시 자동으로 파일이름을 변경해주는 객체
				new DefaultFileRenamePolicy()
		);
		
		// 정보 -> JSP 페이지 -> Controller -> Action -> DB
		// DB - 자바빈(ArtistChanelBean), 처리(ArtistChanelDAO) / singer 테이블 생성
		ArtistChanelPhotoBean acpbean = new ArtistChanelPhotoBean();
		
		// Data 포맷 설정
		SimpleDateFormat photoFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		
		// 제목
		acpbean.setAr_subject(photoMulti.getParameter("singer_photo_title"));
		System.out.println("ArtistChanelPhotoWriteAction.java singer_photo_title : " + photoMulti.getParameter("singer_photo_title"));
		
		// 내용
		acpbean.setAr_content(photoMulti.getParameter("singer_photo_content"));
		System.out.println("ArtistChanelPhotoWriteAction.java singer_photo_content : " + photoMulti.getParameter("singer_photo_content"));
				
		// 포토 가수 번호
		acpbean.setAr_singer_num(Integer.parseInt(photoMulti.getParameter("singer_photo_singer_num")));
		System.out.println("ArtistChanelPhotoWriteAction.java singer_photo_singer_num : " + photoMulti.getParameter("singer_photo_singer_num"));
		
		// 사진
		acpbean.setAr_photo(photoMulti.getFilesystemName("singer_photo_photo"));
		System.out.println("ArtistChanelPhotoWriteAction.java upload 폴더에 올라가있는 파일 이름 : " + photoMulti.getFilesystemName("singer_photo_photo"));
		System.out.println("ArtistChanelPhotoWriteAction.java 사용자 올린 파일의 원본이름 : "+photoMulti.getOriginalFileName("singer_photo_photo"));
		
		// ArtistChanelPhotoDAO 객체 생성
		ArtistChanelPhotoDAO acpdao = new ArtistChanelPhotoDAO();
		
		// 정보 글쓰기 메소드 구현 및 실행(호출)
		acpdao.photoWrite(acpbean);

		/*-------------------------------------------------------*/
		/*                      페이지 연결                                                  */
		/*-------------------------------------------------------*/
		
		// 아티스트 정보 - 번호
		int artist = acpdao.getArtistChanelPhotoNum();
		
		// 페이지 이동
		// /AStartPostWriteAction.asp
		ActionForward forward = new ActionForward();
		
		forward.setPath("./ArtistChanel.ac?artist=" + artist);
		forward.setRedirect(true);
		
		return forward;
	}
}