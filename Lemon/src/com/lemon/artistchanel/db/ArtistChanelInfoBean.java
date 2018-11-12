package com.lemon.artistchanel.db;

import java.sql.Date;

public class ArtistChanelInfoBean {
	/*
	 * CREATE TABLE `singer`
	 * (
	 * 		`si_num` int(11) NOT NULL AUTO_INCREMENT,
	 * 		`activity_type` varchar(10) NOT NULL,
	 * 		`singer_name` varchar(200) DEFAULT NULL,
	 * 		`real_name` varchar(200) DEFAULT NULL,
	 * 		`debut_year` date DEFAULT NULL,
	 * 		`debut_song` varchar(100) DEFAULT NULL,
	 * 		`si_agency` varchar(100) DEFAULT NULL,
	 * 		`si_picture` varchar(200) DEFAULT NULL,
	 * 		`si_genre` text,
	 * 		`si_birth` date DEFAULT NULL,
	 * 		`si_gender` varchar(5) DEFAULT NULL,
	 * 		`group_singer_num` text,
	 * 		PRIMARY KEY (`si_num`)
	 * )
	 * ENGINE=InnoDB
	 * 		DEFAULT CHARSET=utf8mb4
	 * 			COLLATE=utf8mb4_0900_ai_ci
	 */

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
	
	// DB에 없음 -> 그룹 이름때문에 추가
	private String group_singer_name; // 그룹 이름
	
	public int getSi_num() {
		return si_num;
	}

	public void setSi_num(int si_num) {
		this.si_num = si_num;
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

	public String getGroup_singer_name() {
		return group_singer_name;
	}

	public void setGroup_singer_name(String group_singer_name) {
		this.group_singer_name = group_singer_name;
	}
}