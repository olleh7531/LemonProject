package com.lemon.admin.starpost.action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.admin.starpost.db.AStarPostBean;
import com.lemon.admin.starpost.db.AStarPostDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AStarPostInfoWrtieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AStarPostInfoWrtieAction.java execute()");
		
		// 파일 업로드
		// upload/starpost/singerProfile 폴더 생성
		// 업로드 할 실제 서버 경로를 가져오기
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/upload/starpost/singerProfile");
		System.out.println("AStarPostInfoWrtieAction.java context : " + context);
		System.out.println("AStarPostInfoWrtieAction.java realPath : " + realPath);

		// 한번에 업로드할 파일의 최대 용량 지정 
		int maxSize = 10*1024*1024; // 10MB

		// MultipartRequest 객체 생성
		MultipartRequest multi = new MultipartRequest(
			request, // form 태그에서 가져온 파일, 텍스트 정보를 가져오기 위해서 , request 영역의 데이터를 전달
			realPath, // 업로드 파일의 위치
			maxSize, // 업로드할 파일의 최대 크기 지정
			"UTF-8", // 파일 이름이 한글처리 인코딩 처리 (UTF-8)
			new DefaultFileRenamePolicy() // 똑같은 파일이름에 대해서 업로드시 자동으로 파일이름을 변경해주는 객체
		);
		
		// 정보 -> JSP 페이지 -> Controller -> Action -> DB
		// DB - 자바빈(AStarPostBean), 처리(AStarPostDAO) / singer 테이블 생성
		AStarPostBean aspbean = new AStarPostBean();
		
		// Data 포맷 설정
		SimpleDateFormat format = new SimpleDateFormat("yy-mm-dd"); 
		
		// 데이터 넣기
		aspbean.setNum(Integer.parseInt(multi.getParameter("num"))); // 가수 번호
		aspbean.setActivity_type(multi.getParameter("activity_type")); // 솔로/그룹 유형
		aspbean.setSinger_name(multi.getParameter("singer_name")); // 가수 활동 이름(예명)
		aspbean.setSi_group_name(multi.getParameter("si_group_name")); // 소속 그룹 이름
		  
		// 데뷔 날짜
        Date debut_year = new Date(format.parse(multi.getParameter("debut_year")).getTime());
        aspbean.setDebut_year(debut_year);
		
        aspbean.setDebut_song(multi.getParameter("debut_song")); // 데뷔 노래
        aspbean.setSi_agency(multi.getParameter("si_agency")); // 소속사 이름
		
		// 프로필 사진
        aspbean.setSi_picture(multi.getFilesystemName("si_picture"));
		System.out.println("upload 폴더에 올라가있는 파일 이름 : " + multi.getFilesystemName("si_picture"));
		System.out.println("사용자 올린 파일의 원본이름 : "+multi.getOriginalFileName("si_picture"));
		
		aspbean.setSi_genre(multi.getParameter("si_genre")); // 노래 장르
		
		// 생일
		Date si_birth = new Date(format.parse(multi.getParameter("si_birth")).getTime());
		aspbean.setSi_birth(si_birth); 
		
		// AStarPostDAO 객체 생성
		AStarPostDAO aspdao = new AStarPostDAO();
		
		// 정보 글쓰기 메소드 구현 및 실행(호출)
		aspdao.infoWrite(aspbean);
		
		
		// 페이지 이동
		// /AStartPostInfoWriteAction.asp
		ActionForward forward = new ActionForward();
		
		forward.setPath("/AStartPostInfoWriteAction.asp");
		forward.setRedirect(true);
		
		return forward;
	}
}