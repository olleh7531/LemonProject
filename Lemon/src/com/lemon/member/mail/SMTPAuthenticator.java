package com.lemon.member.mail;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator{
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hongkongbaksa@gmail.com", "qwerty@2");
	}
}
