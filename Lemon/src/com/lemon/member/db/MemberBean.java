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
	private Date reg_date;
	private String reg_ip;
	
	
	private Date level_updatetime;
	private int is_deny;
	private int chk;
	
	private String mobile;
	private String zip_code;
	private String address1;
	private String address2;
	private int email_cert;
	private int receive_email;
	
	private String code;
	
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
	public Date getLevel_updatetime() {
		return level_updatetime;
	}
	public void setLevel_updatetime(Date level_updatetime) {
		this.level_updatetime = level_updatetime;
	}
	public int getIs_deny() {
		return is_deny;
	}
	public void setIs_deny(int is_deny) {
		this.is_deny = is_deny;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getEmail_cert() {
		return email_cert;
	}
	public void setEmail_cert(int email_cert) {
		this.email_cert = email_cert;
	}
	public int getReceive_email() {
		return receive_email;
	}
	public void setReceive_email(int receive_email) {
		this.receive_email = receive_email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}