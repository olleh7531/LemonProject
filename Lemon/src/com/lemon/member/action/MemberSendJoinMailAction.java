package com.lemon.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.lemon.member.mail.SMTPAuthenticator;

import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.Address;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import java.util.Properties;
import java.util.Random;


public class MemberSendJoinMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberSendJoinMailAction의 execute 호출");
		String email_id = request.getParameter("email_id");
//		String code = request.getParameter("code");

		System.out.println("email_id : "+email_id);
//		System.out.println("code : "+code);

 		
 		/*난수 생성*/
 		StringBuffer temp = new StringBuffer();
		
		Random rnd = new Random();
		for (int i = 0; i < 6; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		} 
		
		String code = temp.toString();
 		/*난수 생성*/
		
				
		/* DB에 code 값 저장 */
//		String email_id = (String)request.getAttribute("email_id");
//		System.out.println("email_id : " + email_id);
//		
//		MemberDAO mdao = new MemberDAO();
//		MemberBean mb = mdao.getMember(email_id);
//		
//		System.out.println("register_datetime : "+mb.getReg_date());
//		
//		String key = "iamaboyyouareagirl";
//		String text = email_id+mb.getReg_date();
//
//		System.out.println("text : "+text);
	
		//암호화
//		AES256Util aes256 = new AES256Util(key);
//		String code = aes256.aesEncode(text);
//
//		mdao.initMailAuth(code, email_id);
		/* DB에 code 값 저장 */

		
		/* Mail 보내기 */
		String from = "hongkongbaksa@gmail.com";
		String to = email_id;

		
		String subject = "안녕하세요, 레몬입니다.";

		String content="<table cellpadding='0' cellspacing='0' border='0' width='524' style='font-size:12px;text-align:left;margin:0 auto;'>";
		content += "<tbody><tr><td style='padding-bottom:14px;font-size:16px;color:#6377b9;font-weight:bold;'>안녕하세요, 고객님</td></tr>";
		content += "<tr><td style='padding:0 0 25px 4px;color:#666;line-height:150%;'>";
		content += "		회원가입을 위해 이메일 인증을 진행합니다.<br>";
		content += "		<b style='color:#ff6600;'>회원가입을 완료하시려면 아래 인증번호를 입력</b>하세요.";
		content += "	</td></tr>";
		content += "</tbody></table>";
		content += "<table cellpadding='1' cellspacing='0' border='0' width='524' bgcolor='#f5f5f5' style='font-size:12px;color:#666;text-align:left;border-top:1px solid #bfbfbf;border-bottom:1px solid #bfbfbf;margin:0 auto;'>";
		content += "<tr><td style='width:112px;color:#000;font-weight:bold;padding-left:20px;text-align:left;'>인증번호</td><td style='text-align:left;background-color:#ffffff;padding:8px 0 8px 20px;'>";	
		content += "<p style='word-break:break-all;word-wrap:break-word;line-height:140%;margin:0;'>";
		content += code;
		content += "			</a>";
		content += "			</p>";
		content += "	</td></tr>";
		content += "</table>";
		
		//정보담기 위해 객체 설정
		Properties p = new Properties();
		
		// SMTP 서버의 계정 설정
		p.put("mail.smtp.user", from);

		// SMTP 서버 정보 설정
		// Google일 경우 smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		
		// 아래 정보는 네이버와 구글이 동일
		p.put("mail.smtp.port", "465"); 
		// 반드시 true 
		p.put("mail.smtp.auth", "true"); 
		p.put("mail.smtp.debug", "true"); 
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false");

		request.setAttribute("email_id", email_id);
		request.setAttribute("code", code);
		
		try{
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p,auth);
			
			ses.setDebug(true);
			
			MimeMessage msg = new MimeMessage(ses);
			// 제목 설정
		    msg.setSubject(subject);
		    
		    // 보내는 사람의 메일주소
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);		        
		        
		    // 받는 사람의 메일주소
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    
		    // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		    msg.setContent(content, "text/html;charset=UTF-8");
		        
		    // 발송하기
		    Transport.send(msg);
		    
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(code);
		    		    
		} catch (Exception e) {
		    e.printStackTrace();
		    
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
		    out.print("fail");
		    return null;
			
		}

		/* Mail 보내기 */
				
		return null;
	}

}
