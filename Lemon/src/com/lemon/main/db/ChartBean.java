package com.lemon.main.db;

import java.sql.Timestamp;

public class ChartBean {
	private int ch_num;
	private int ch_music_num;
	private int ch_playcnt;
	private int ch_downcnt;
	private Timestamp ch_updatetime;
	private String music_name;
	private int ch_ranking;
	private String singer_name;
	
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public int getCh_num() {
		return ch_num;
	}
	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}
	public int getCh_music_num() {
		return ch_music_num;
	}
	public void setCh_music_num(int ch_music_num) {
		this.ch_music_num = ch_music_num;
	}
	public int getCh_playcnt() {
		return ch_playcnt;
	}
	public void setCh_playcnt(int ch_playcnt) {
		this.ch_playcnt = ch_playcnt;
	}
	public int getCh_downcnt() {
		return ch_downcnt;
	}
	public void setCh_downcnt(int ch_downcnt) {
		this.ch_downcnt = ch_downcnt;
	}
	public Timestamp getCh_updatetime() {
		return ch_updatetime;
	}
	public void setCh_updatetime(Timestamp ch_updatetime) {
		this.ch_updatetime = ch_updatetime;
	}
	public int getCh_ranking() {
		return ch_ranking;
	}
	public void setCh_ranking(int ch_ranking) {
		this.ch_ranking = ch_ranking;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}

	
	
}
