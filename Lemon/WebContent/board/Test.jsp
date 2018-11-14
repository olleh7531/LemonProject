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

/* 		 for(int i=0;i<49;i++){
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
		}  */

		// searchchart 임시데이터 생성

 		System.out.println("insert into search_chart values");
		for (int i = 0; i < 12; i++) {
			
			int aa=r.nextInt(12)+1;
	int bb=0,cc=0,dd=0,ee=0,ff=0,gg=0,hh=0,ii=0,jj=0,kk=0,ll=0;
	for(;;){					
	bb=r.nextInt(12)+1;
	if(bb!=aa){
		break;					
	}
	}
	for(;;){					
	cc=r.nextInt(12)+1;
	if(cc!=bb&&cc!=aa){
		break;
	}
	}
	for(;;){					
	dd=r.nextInt(12)+1;
	if(dd!=cc&&dd!=bb&&dd!=aa){
		break;
	}
	}
	for(;;){		
		ee=r.nextInt(12)+1;
	if(ee!=dd&&ee!=cc&&ee!=bb&&ee!=aa){
		break;
	}
	}
	for(;;){
		ff=r.nextInt(12)+1;
	if(ff!=ee&&ff!=dd&&ff!=cc&&ff!=bb&&ff!=aa){
		break;
	}
	}
	for(;;){	
		gg=r.nextInt(12)+1;
	if(gg!=ff&&gg!=ee&&gg!=dd&&gg!=cc&&gg!=bb&&gg!=aa){
		break;
	}
	}
	for(;;){
		hh=r.nextInt(12)+1;
	if(hh!=gg&&hh!=ff&&hh!=ee&&hh!=dd&&hh!=cc&&hh!=bb&&hh!=aa){
		break;
	}
	}
	for(;;){
		ii=r.nextInt(12)+1;
	if(ii!=hh&&ii!=gg&&ii!=ff&&ii!=ee&&ii!=dd&&ii!=cc&&ii!=bb&&ii!=aa){
		break;
	}
	}
	for(;;){
		jj=r.nextInt(12)+1;
	if(jj!=ii&&jj!=hh&&jj!=gg&&jj!=ff&&jj!=ee&&jj!=dd&&jj!=cc&&jj!=bb&&jj!=aa){
		break;
	}
	}
	for(;;){
		kk=r.nextInt(12)+1;
	if(kk!=jj&&kk!=ii&&kk!=hh&&kk!=gg&&kk!=ff&&kk!=ee&&kk!=dd&&kk!=cc&&kk!=bb&&kk!=aa){
		break;
	}
	}
	for(;;){
		ll=r.nextInt(12)+1;
	if(ll!=kk&&ll!=jj&&ll!=ii&&ll!=hh&&ll!=gg&&ll!=ff&&ll!=ee&&ll!=dd&&ll!=cc&&ll!=bb&&ll!=aa){
		break;
	}
	}
	
	
	
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
							+ ","+aa+"),");
					System.out.println("(null,'아이유',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+aa+"),");
					break;
				case 1:
					System.out.println("(null,'테스트',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+bb+"),");
					System.out.println("(null,'테스트',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+bb+"),");
					break;
				case 2:
					System.out.println("(null,'방탄',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+cc+"),");
					System.out.println("(null,'방탄',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+cc+"),");
					break;
				case 3:
					System.out.println("(null,'시간',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+dd+"),");
					System.out.println("(null,'시간',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+dd+"),");
					break;
				case 4:
					System.out.println("(null,'없다',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+ee+"),");
					System.out.println("(null,'없다',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+ee+"),");
					break;
				case 5:
					System.out.println("(null,'시작',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+ff+"),");
					System.out.println("(null,'시작',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+ff+"),");
					break;
				case 6:
					System.out.println("(null,'단어',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+gg+"),");
					System.out.println("(null,'단어',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+gg+"),");
					break;
				case 7:
					System.out.println("(null,'하루',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+hh+"),");
					System.out.println("(null,'하루',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+hh+"),");
					break;
				case 8:
					System.out.println("(null,'단위',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+ii+"),");
					System.out.println("(null,'단위',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+ii+"),");
					break;
				case 9:
					System.out.println("(null,'먼데이키즈',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "
							+ i * 10 + " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z
							+ "," + rr + ","+jj+"),");
					System.out.println(
							"(null,'먼데이키즈',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND)," + a + ","
									+ b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+jj+"),");
					break;
				case 10:
					System.out.println("(null,'블랙핑크',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+kk+"),");
					System.out.println("(null,'블랙핑크',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+kk+"),");
					break;
				case 11:
					if(i!=11){
					System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
							+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
							+ ","+ll+"),");
					System.out.println("(null,'최우성',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
							+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr + ","+ll+"),");
					}else{
						System.out.println("(null,'최우성',DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL " + i * 10
								+ " MINUTE)," + a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
								+ ","+ll+"),");
						System.out.println("(null,'최우성',DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL " + i + " DAY), INTERVAL 1 SECOND),"
								+ a + "," + b + "," + v + "," + w + "," + x + "," + y + "," + z + "," + rr
								+"," + ll + ");");
					}
					break;
				}

			}
		} 
	%>
</body>
</html>