package com.lemon.artistchanel.db;

import java.sql.Date;

public class ArtistChanelInfoBean {
	/*
	 * CREATE TABLE `singer` (
	 * 		`num` int(11) NOT NULL AUTO_INCREMENT,
	 * 		`activity_type` varchar(10) NOT NULL,
	 * 		`singer_name` varchar(200) NOT NULL,
	 * 		`si_group_name` varchar(200) DEFAULT NULL,
	 * 		`debut_year` date DEFAULT NULL,
	 * 		`debut_song` varchar(100) DEFAULT NULL,
	 * 		`si_agency` varchar(100) DEFAULT NULL,
	 * 		`si_picture` varchar(200) DEFAULT NULL,
	 * 		`si_genre` text,
	 * 		`si_birth` date DEFAULT NULL,
	 * 		PRIMARY KEY (`num`)
	 * )
	 * ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
	 */

	private int num; // 가수 번호
	private String activity_type; // 솔로/그룹 유형
	private String singer_name; // 가수 활동 이름(예명)
	private String si_group_name; // 소속 그룹 이름
	private Date debut_year; // 데뷔 날짜
	private String debut_song; // 데뷔 노래
	private String si_agency; // 소속사 이름
	private String si_picture; // 프로필 사진
	private String si_genre; // 노래 장르
	private Date si_birth; // 생일
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}
	public String getSi_group_name() {
		return si_group_name;
	}
	public void setSi_group_name(String si_group_name) {
		this.si_group_name = si_group_name;
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
}