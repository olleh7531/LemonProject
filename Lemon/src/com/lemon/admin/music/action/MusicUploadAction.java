package com.lemon.admin.music.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;

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
			String musicfile = (String)files.nextElement();

			System.out.println(musicfile);
			File f = multi.getFile(musicfile);
			MP3File mp3 = (MP3File) AudioFileIO.read(f);

			AbstractID3v2Tag tag2 = mp3.getID3v2Tag();

			Tag tag = mp3.getTag();
			String title = tag.getFirst(FieldKey.TITLE);
			String artist = tag.getFirst(FieldKey.ARTIST);
			String album = tag.getFirst(FieldKey.ALBUM);
			String year = tag.getFirst(FieldKey.YEAR);
			String genre = tag.getFirst(FieldKey.GENRE);
			String Lyrics = tag.getFirst(FieldKey.LYRICS);
			String a18 = tag.getFirst(FieldKey.COVER_ART);
		

			// System.out.println("Tag : " + tag2);
			System.out.println("Song Name : " + title);
			System.out.println("Artist : " + artist);
			System.out.println("Album : " + album);
			System.out.println("Year : " + year);
			System.out.println("Genre : " + genre);
			System.out.println("Lyrics : " + Lyrics);
			System.out.println("a18"+a18);
	

			

/*			String musicinfor = infor.nextElement();
			musicinfor = multi.getParameter(musicinfor);
			amb.setMusicfile(musicfile);
			String[] musicarr=musicinfor.split(",");
			amb.setAlbum_num(Integer.parseInt(musicarr[0]));
			amb.setTrack_num(Integer.parseInt(musicarr[1]));
			amb.setMusic_name((musicarr[2]));
			amb.setSinger_name((musicarr[3]));
			amb.setLyrics((musicarr[4]));*/

//			amdao.insertMusic(amb);
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(1);

		return null;
	}
}