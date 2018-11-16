<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	===========================================================================================
<!--                     	스케줄러                        -->
	<!-- 음악차트  -->
	2018-11-02 // 5분마다 차트에 insert 4분59초에 시작 
	INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,pl_music_num music_num,mu_cnt,do_cnt,now() from (select
	pl_music_num,count(pl_user_email) mu_cnt from (SELECT distinct
	pl_music_num, pl_user_email FROM playlog where pl_playtime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4 MINUTE) and
	DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND (pl_music_num,pl_user_email)
	not in ( SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playx left
	outer join (select do_music_num,count(do_user_email) do_cnt from
	download_log where do_downtime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4 MINUTE) and
	DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') group by do_music_num) downx on
	pl_music_num=do_music_num group by pl_music_num union select
	null,do_music_num,mu_cnt,do_cnt,now() from (select
	pl_music_num,count(pl_user_email) mu_cnt from (SELECT distinct
	pl_music_num, pl_user_email FROM playlog where pl_playtime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4 MINUTE) and
	DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND (pl_music_num,pl_user_email)
	not in ( SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playy right
	outer join (select do_music_num,count(do_user_email) do_cnt from
	download_log where do_downtime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4 MINUTE) and
	DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') group by do_music_num) downy on
	do_music_num=pl_music_num group by do_music_num;
	=========================================================================================
	// 1시간마다 5분단위 데이터들 하나로 모아서 insert 1분 3초정도 (1분00에 시작했다가 59초에 들어갈까봐)에 시작
	INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,ch_music_num,sum(ch_playcnt)
	ch_playcnt,sum(ch_downcnt),DATE_FORMAT(now(),'%Y-%m-%d %H:%1') from
	chart where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d
	%H'), INTERVAL 1 HOUR) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),
	INTERVAL 1 SECOND) group by ch_music_num;
	============================================================================================
	// 1시간마다 5분단위 데이터들 모아서 insert 하고난 뒤 삭제 2분10초정도에 시작
	delete from chart
	where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),
	INTERVAL 1 HOUR) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),
	INTERVAL 1 SECOND) AND NOT ch_updatetime=DATE_FORMAT(NOW(),'%Y-%m-%d
	%H:%1'));
	=============================================================================
	// 1시간마다 1시간단위 데이터에 ranking 매기기 업데이트구문 
	update chart a,(
    SELECT b.*,@ROWNUM := @ROWNUM + 1 AS ch_ranking       
    FROM
        (select ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime from chart where ch_updatetime =  DATE_FORMAT(now(),'%Y-%m-%d %H') group by ch_num order by sum(ch_playcnt*4+ch_downcnt*6) desc) b,
       (SELECT @ROWNUM := 0) R
       ) b
set a.ch_ranking = b.ch_ranking

       where a.ch_num=b.ch_num;
	===========================================================================
	// 하루마다 1시간단위 데이터들 모아서 insert 
	INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,ch_music_num,sum(ch_playcnt)
	ch_playcnt,sum(ch_downcnt) ch_downcnt,DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d
	%H:%02'), INTERVAL 2 DAY) from chart where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 2 DAY) and
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) group by
	ch_music_num;
	===========================================================================
	하루마다 1시간단위 데이터들 모아서 insert 후 delete 
	delete from chart where
	ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL
	2 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) AND
	NOT ch_updatetime=DATE_FORMAT(NOW(),'%Y-%m-%d %H:%2');
	-----------------------------------------------------------------------------
	하루마다 재생,다운 0인 데이터를 차트에 insert 
	INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,mu_num,0,0,DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d %H:%02'), INTERVAL
	2 DAY) from music where mu_num not in ( select ch_music_num from chart
	where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'),
	INTERVAL 2 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1
	DAY) group by ch_music_num);
	===========================================================================
	일주일마다 하루단위 데이터들 모아서 insert 
	INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,ch_music_num,sum(ch_playcnt)
	ch_playcnt,sum(ch_downcnt),DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d
	%H:%3'), INTERVAL 7 DAY) from chart where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 7 DAY) and
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) group by
	ch_music_num;
	===========================================================================
	일주일마다 하루단위 데이터들 모아서 insert 후 delete 
	delete from chart where
	ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL
	7 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND)
	AND NOT ch_updatetime=DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d %H:%3'),
	INTERVAL 7 DAY);
	============================================================================
	<!-- 서치차트 -->
	 10분마다 서치로그에 있는 데이터 서치차트에 insert
	insert into search_chart
select null,a.se_keyword,now(),IFNULL(sc_gender1, 0) sc_gender1,IFNULL(sc_gender2, 0) sc_gender2,IFNULL(sc_generation1, 0) sc_generation1,IFNULL(sc_generation2, 0) sc_generation2,IFNULL(sc_generation3, 0)sc_generation3,IFNULL(sc_generation4, 0) sc_generation4,IFNULL(sc_generation5, 0) sc_generation5,sc_count,null from 
(select count(*) sc_gender1,se_num,se_keyword from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) 
and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_gender='남' group by se_keyword) a
 left outer join 
(select count(*) sc_gender2,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_gender='여' group by se_keyword) b
  on b.se_num=a.se_num left outer join 
(select count(*) sc_generation1,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_generation=10 group by se_keyword) c
 on c.se_num=a.se_num left outer join
(select count(*) sc_generation2,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_generation=20 group by se_keyword) d
 on d.se_num=a.se_num left outer join
(select count(*) sc_generation3,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_generation=30 group by se_keyword) e
 on e.se_num=a.se_num left outer join
(select count(*) sc_generation4,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_generation=40 group by se_keyword) f
 on f.se_num=a.se_num left outer join
(select count(*) sc_generation5,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 and se_generation=50 group by se_keyword) g
 on g.se_num=a.se_num left outer join
(select count(*) sc_count,se_num from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
 group by se_keyword) h on h.se_num=a.se_num group by se_keyword;
 =======================================================================
 하루마다 서치차트에 있는 10분단위 데이터를 하나로 모아서 insert
 INSERT INTO search_chart
	(sc_num,sc_keyword,sc_date,sc_gender1,sc_gender2,sc_generation1,sc_generation2,sc_generation3,sc_generation4,sc_generation5,sc_count) 
    select
	null,sc_keyword,
	DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d
	%H:%01'), INTERVAL 1 DAY),sc_gender1,sc_gender2,sc_generation1,sc_generation2,sc_generation3,sc_generation4,sc_generation5,sc_count from search_chart where sc_date between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) and
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) group by
	sc_keyword;
 
 =======================================================================
 하루마다 업데이트했던 10분단위 데이터 삭제
 
 delete from search_chart where
	sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL
	1 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) AND
	NOT sc_date=DATE_FORMAT(NOW(),'%Y-%m-%d %H:%1');
	
<!--                     	스케줄러                        -->
	===========================================================================
	// 검색차트 순위대로 가져오는 셀렉트문(선택한시간,선택한시간-10분)
            select keyword,lately,past from( select sc_keyword keyword,sc_rank lately from
	search_chart where sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d
	%H:%i'), INTERVAL 10 MINUTE) AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d
	%H:%i'), INTERVAL 0 MINUTE), INTERVAL 1 SECOND) AND sc_date !=
	DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) order by lately limit 10) d
left outer join
 (select a.sc_keyword key2,a.sc_rank past from search_chart a,(select
	sc_keyword,sc_rank from search_chart where sc_date between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 10 MINUTE) AND
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 0 MINUTE) AND
	sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND)
	order by sc_rank asc limit 10) b where a.sc_keyword=b.sc_keyword and
	a.sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 20
	MINUTE) AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 10 MINUTE), INTERVAL 1
	SECOND)
	AND a.sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1
	SECOND)) c on c.key2=d.keyword;
================================================================================================
	// 음악차트 순위대로 가져오는 셀렉트문 (선택한시간,선택한시간-1시간)
    select ch_music_num,lately,past,music_name,al_singer_name from(select ch_music_num,ch_ranking lately,music_name,al_singer_name from chart,music,album where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 HOUR) AND
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 0 HOUR), INTERVAL 1 SECOND)
	AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02') and mu_num=ch_music_num and al_num=album_num order by lately) d
    left outer join                      
    (select a.ch_music_num chm2,a.ch_ranking past from chart a,
	(select ch_music_num,ch_ranking from chart where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 HOUR) AND
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 0 HOUR), INTERVAL 1 SECOND)
	AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) b where a.ch_music_num=b.ch_music_num and a.ch_updatetime
    between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 2 HOUR)
	AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 HOUR), INTERVAL 1 SECOND) AND
	a.ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) c on c.chm2=d.ch_music_num group by lately;
================================================================================================
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작';
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_gender='여';
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_gender='남';
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_generation=10;
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_generation=20;
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_generation=30;
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_generation=40;
select count(*) from searchlog where se_date between date_sub(date_format(now(), '%Y-%m-%d %H:%i'), interval 10 minute) and date_sub(date_format(now(), '%Y-%m-%d %H:%i:%S'), INTERVAL 1 SECOND)
and se_keyword='시작' and se_generation=50;
========================================================================================
select ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime,music_name from chart,music where ch_music_num in (select ch_music_num from 
					(select ch_music_num from chart where ch_updatetime =  DATE_FORMAT(now(),'%Y-%m-%d %H') group by ch_num order by sum(ch_playcnt*4+ch_downcnt*6) desc limit 3) as test) 
					AND ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),	
					INTERVAL 1 HOUR) and DATE_FORMAT(NOW(),'%Y-%m-%d %H') and mu_num=ch_music_num order by ch_music_num asc ,ch_updatetime asc
</body>
</html>