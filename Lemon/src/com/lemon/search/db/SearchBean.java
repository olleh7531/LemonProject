package com.lemon.search.db;

import java.sql.Date;

public class SearchBean {

	/* album */
	private int al_num;
	private String al_name;
//	private Date al_release;
//	private String al_art_img;
//	private String al_agency;
//	private String al_content;
	
	/* music */
	private int mu_num;
	private String music_name;
	private String lyrics;
//	private String musicfile;
//	private String music_genre;
//	private String music_time;
	private int singer_num;
	private int album_num;
//	private int track_num;
//	private String music_video;

	/*music-good*/
//	private int mu_good;
	
	/*singer*/
	private int si_num; // 가수 번호
//	private String activity_type; // 솔로/그룹 유형
	private String singer_name; // 가수 활동 이름(예명)
//	private String real_name; // 본명
//	private Date debut_year; // 데뷔 날짜
//	private String debut_song; // 데뷔 노래
//	private String si_agency; // 소속사 이름
//	private String si_picture; // 프로필 사진
//	private String si_genre; // 노래 장르
//	private Date si_birth; // 생일
//	private String si_gender; // 성별
//	private String group_singer_num; // 그룹 번호
//	private String group_singer_name;
	
	public int getAl_num() {
		return al_num;
	}
	public void setAl_num(int al_num) {
		this.al_num = al_num;
	}
	public String getAl_name() {
		return al_name;
	}
	public void setAl_name(String al_name) {
		this.al_name = al_name;
	}
	public int getMu_num() {
		return mu_num;
	}
	public void setMu_num(int mu_num) {
		this.mu_num = mu_num;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public int getSinger_num() {
		return singer_num;
	}
	public void setSinger_num(int singer_num) {
		this.singer_num = singer_num;
	}
	public int getAlbum_num() {
		return album_num;
	}
	public void setAlbum_num(int album_num) {
		this.album_num = album_num;
	}
	public int getSi_num() {
		return si_num;
	}
	public void setSi_num(int si_num) {
		this.si_num = si_num;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	
	

}
