package com.lemon.admin.music.action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jaudiotagger.audio.AudioFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.jaudiotagger.tag.images.Artwork;

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

		AMusicBean amb = new AMusicBean();
		AMusicDAO amdao = new AMusicDAO();
		while (files.hasMoreElements()) {
			String musicfile = (String)files.nextElement();

			System.out.println(musicfile);
			File f = multi.getFile(musicfile);
			MP3File mp3 = (MP3File) AudioFileIO.read(f);
			AudioFile af = AudioFileIO.read(f);
			
			Tag tag = mp3.getTag();
			String title = tag.getFirst(FieldKey.TITLE);
			String artist = tag.getFirst(FieldKey.ARTIST);
			String album = tag.getFirst(FieldKey.ALBUM);
			String year = tag.getFirst(FieldKey.YEAR);
			String genre = tag.getFirst(FieldKey.GENRE);
			String Lyrics = tag.getFirst(FieldKey.LYRICS);
			String track = tag.getFirst(FieldKey.TRACK);
			String a18 = tag.getFirst(FieldKey.COVER_ART);
			musicfile = multi.getFilesystemName(musicfile);

			System.out.println("musicfile : " + musicfile);
			System.out.println("Song Name : " + title);
			System.out.println("Artist : " + artist);
			System.out.println("Album : " + album);
			System.out.println("Year : " + year);
			System.out.println("Genre : " + genre);
			System.out.println("Lyrics : " + Lyrics);
			System.out.println("a18"+a18);
			System.out.println("track : "+track);
					
			int duration = af.getAudioHeader().getTrackLength();
			int minute = duration/60;
			int second = duration%60;
			String musictime;
			if(second<10){				
				musictime=minute+":0"+second;
			}else{
				musictime=minute+":"+second;
			}
			
			System.out.println("음악 길이 : "+musictime);
	

			Artwork art = tag.getFirstArtwork();
			System.out.println("art1 : "+art);
			System.out.println("art3 : "+art.getHeight());
			System.out.println("art5 : "+art.getMimeType());
			System.out.println("art6 : "+art.getPictureType());
			System.out.println("art7 : "+art.getWidth());
			System.out.println("art8 : "+art.getBinaryData());
			System.out.println("art9 : "+art.getImage());
			album=album.replace("?", "");
			BufferedImage thumb = new BufferedImage(1024,1024,BufferedImage.TYPE_INT_RGB);
			Graphics2D g=thumb.createGraphics();
			g.drawImage((BufferedImage)art.getImage(), 0, 0, 1024,1024,null);
			File filex = new File("C:/Users/itwill/Desktop"+album+".jpg");
			ImageIO.write(thumb, "jpg", filex );
			

/*			amb.setMusic_name(title);
			amb.setLyrics(Lyrics);
			amb.setMusicfile(musicfile);
			amb.setMusic_genre(genre);
			amb.setMusic_time(musictime);
			amb.setTrack_num(Integer.parseInt(track));*/

//			amdao.insertMusic(amb);
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(1);

		return null;
	}
}