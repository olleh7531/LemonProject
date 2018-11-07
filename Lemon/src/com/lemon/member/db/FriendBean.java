package com.lemon.member.db;

public class FriendBean {
	private int fr_num;
	private String receiver_nick;
	private String sender_nick;
	private int check;
	
	
	public int getFr_num() {
		return fr_num;
	}
	public void setFr_num(int fr_num) {
		this.fr_num = fr_num;
	}
	public String getReceiver_nick() {
		return receiver_nick;
	}
	public void setReceiver_nick(String receiver_nick) {
		this.receiver_nick = receiver_nick;
	}
	public String getSender_nick() {
		return sender_nick;
	}
	public void setSender_nick(String sender_nick) {
		this.sender_nick = sender_nick;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
}