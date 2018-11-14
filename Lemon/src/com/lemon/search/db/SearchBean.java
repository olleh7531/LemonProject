package com.lemon.search.db;

import java.sql.Date;

public class SearchBean {

	/* album */
	private int al_num;
	private String al_name;
	private Date al_release;
	private String al_art_img;
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
	private String activity_type; // 솔로/그룹 유형
	private String singer_name; // 가수 활동 이름(예명)
	private String real_name; // 본명
	private Date debut_year; // 데뷔 날짜
	private String debut_song; // 데뷔 노래
	private String si_agency; // 소속사 이름
	private String si_picture; // 프로필 사진
	private String si_genre; // 노래 장르
	private Date si_birth; // 생일
	private String si_gender; // 성별
	private String group_singer_num; // 그룹 번호
	
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
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public Date getDebut_year() {
		return debut_year;
	}
	public void setDebut_year(Date debut_year) {
		this.debut_year = debut_year;
	}
	public String getDebut_song() {
		return debut_song;
	}
	public void setDebut_song(String debut_song) {
		this.debut_song = debut_song;
	}
	public String getSi_agency() {
		return si_agency;
	}
	public void setSi_agency(String si_agency) {
		this.si_agency = si_agency;
	}
	public String getSi_picture() {
		return si_picture;
	}
	public void setSi_picture(String si_picture) {
		this.si_picture = si_picture;
	}
	public String getSi_genre() {
		return si_genre;
	}
	public void setSi_genre(String si_genre) {
		this.si_genre = si_genre;
	}
	public Date getSi_birth() {
		return si_birth;
	}
	public void setSi_birth(Date si_birth) {
		this.si_birth = si_birth;
	}
	public String getSi_gender() {
		return si_gender;
	}
	public void setSi_gender(String si_gender) {
		this.si_gender = si_gender;
	}
	public String getGroup_singer_num() {
		return group_singer_num;
	}
	public void setGroup_singer_num(String group_singer_num) {
		this.group_singer_num = group_singer_num;
	}
	public Date getAl_release() {
		return al_release;
	}
	public void setAl_release(Date al_release) {
		this.al_release = al_release;
	}
	public String getAl_art_img() {
		return al_art_img;
	}
	public void setAl_art_img(String al_art_img) {
		this.al_art_img = al_art_img;
	}
	
	

}
