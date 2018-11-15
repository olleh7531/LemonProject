package com.lemon.admin.music.db;

import java.sql.Date;

public class AlbumBean {
	private String al_name;
	private Date al_release;
	private String al_art_img;
	private String al_agency;
	private String al_content;
	private String al_singer_name;
	
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
	public String getAl_singer_name() {
		return al_singer_name;
	}
	public void setAl_singer_name(String al_singer_name) {
		this.al_singer_name = al_singer_name;
	}
	
}
