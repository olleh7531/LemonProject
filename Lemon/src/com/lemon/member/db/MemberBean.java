package com.lemon.member.db;

import java.util.Date;

public class MemberBean {
	private String email_id;
	private String pass;
	private String name;
	private String nickname;
	private String gender;
	private String birth;
	private int level;
	private String img;
	private int no;
	private Date reg_date;
	private String reg_ip;
	private int is_deny;
	private int chk;
	
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_ip() {
		return reg_ip;
	}
	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}
	public int getIs_deny() {
		return is_deny;
	}
	public void setIs_deny(int is_deny) {
		this.is_deny = is_deny;
	}
	public int getchk() {
		return chk;
	}
	public void setchk(int chk) {
		this.chk = chk;
	}
}