package com.lemon.admin.music.db;

public class AMusicBean {
	private int track_num;
	private String music_name;
	private String singer_name;
	private String lyrics;
	private int album_num;
	private String musicfile;
	public int getTrack_num() {
		return track_num;
	}
	public void setTrack_num(int track_num) {
		this.track_num = track_num;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public int getAlbum_num() {
		return album_num;
	}
	public void setAlbum_num(int album_num) {
		this.album_num = album_num;
	}
	public String getMusicfile() {
		return musicfile;
	}
	public void setMusicfile(String musicfile) {
		this.musicfile = musicfile;
	}
}
