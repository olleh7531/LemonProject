package com.lemon.artistchanel.action;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.artistchanel.db.ArtistChanelInfoBean;
import com.lemon.artistchanel.db.ArtistChanelInfoDAO;
import com.lemon.artistchanel.db.ArtistChanelPhotoBean;
import com.lemon.artistchanel.db.ArtistChanelPhotoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtistChanelInfoWrtieAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ArtistChanelInfoWrtieAction.java execute()");
		/*-------------------------------------------------------*/
		/* 정보 */
		/*-------------------------------------------------------*/
		// 파일 업로드
		// upload/starpost/singerProfile 폴더 생성
		// 업로드 할 실제 서버 경로를 가져오기
		ServletContext infoContext = request.getServletContext();
		String infoRealPath = infoContext.getRealPath("/upload/starpost/singerProfile");
		System.out.println("ArtistChanelInfoWrtieAction.java infoContext : " + infoContext);
		System.out.println("ArtistChanelInfoWrtieAction.java infoRealPath : " + infoRealPath);

		// 한번에 업로드할 파일의 최대 용량 지정
		int infoMaxSize = 10 * 1024 * 1024; // 10MB

		// MultipartRequest 객체 사용 파일 업로드
		// MultipartRequest 생성만 해주면 파일이 업로드 된다. (파일 자체의 업로드 완료)
		MultipartRequest infoMulti = new MultipartRequest
		(
				// form 태그에서 가져온 파일, 텍스트 정보를 가져오기 위해서, request 영역의 데이터를 전달
				request,
				infoRealPath, // 업로드 파일의 위치
				infoMaxSize, // 업로드할 파일의 최대 크기 지정
				"UTF-8", // 파일 이름이 한글처리 인코딩 처리 (UTF-8)
				// 똑같은 파일이름에 대해서 업로드시 자동으로 파일이름을 변경해주는 객체
				new DefaultFileRenamePolicy()
		);

		// 정보 -> JSP 페이지 -> Controller -> Action -> DB
		// DB - 자바빈(ArtistChanelBean), 처리(ArtistChanelDAO) / singer 테이블 생성
		ArtistChanelInfoBean acibean = new ArtistChanelInfoBean();

		// Data 포맷 설정
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		// 데이터 넣기
		// acibean.setNum(Integer.parseInt(multi.getParameter("num"))); // 가수 번호
		// System.out.println("ArtistChanelInfoWrite.java num : " +
		// multi.getParameter("num"));

		// 솔로/그룹 유형
		acibean.setActivity_type(infoMulti.getParameter("singer_solo_group"));
		System.out.println(
				"ArtistChanelInfoWrtieAction.java singer_solo_group : " + infoMulti.getParameter("singer_solo_group"));

		// 가수 활동 이름(예명)/본명
		acibean.setSinger_name(infoMulti.getParameter("singer_name"));
		System.out.println("ArtistChanelInfoWrtieAction.java singer_name : " + infoMulti.getParameter("singer_name"));

		// 본명
		acibean.setReal_name(infoMulti.getParameter("singer_real_name"));
		System.out.println("ArtistChanelInfoWrtieAction.java singer_real_name : " + infoMulti.getParameter("singer_real_name"));

		// 데뷔 날짜
		if(!infoMulti.getParameter("singer_debut_day").equals("")) {
			Date debut_year = new Date(format.parse(infoMulti.getParameter("singer_debut_day")).getTime());
			
			acibean.setDebut_year(debut_year);
			System.out.println("ArtistChanelInfoWrtieAction.java debut_year : " + debut_year);
		}
		
		// 생일
		if(!infoMulti.getParameter("singer_birth").equals("")) {
			Date si_birth = new Date(format.parse(infoMulti.getParameter("singer_birth")).getTime());
			
			acibean.setSi_birth(si_birth);
			System.out.println("ArtistChanelInfoWrtieAction.java singer_birth : " + infoMulti.getParameter("singer_birth"));
		}

		// 데뷔 노래
		acibean.setDebut_song(infoMulti.getParameter("singer_debut_song"));
		System.out.println(
				"ArtistChanelInfoWrtieAction.java singer_debut_song : " + infoMulti.getParameter("singer_debut_song"));

		// 소속사 이름
		acibean.setSi_agency(infoMulti.getParameter("singer_agency_name"));
		System.out.println("ArtistChanelInfoWrtieAction.java singer_agency_name : "
				+ infoMulti.getParameter("singer_agency_name"));

		// 프로필 사진
		acibean.setSi_picture(infoMulti.getFilesystemName("singer_picture"));
		System.out.println("upload 폴더에 올라가있는 파일 이름 : " + infoMulti.getFilesystemName("singer_picture"));
		System.out.println("사용자 올린 파일의 원본이름 : " + infoMulti.getOriginalFileName("singer_picture"));

		// 노래 장르
		String[] genreParam = infoMulti.getParameterValues("singer_song_genres");
		String genres = "";

		for (int i = 0; i < genreParam.length; i++) {
			if (i < (genreParam.length - 1)) {
				genres += genreParam[i] + ", ";
			} else {
				genres += genreParam[i];
			}

			System.out.println("ArtistChanelInfoWrtieAction.java singer_song_genres : "
					+ infoMulti.getParameterValues("singer_song_genres")[i]);
		}

		acibean.setSi_genre(genres);
		System.out.println("ArtistChanelInfoWrtieAction.java genres : " + genres);

		// 성별
		acibean.setSi_gender(infoMulti.getParameter("singer_gender"));
		System.out
				.println("ArtistChanelInfoWrtieAction.java singer_gender : " + infoMulti.getParameter("singer_gender"));

		// 그룹 번호
		acibean.setGroup_singer_num(","+infoMulti.getParameter("singer_group_num")+",");
		System.out.println(
				"ArtistChanelInfoWrtieAction.java singer_group_num : " + infoMulti.getParameter("singer_group_num"));
		
		// ArtistChanelDAO 객체 생성
		ArtistChanelInfoDAO acidao = new ArtistChanelInfoDAO();

		// 정보 글쓰기 메소드 구현 및 실행(호출)
		acidao.infoWrite(acibean);

		/*-------------------------------------------------------*/
		/* 페이지 연결 */
		/*-------------------------------------------------------*/

		// 아티스트 정보 - 번호
		int artist = acidao.getArtistChanelInfoNum();
	
		// 페이지 이동
		// /ArtistChanelInfoWrtieAction.asp
		ActionForward forward = new ActionForward();

		forward.setPath("./ArtistChanel.ac?artist=" + artist);
		forward.setRedirect(true);

		return forward;
	}
}