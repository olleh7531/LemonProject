<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	==========================================================================
	2018 10 30
	INSERT INTO chart values(null,(select pl_music_num,count(pl_user_email) mu_cnt from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num),now());
	=====================================================================================
	
	INSERT INTO chart values(null,(select pl_music_num,count(pl_user_email) mu_cnt,count(do_user_email) from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num),now());
	====================================================================================
	 	select t1_music_num,mu_cnt,do_cnt from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play left outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t1_music_num=t2_music_num group by t1_music_num
 union
  	select t2_music_num,mu_cnt,do_cnt from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play right outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t2_music_num=t1_music_num group by t2_music_num;
 =====================================================================================
 // 5분마다 차트에 insert
 INSERT INTO chart values(null,(select pl_music_num music_num,mu_cnt,do_cnt from
(select pl_music_num,count(pl_user_email) mu_cnt from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playx left outer join
(select do_music_num,count(do_user_email) do_cnt from download_log where do_downtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S')  group by do_music_num) downx
 on pl_music_num=do_music_num group by pl_music_num
 union
  	select do_music_num,mu_cnt,do_cnt from
(select pl_music_num,count(pl_user_email) mu_cnt from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playy right outer join
(select do_music_num,count(do_user_email) do_cnt from download_log where do_downtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S')  group by do_music_num) downy
 on do_music_num=pl_music_num group by do_music_num;),now());
 =========================================================================================
 update chart set cnt = (select * from (select sum(cnt) cnt from test3 where tt 
 between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),	INTERVAL 1 HOUR) and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H')), INTERVAL 1 SECOND) x ),
 tt=now() where tt = '2000-12-31 11:11:11';
 =========================================================================================
 인생망함
  	select null,t1_music_num,mu_cnt,do_cnt,now() from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play left outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t1_music_num=t2_music_num group by t1_music_num
 union
  	select null,t2_music_num,mu_cnt,do_cnt,now() from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play right outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t2_music_num=t1_music_num group by t2_music_num;
 ============================================================================================
  insert into test4(num,music_num,mu_cnt,do_cnt,xxx) 
  	select null,t1_music_num,mu_cnt,do_cnt,now() from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play left outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t1_music_num=t2_music_num group by t1_music_num
 union
  	select null,t2_music_num,mu_cnt,do_cnt,now() from
(select t1_music_num,count(t1_user_email) mu_cnt from
(SELECT distinct t1_music_num, t1_user_email FROM test1) play group by t1_music_num) play right outer join
(select t2_music_num,count(t2_user_email) do_cnt from
(SELECT distinct t2_music_num, t2_user_email FROM test2) down group by t2_music_num) down
 on t2_music_num=t1_music_num group by t2_music_num;
 ===========================================================================================
 2018-11-02
  // 5분마다 차트에 insert    4분59초에 시작 
 INSERT INTO chart (ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) select null,pl_music_num music_num,mu_cnt,do_cnt,now() from
(select pl_music_num,count(pl_user_email) mu_cnt from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playx left outer join
(select do_music_num,count(do_user_email) do_cnt from download_log where do_downtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S')  group by do_music_num) downx
 on pl_music_num=do_music_num group by pl_music_num
 union
  	select null,do_music_num,mu_cnt,do_cnt,now() from
(select pl_music_num,count(pl_user_email) mu_cnt from
	(SELECT distinct pl_music_num, pl_user_email FROM playlog where
	pl_playtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S') AND
	(pl_music_num,pl_user_email) not in ( SELECT distinct pl_music_num,
	pl_user_email FROM playlog where pl_playtime between
	DATE_FORMAT(NOW(),'%Y-%m-%d %H') and
	DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 4
	MINUTE), INTERVAL 1 SECOND))) play group by pl_music_num) playy right outer join
(select do_music_num,count(do_user_email) do_cnt from download_log where do_downtime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'),
	INTERVAL 4 MINUTE) and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S')  group by do_music_num) downy
 on do_music_num=pl_music_num group by do_music_num;
 =========================================================================================
 // 1시간마다 5분단위 데이터들 하나로 모아서 insert  1분 3초정도 (1분00에 시작했다가 59초에 들어갈까봐)에 시작
  INSERT INTO chart (ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) 
select null,ch_music_num,sum(ch_playcnt) ch_playcnt,sum(ch_downcnt),DATE_FORMAT(now(),'%Y-%m-%d %H:%i') from chart where ch_updatetime 
 between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),	INTERVAL 1 HOUR)
 and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 SECOND) group by ch_music_num;
 ============================================================================================
 // 1시간마다 5분단위 데이터들 모아서 insert 하고난 뒤 삭제 2분10초정도에 시작
  delete from chart where ch_updatetime 
 between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'),	INTERVAL 1 HOUR)
 and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 SECOND) AND NOT ch_updatetime=DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 1 MINUTE);
 ===========================================================================
 // 하루마다 1시간단위 데이터들 모아서 insert , insert한 데이터를 music_sub에 update
   INSERT INTO chart (ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime) 
select null,ch_music_num,sum(ch_playcnt) ch_playcnt,sum(ch_downcnt),DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d'), INTERVAL 2 DAY) from chart where ch_updatetime 
 between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 2 DAY)
 and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) group by ch_music_num;
 -----------------------------------------------------------------------------------------
 
 ===========================================================================
 하루마다 1시간단위 데이터들 모아서 insert 후 delete
 ===========================================================================
 일주일마다 하루단위 데이터들 모아서 insert
 ===========================================================================
 일주일마다 하루단위 데이터들 모아서 insert 후 delete
 ===========================================================================
</body>
</html>