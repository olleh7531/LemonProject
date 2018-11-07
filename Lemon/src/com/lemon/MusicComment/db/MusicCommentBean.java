package com.lemon.MusicComment.db;

import java.sql.Date;

public class MusicCommentBean {
	private int cmt_num; // 번호
	private int cmt_category; // 게시판 종류
	private int cmt_text_num; // 게시판 번호
	private String cmt_content; // 댓글
	private String cmt_email; // 작성자
	private Date cmt_timestamp; // 등록 날짜
	private String cmt_ip; // 아이피
	private int cmt_like; // 좋아요
	private int cmt_dislike; // 싫어요
	private int cmt_blame; // 신고

	public int getCmt_num() {
		return cmt_num;
	}

	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}

	public int getCmt_category() {
		return cmt_category;
	}

	public void setCmt_category(int cmt_category) {
		this.cmt_category = cmt_category;
	}

	public int getCmt_text_num() {
		return cmt_text_num;
	}

	public void setCmt_text_num(int cmt_text_num) {
		this.cmt_text_num = cmt_text_num;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCmt_email() {
		return cmt_email;
	}

	public void setCmt_email(String cmt_email) {
		this.cmt_email = cmt_email;
	}

	public Date getCmt_timestamp() {
		return cmt_timestamp;
	}

	public void setCmt_timestamp(Date cmt_timestamp) {
		this.cmt_timestamp = cmt_timestamp;
	}

	public String getCmt_ip() {
		return cmt_ip;
	}

	public void setCmt_ip(String cmt_ip) {
		this.cmt_ip = cmt_ip;
	}

	public int getCmt_like() {
		return cmt_like;
	}

	public void setCmt_like(int cmt_like) {
		this.cmt_like = cmt_like;
	}

	public int getCmt_dislike() {
		return cmt_dislike;
	}

	public void setCmt_dislike(int cmt_dislike) {
		this.cmt_dislike = cmt_dislike;
	}

	public int getCmt_blame() {
		return cmt_blame;
	}

	public void setCmt_blame(int cmt_blame) {
		this.cmt_blame = cmt_blame;
	}

}
