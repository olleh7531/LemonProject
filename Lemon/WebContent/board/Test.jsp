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
		Random r = new Random();

		// chart(music) 임시 데이터 생성

		/* for(int i=0;i<49;i++){
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
		} */

		// searchchart 임시데이터 생성
		System.out.println("insert into search_chart values");
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < 12; j++) {
				int rr = r.nextInt(250) + 51;
				int a = r.nextInt(rr) + 1;
				int b = rr - a;
				int v = rr / ((r.nextInt(7) + 1)*10);
				int w = (rr-v) / (r.nextInt(4) + 2);
				int z = rr / (r.nextInt(1) + 4);
				int y = (rr-(v + w + z)) / (r.nextInt(2)+2);
				int x = rr - (v + w + y + z);
				switch (j) {
				case 0:
					System.out.println("(null,'아이유',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'아이유',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 1:
					System.out.println("(null,'테스트',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'테스트',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 2:
					System.out.println("(null,'방탄',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'방탄',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 3:
					System.out.println("(null,'시간',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'시간',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 4:
					System.out.println("(null,'없다',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'없다',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 5:
					System.out.println("(null,'시작',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'시작',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 6:
					System.out.println("(null,'단어',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'단어',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 7:
					System.out.println("(null,'하루',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'하루',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 8:
					System.out.println("(null,'단위',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'단위',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 9:
					System.out.println("(null,'먼데이키즈',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "
							+ i * 10 + " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z
							+ "," + rr + "),");
					System.out.println(
							"(null,'먼데이키즈',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY)," + a + ","
									+ b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 10:
					System.out.println("(null,'블랙핑크',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'블랙핑크',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 11:
					if(i!=11){
					System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					}else{
						System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
								+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
								+ "),");
						System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY),"
								+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ");");
					}
					break;
				}

			}
		}
	%>
</body>
</html>