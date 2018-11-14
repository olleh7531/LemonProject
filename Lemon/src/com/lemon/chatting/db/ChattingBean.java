package com.lemon.chatting.db;

import java.util.Date;

public class ChattingBean {
	private int con_num;
	private String con_sender;
	private String con_receiver;
	private String con_content;
	private Date sendtime;
	private int channel;

	public int getCon_num() {
		return con_num;
	}

	public void setCon_num(int con_num) {
		this.con_num = con_num;
	}

	public String getCon_sender() {
		return con_sender;
	}

	public void setCon_sender(String con_sender) {
		this.con_sender = con_sender;
	}

	public String getCon_receiver() {
		return con_receiver;
	}

	public void setCon_receiver(String con_receiver) {
		this.con_receiver = con_receiver;
	}

	public String getCon_content() {
		return con_content;
	}

	public void setCon_content(String con_content) {
		this.con_content = con_content;
	}

	public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public int getChannel() {
		return channel;
	}

	public void setChannel(int channel) {
		this.channel = channel;
	}

}
