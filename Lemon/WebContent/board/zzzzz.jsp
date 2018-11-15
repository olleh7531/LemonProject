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
	2018-11-02 // 5분마다 차트에 insert 4분59초에 시작 INSERT INTO chart
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
	// 1시간마다 5분단위 데이터들 모아서 insert 하고난 뒤 삭제 2분10초정도에 시작 delete from chart
	where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),
	INTERVAL 1 HOUR) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),
	INTERVAL 1 SECOND) AND NOT ch_updatetime=DATE_FORMAT(NOW(),'%Y-%m-%d
	%H:%1'));
	===========================================================================
	// 하루마다 1시간단위 데이터들 모아서 insert INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,ch_music_num,sum(ch_playcnt)
	ch_playcnt,sum(ch_downcnt),DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d
	%H:%2'), INTERVAL 2 DAY) from chart where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 2 DAY) and
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) group by
	ch_music_num;
	===========================================================================
	하루마다 1시간단위 데이터들 모아서 insert 후 delete delete from chart where
	ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL
	2 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) AND
	NOT ch_updatetime=DATE_FORMAT(NOW(),'%Y-%m-%d %H:%2');
	-----------------------------------------------------------------------------
	하루단위 insert한 데이터를 music_sub에 update INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,mu_num,0,0,DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d %H:%2'), INTERVAL
	2 DAY) from music where mu_num not in ( select ch_music_num from chart
	where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'),
	INTERVAL 2 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1
	DAY) group by ch_music_num);
	===========================================================================
	일주일마다 하루단위 데이터들 모아서 insert INSERT INTO chart
	(ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select
	null,ch_music_num,sum(ch_playcnt)
	ch_playcnt,sum(ch_downcnt),DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d
	%H:%3'), INTERVAL 7 DAY) from chart where ch_updatetime between
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 7 DAY) and
	DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) group by
	ch_music_num;
	===========================================================================
	일주일마다 하루단위 데이터들 모아서 insert 후 delete delete from chart where
	ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL
	7 DAY) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND)
	AND NOT ch_updatetime=DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d %H:%3'),
	INTERVAL 7 DAY);
	===========================================================================
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
</body>
</html>