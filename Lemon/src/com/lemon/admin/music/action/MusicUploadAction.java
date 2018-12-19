package com.lemon.admin.music.action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jaudiotagger.audio.AudioFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.jaudiotagger.tag.images.Artwork;

import com.lemon.admin.music.db.MusicBean;
import com.lemon.admin.music.db.MusicDAO;
import com.lemon.admin.music.db.AlbumBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MusicUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MusicUploadAction execute()~~~~");

		ServletContext ctx = request.getSession().getServletContext();
		String realpath = ctx.getRealPath("/musicUpload/music");
		System.out.println("realpath : " + realpath);

		int maxSize = 100 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		Enumeration<String> files = multi.getFileNames();
		
		MusicBean mb = new MusicBean();
		MusicDAO mdao = new MusicDAO();
		AlbumBean ab = new AlbumBean();
		while (files.hasMoreElements()) {
			String musicfile = (String) files.nextElement();
			
			// System.out.println(musicfile);
			File f = multi.getFile(musicfile);
			MP3File mp3 = (MP3File) AudioFileIO.read(f);
			AudioFile af = AudioFileIO.read(f);
			
			Tag tag = mp3.getTag();
			String title = tag.getFirst(FieldKey.TITLE);
			String artist = tag.getFirst(FieldKey.ARTIST);
			String album = tag.getFirst(FieldKey.ALBUM);
			album = album.replace("?", "");
			album = album.replace("*", "");
			album = album.replace(":", "");
			album = album.replace("#", "");
			album = album.trim();
			String year = tag.getFirst(FieldKey.YEAR);
			if (year.length() < 8) {
				year = "20180229";
				// 2월29일(실제로 존재하지 않는 날) 로 설정된 앨범에 대해서는 따로 발매일 업데이트 해주어야함
			}else if(year.length() > 8){
				year=year.substring(0,10);
			}
			year = year.replace(".", "");
			year = year.trim();
			year = Integer.toString(Integer.parseInt(year) + 1);
			String genre = tag.getFirst(FieldKey.GENRE);
			String Lyrics = tag.getFirst(FieldKey.LYRICS);
			String track = tag.getFirst(FieldKey.TRACK);
			musicfile = multi.getFilesystemName(musicfile);
			
			
			 System.out.println("musicfile : " + musicfile);
			 System.out.println("Song Name : " + title);
			 System.out.println("Artist : " + artist);
			 System.out.println("Album : " + album);
			 System.out.println("Year : " + year);
			 System.out.println("Genre : " + genre);
			 System.out.println("Lyrics : " + Lyrics);
			 System.out.println("track : "+track);
			 
			
			int duration = af.getAudioHeader().getTrackLength();
			// int minute = duration/60;
			// int second = duration%60;
			String musictime = String.valueOf(duration);
			// if(second<10){
			// musictime=minute+":0"+second;
			// }else{
			// musictime=minute+":"+second;
			// }

			// System.out.println("음악 길이 : "+musictime);
			
			Artwork art = tag.getFirstArtwork();
			BufferedImage bi = (BufferedImage) art.getImage();
			BufferedImage thumb = new BufferedImage(bi.getWidth(), bi.getHeight(), BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumb.createGraphics();
			g.drawImage((BufferedImage) art.getImage(), 0, 0, bi.getWidth(), bi.getHeight(), null);
			realpath = ctx.getRealPath("/musicUpload/albumcover/");
			File filex = new File(realpath + album + ".jpg");
			ImageIO.write(thumb, "jpg", filex);
			
			ab.setAl_name(album);
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Date d = new Date(format.parse(year).getTime());
			ab.setAl_release(d);
			ab.setAl_art_img(album + ".jpg");
			ab.setAl_singer_name(artist);
			
			mb.setMusic_name(title);
			mb.setLyrics(Lyrics);
			mb.setMusicfile(musicfile);
			mb.setMusic_genre(genre);
			mb.setMusic_time(musictime);
			mb.setTrack_num(Integer.parseInt(track));
			
			int albumnum = mdao.insertAlbum(ab);
			
			mb.setAlbum_num(albumnum);
			mdao.insertMusic(mb);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(1);
		
		return null;
	}
}