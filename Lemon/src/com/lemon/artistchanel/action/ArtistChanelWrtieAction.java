package com.lemon.artistchanel.action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtistChanelWrtieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanelInfoWrtieAction.java execute()");
		
		// 파일 업로드
		// upload/starpost/singerProfile 폴더 생성
		// 업로드 할 실제 서버 경로를 가져오기
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/upload/starpost/singerProfile");
		System.out.println("ArtistChanelInfoWrite.jsp context : " + context);
		System.out.println("ArtistChanelInfoWrite.jsp realPath : " + realPath);

		// 한번에 업로드할 파일의 최대 용량 지정 
		int maxSize = 10*1024*1024; // 10MB

		// MultipartRequest 객체 사용 파일 업로드
		// MultipartRequest 생성만 해주면 파일이 업로드 된다. (파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(
			request, // form 태그에서 가져온 파일, 텍스트 정보를 가져오기 위해서 , request 영역의 데이터를 전달
			realPath, // 업로드 파일의 위치
			maxSize, // 업로드할 파일의 최대 크기 지정
			"UTF-8", // 파일 이름이 한글처리 인코딩 처리 (UTF-8)
			new DefaultFileRenamePolicy() // 똑같은 파일이름에 대해서 업로드시 자동으로 파일이름을 변경해주는 객체
		);
		
		// 정보 -> JSP 페이지 -> Controller -> Action -> DB
		// DB - 자바빈(ArtistChanelBean), 처리(ArtistChanelDAO) / singer 테이블 생성
		ArtistChanelInfoBean acibean = new ArtistChanelInfoBean();
		
		// Data 포맷 설정
		SimpleDateFormat format = new SimpleDateFormat("yy-mm-dd"); 
		
		// 데이터 넣기
		// acibean.setNum(Integer.parseInt(multi.getParameter("num"))); // 가수 번호
		// System.out.println("ArtistChanelInfoWrite.jsp num : " + multi.getParameter("num"));
		
		// 솔로/그룹 유형
		acibean.setActivity_type(multi.getParameter("singer_solo_group"));
		System.out.println("ArtistChanelInfoWrite.jsp singer_solo_group : " + multi.getParameter("singer_solo_group"));
		
		// 가수 활동 이름(예명)
		acibean.setSinger_name(multi.getParameter("singer_name"));
		System.out.println("ArtistChanelInfoWrite.jsp singer_name : " + multi.getParameter("singer_name"));
		
		// 소속 그룹 이름
		acibean.setSi_group_name(multi.getParameter("singer_affiliate_group"));
		System.out.println("ArtistChanelInfoWrite.jsp singer_affiliate_group : " + multi.getParameter("singer_affiliate_group"));
		
		// 데뷔 날짜
        Date debut_year = new Date(format.parse(multi.getParameter("singer_debut_day")).getTime());
        acibean.setDebut_year(debut_year);
        System.out.println("ArtistChanelInfoWrite.jsp debut_year : " + debut_year);
        
        // 데뷔 노래
        acibean.setDebut_song(multi.getParameter("singer_debut_song"));
        System.out.println("ArtistChanelInfoWrite.jsp singer_debut_song : " + multi.getParameter("singer_debut_song"));
        
        // 소속사 이름
        acibean.setSi_agency(multi.getParameter("singer_agency_name"));
        System.out.println("ArtistChanelInfoWrite.jsp singer_agency_name : " + multi.getParameter("singer_agency_name"));
        
		// 프로필 사진
        acibean.setSi_picture(multi.getFilesystemName("singer_picture"));
		System.out.println("upload 폴더에 올라가있는 파일 이름 : " + multi.getFilesystemName("singer_picture"));
		System.out.println("사용자 올린 파일의 원본이름 : "+multi.getOriginalFileName("singer_picture"));
		
		// 노래 장르
		String[] genreParam = multi.getParameterValues("singer_song_genres");
		String genres="" ;
		for(int i = 0; i < genreParam.length; i++){
			if(i < (genreParam.length-1)) {
				genres+=genreParam[i]+",";
			}
			else {
				genres+=genreParam[i];
			}
			
			System.out.println("ArtistChanelInfoWrite.jsp singer_song_genres : " + multi.getParameterValues("singer_song_genres")[i]);
		}
		acibean.setSi_genre(genres);
		System.out.println("ArtistChanelInfoWrite.jsp genres : " + genres);
		
		// 생일
		Date si_birth = new Date(format.parse(multi.getParameter("singer_birth")).getTime());
		acibean.setSi_birth(si_birth);
		System.out.println("ArtistChanelInfoWrite.jsp singer_birth : " + multi.getParameter("singer_birth"));
		
		// ArtistChanelDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();
		
		// 정보 글쓰기 메소드 구현 및 실행(호출)
		acidao.infoWrite(acibean);
		
		// 아티스트 번호
		int artist = acidao.getArtistChanelInfoNum();
		
		// 페이지 이동
		// /AStartPostInfoWriteAction.asp
		ActionForward forward = new ActionForward();
		
		forward.setPath("./ArtistChanel.ac?artist=" + artist);
		forward.setRedirect(true);
		
		return forward;
	}
}