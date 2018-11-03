<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    String nickname = request.getParameter("nickname");
	MemberDAO mdao = new MemberDAO();
    
	int check = 0;
    String str = "";
    if(nickname == null){
        nickname = "";
    }
    
    if(!nickname.equals("")){
        check = mdao.checkNick(nickname);
    }
    if(check == 1){ // 이미 존재하는 계정
        str = "NO";
        out.print(str);
    
    }else{ // 사용가능한 계정
        str = "YES";
        out.print(str);
    }
%>
