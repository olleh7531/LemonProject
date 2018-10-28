package com.lemon.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.member.auth.AES256Util;
import com.lemon.member.db.MemberBean;
import com.lemon.member.db.MemberDAO;

public class MemberJoinAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinAuthAction의 execute 호출");
				
		/* DB에 code, email_cert 값 저장 */
		String email_id = (String)request.getAttribute("email_id");
		String pass = (String)request.getAttribute("pass");
		
		String key = "iamaboyyouareagirl";
		String text = pass;

		AES256Util aes256 = new AES256Util(key);
		String code = aes256.aesEncode(text);
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.initMailAuth(code, email_id);
		/* DB에 code, email_cert 값 저장 */
		
		
		/* Mail 보내기 */
		String from = "delaybu@gmail.com";
		String to = email_id;

		
		/* Mail 보내기 */

		return null;
	}

}
