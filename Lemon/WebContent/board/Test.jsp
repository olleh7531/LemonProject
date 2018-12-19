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
	
		// for문 사용 후 Rank.ct 로 이동하면 순위 매겨짐 (searchchart,musicchart 2개 insert 먼저)
		
		

		// chart(music) 임시 데이터 생성

/*   		 for(int i=0;i<49;i++){
			for(int j=1;j<101;j++){
				if(i==0&&j==1){
					out.println("insert into chart (ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) values");
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_FORMAT(NOW(),'%Y-%m-%d %H')),");
				}else if(i==0){
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_FORMAT(NOW(),'%Y-%m-%d %H')),");			
				}else if(i<48||(i==48&&j!=100)){			
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR)),");
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR)),");
				}else if(j==100){
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR)),");
			out.println("(null,"+j+","+r.nextInt(21)+","+r.nextInt(8)+",DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR));");
				}
			
				
			}
		}  */

		// searchchart 임시데이터 생성

  		 out.println("insert into search_chart (sc_num,sc_keyword,sc_date,sc_gender1,sc_gender2,sc_generation1,sc_generation2,sc_generation3,sc_generation4,sc_generation5,sc_count) values");
		 for (int i = 0; i < 100; i++) {
	
	
			for (int j = 0; j < 41; j++) {
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
					out.println("(null,'아이유',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr+"),");
					out.println("(null,'아이유',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr +"),");
					break;
				case 1:
					out.println("(null,'스탠딩에그',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr+ "),");
					out.println("(null,'스탠딩에그',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 2:
					out.println("(null,'방탄소년단',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'방탄소년단',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 3:
					out.println("(null,'사랑',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'사랑',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 4:
					out.println("(null,'밤편지',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'밤편지',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 5:
					out.println("(null,'FAKELOVE',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'FAKELOVE',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 6:
					out.println("(null,'비투비',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'비투비',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 7:
					out.println("(null,'NCT',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'NCT',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 8:
					out.println("(null,'멜로망스',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'멜로망스',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 9:
					out.println("(null,'먼데이키즈',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "
							+ i * 10 + " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z
							+ "," + rr + "),");
					out.println(
							"(null,'먼데이키즈',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND)," + a + ","
									+ b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 10:
					out.println("(null,'블랙핑크',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'블랙핑크',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 11:
					out.println("(null,'지코',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'지코',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 12:
					out.println("(null,'너나해',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'너나해',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 13:
					out.println("(null,'별이빛나는밤',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'별이빛나는밤',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 14:
					out.println("(null,'마마무',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'마마무',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 15:
					out.println("(null,'캥거루',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'캥거루',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 16:
					out.println("(null,'고백',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'고백',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 17:
					out.println("(null,'몰랐니',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'몰랐니',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 18:
					out.println("(null,'사이렌',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'사이렌',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 19:
					out.println("(null,'선미',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'선미',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 20:
					out.println("(null,'모래시계',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'모래시계',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 21:
					out.println("(null,'레드벨벳',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'레드벨벳',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 22:
					out.println("(null,'그날처럼',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'그날처럼',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 23:
					out.println("(null,'빨간맛',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'빨간맛',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 24:
					out.println("(null,'트와이스',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'트와이스',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 25:
					out.println("(null,'봄날',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'봄날',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 26:
					out.println("(null,'지나오다',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'지나오다',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 27:
					out.println("(null,'여행',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'여행',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 28:
					out.println("(null,'볼빨간사춘기',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'볼빨간사춘기',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 29:
					out.println("(null,'로이킴',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'로이킴',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 30:
					out.println("(null,'모모랜드',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'모모랜드',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 31:
					out.println("(null,'세븐틴',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'세븐틴',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 32:
					out.println("(null,'열애중',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'열애중',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 33:
					out.println("(null,'벤',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'벤',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 34:
					out.println("(null,'EXO',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'EXO',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 35:
					out.println("(null,'뿜뿜',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'뿜뿜',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 36:
					out.println("(null,'로꼬',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'로꼬',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 37:
					out.println("(null,'미스터 선샤인',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'미스터 선샤인',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 38:
					out.println("(null,'AOA',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'AOA',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 39:
					out.println("(null,'길구봉구',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'길구봉구',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					break;
				case 40:
					if(i!=99){
					out.println("(null,'이수',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ "),");
					out.println("(null,'이수',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + "),");
					}else{
						out.println("(null,'이수',DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL " + i * 10
								+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
								+ "),");
						out.println("(null,'이수',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
								+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr+ ");");
					}
					break;
				}

			}
		}    
	%>
</body>
</html>