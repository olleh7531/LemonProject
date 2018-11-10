<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Random r=new Random();

for(int i=0;i<49;i++){
	for(int j=1;j<11;j++){
		if(i==0&&j==1){
			System.out.println("insert into chart values");
	System.out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_FORMAT(NOW(),'%Y-%m-%d %H')),");
		}else if(i==0){
	System.out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_FORMAT(NOW(),'%Y-%m-%d %H')),");			
		}else if(i<48||(i==48&&j!=10)){			
	System.out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR)),");
		}else if(j==10){
	System.out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR));");
		}
	
		
	}
}







%>
</body>
</html>