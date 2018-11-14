package com.lemon.magazine.board.db;

import java.sql.Date;

public class BoardBean {

	// ma_num
	// ma_subject
	// ma_category
	// ma_content
	// ma_readcount
	// ma_date

	/*
	 * CREATE TABLE 'magazine'( `ma_num` INT NOT NULL, `ma_subject` VARCHAR(50)
	 * NULL, `ma_category` VARCHAR(20) NULL, `ma_content` VARCHAR(2000) NULL,
	 * `ma_readcount` INT NULL, `ma_date` DATE NULL, PRIMARY KEY (`num`));
	 */

	private int ma_num;
	private String ma_subject;
	private String ma_category;
	private String ma_content;
	private int ma_readcount;
	private Date ma_date;
	private String ma_file;

	public int getMa_Num() {
		return ma_num;
	}

	public void setMa_num(int ma_num) {
		this.ma_num = ma_num;
	}

	public String getMa_subject() {
		return ma_subject;
	}

	public void setMa_subject(String ma_subject) {
		this.ma_subject = ma_subject;
	}

	public void setMa_category(String ma_category) {
		this.ma_category = ma_category;
	}

	public String getMa_category() {
		return ma_category;
	}

	public String getMa_content() {
		return ma_content;
	}

	public void setMa_content(String ma_content) {
		this.ma_content = ma_content;
	}

	public int getMa_readcount() {
		return ma_readcount;
	}

	public void setMa_readcount(int ma_readcount) {
		this.ma_readcount = ma_readcount;
	}

	public Date getMa_date() {
		return ma_date;
	}

	public void setMa_date(Date ma_date) {
		this.ma_date = ma_date;
	}

	public String getMa_file() {
		return ma_file;
	}

	public void setMa_file(String ma_file) {
		this.ma_file = ma_file;
	}

	public int getMa_num() {
		return ma_num;
	}

}
