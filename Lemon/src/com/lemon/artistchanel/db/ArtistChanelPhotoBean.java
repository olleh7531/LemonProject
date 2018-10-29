package com.lemon.artistchanel.db;

import java.sql.Date;

public class ArtistChanelPhotoBean {
	/*
	 * CREATE TABLE `artist_photo`
	 * (
	 * 		`num` int(11) NOT NULL AUTO_INCREMENT, // 사진 번호
	 * 		`ar_subject` varchar(200) DEFAULT NULL, // 제목
	 * 		`ar_content` text, // 내용
	 * 		`ar_registerdate` date DEFAULT NULL, // 등록한 날짜
	 * 		`ar_readcount` int(11) DEFAULT NULL, // 조회수
	 * 		`ar_singer_num` int(11) NOT NULL, // 가수 번호
	 * 		PRIMARY KEY (`num`),
	 * 		CONSTRAINT `ar_singer_num_fk`
	 * 			FOREIGN KEY (`num`)
	 * 			REFERENCES `singer` (`num`)
	 * 			ON
	 * 				DELETE CASCADE ON UPDATE CASCADE
	 * )
	 * ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
	 * COLLATE=utf8mb4_0900_ai_ci
	 */
	
	private int num; // 번호
	private String ar_subject; // 제목
	private String ar_content; // 내용
	private Date ar_registerdate; // 등록한 날짜
	private int ar_readcount; // 조회수
	private int ar_singer_num; // 가수 번호
	
	public String getAr_subject() {
		return ar_subject;
	}
	public void setAr_subject(String ar_subject) {
		this.ar_subject = ar_subject;
	}
	public String getAr_content() {
		return ar_content;
	}
	public void setAr_content(String ar_content) {
		this.ar_content = ar_content;
	}
	public Date getAr_registerdate() {
		return ar_registerdate;
	}
	public void setAr_registerdate(Date ar_registerdate) {
		this.ar_registerdate = ar_registerdate;
	}
	public int getAr_readcount() {
		return ar_readcount;
	}
	public void setAr_readcount(int ar_readcount) {
		this.ar_readcount = ar_readcount;
	}
	public int getAr_singer_num() {
		return ar_singer_num;
	}
	public void setAr_singer_num(int ar_singer_num) {
		this.ar_singer_num = ar_singer_num;
	}	
}