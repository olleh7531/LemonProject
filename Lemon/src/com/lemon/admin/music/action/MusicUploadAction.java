package com.lemon.admin.music.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.admin.music.db.AMusicBean;
import com.lemon.admin.music.db.AMusicDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MusicUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MusicUploadAction execute()~~~~");

		String realpath = request.getRealPath("/musicUpload");
		System.out.println("realpath : " + realpath);

		int maxSize = 100 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		Enumeration<String> files = multi.getFileNames();
		Enumeration<String> infor = multi.getParameterNames();

		AMusicBean amb = new AMusicBean();
		AMusicDAO amdao = new AMusicDAO();
		while (files.hasMoreElements()) {

			String musicfile = files.nextElement();
			musicfile = multi.getFilesystemName(musicfile);
			String musicinfor = infor.nextElement();
			musicinfor = multi.getParameter(musicinfor);
			amb.setMusicfile(musicfile);
			String[] musicarr=musicinfor.split(",");
			amb.setAlbum_num(Integer.parseInt(musicarr[0]));
			amb.setTrack_num(Integer.parseInt(musicarr[1]));
			amb.setMusic_name((musicarr[2]));
			amb.setSinger_name((musicarr[3]));
			amb.setLyrics((musicarr[4]));

			amdao.insertMusic(amb);
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(1);

		return null;
	}
}