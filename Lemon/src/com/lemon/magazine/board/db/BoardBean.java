package com.lemon.magazine.board.db;

import java.sql.Date;

public class BoardBean {

	// num
	// subject
	// category
	// content
	// readcount
	// date
	// file
	
	/*
	 CREATE TABLE 'magazine'(
	  `num` INT NOT NULL,
	  `subject` VARCHAR(50) NULL,
	  `category` VARCHAR(20) NULL,
	  `content` VARCHAR(2000) NULL,
	  `readcount` INT NULL,
	  `date` DATE NULL,
	  `file` VARCHAR(45) NULL,
	  PRIMARY KEY (`num`));
	 */
	
	
	private int num;
	private String subject;
	private String category;
	private String content;
	private int readcount;
	private Date date;
	private String file;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setCategory(String category){
		this.category = category;
	}
	public String getCategory(){
		return category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	
	
}
