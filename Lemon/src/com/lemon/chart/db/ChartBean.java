package com.lemon.chart.db;

import java.sql.Date;

public class ChartBean {

	/* album */
	private int al_num;
	private String al_name;
	private Date al_release;
	private String al_art_img;
	private String al_agency;
	private String al_content;
	
	/* music */
	private int mu_num;
	private String music_name;
	private String lyrics;
	private String musicfile;
	private String music_genre;
	private String music_time;
	private int singer_num;
	private int album_num;
	private int track_num;
	private String music_video;

	/*music-good*/
	private int mu_good;
	
	/* album */
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

	public String getAl_agency() {
		return al_agency;
	}

	public void setAl_agency(String al_agency) {
		this.al_agency = al_agency;
	}

	public String getAl_content() {
		return al_content;
	}

	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}

	/* music */
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

	public String getMusicfile() {
		return musicfile;
	}

	public void setMusicfile(String musicfile) {
		this.musicfile = musicfile;
	}

	public String getMusic_genre() {
		return music_genre;
	}

	public void setMusic_genre(String music_genre) {
		this.music_genre = music_genre;
	}

	public String getMusic_time() {
		return music_time;
	}

	public void setMusic_time(String music_time) {
		this.music_time = music_time;
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

	public int getTrack_num() {
		return track_num;
	}

	public void setTrack_num(int track_num) {
		this.track_num = track_num;
	}

	public String getMusic_video() {
		return music_video;
	}

	public void setMusic_video(String music_video) {
		this.music_video = music_video;
	}
	/*music-good*/

	public int getMu_good() {
		return mu_good;
	}

	public void setMu_good(int mu_good) {
		this.mu_good = mu_good;
	}
	
	
}
