create tablespace musicplay
datafile 'E:\spacefororacle\MUSICPLAY_TBSPACE.dbf ' size 1000M
autoextend on next 5M maxsize 3000M;


create tablespace MUSICPLAY;

-- 用户表
drop table t_user;
create table t_user(
       userId number(7) not null,
       userName varchar(20) not null,
       password varchar(50) not null,
       gender varchar(4) not null ,
       age number(3) not null,
       email varchar(20) not null unique,
       registDay date not null,
       phone number(11) 
) tablespace musicplay;



alter table t_user modify gender default '男';
alter table t_user add constraint pk_u_id primary key(userId);  


-- 会员表
create table t_vip(
vipId number(7) not null,
userId number(7) not null,
payTime date not null,
deadLine date not null
)tablespace musicplay;


alter table t_vip add constraint pk_v_id primary key(vipId); 

-- 歌曲表
create table t_song(
        songId number(7) not null,
        songName varchar(30) not null,
        songSrc varchar(50) not null,
        lyricSrc varchar(50),
        singerName varchar(20)
)tablespace musicplay;

alter table t_song add constraint pk_s_id primary key(songId);   

-- 歌单表
create table t_songSheet(
sheetId number(7) not null,
userId number(7) not null,
sheetName varchar(30) not null,
describe varchar(100),
createTime date not null
)tablespace musicplay;


alter table t_songSheet add constraint pk_ss_id primary key(sheetId);  


-- 歌单项
drop table t_sheetItem;
create table t_sheetItem(
itemId number(7) not null,
songId number(7) not null,
sheetId number(7) not null,
CONSTRAINT tb_si_u1 UNIQUE (songid,sheetid)
)tablespace musicplay;
alter table t_sheetItem add constraint pk_si_id primary key(itemId);  

-- 歌曲评论
create table t_songComment(
scId number(8) not null,
songId number(7) not null,
userId number(7) not null,
conten varchar(1024) not null,
createTime date not null,
replyId number(8)
)tablespace musicplay;
alter table t_songComment add constraint pk_sc_id primary key(scId);  


-- 歌曲播放记录
create table t_songPlayhistory(
playId number(8) not null,
playTime date not null,
userId number(7) not null,
isComplete number(1) not null
)tablespace musicplay;

alter table t_songPlayHistory add constraint pk_sph_id primary key(playId)  

-- 歌单播放记录
create table t_sheetPlayHistory(
playId number(8) not null,
playTime date not null,
userId number(7),
sheetId number(7)
)tablespace musicplay;

alter table t_sheetPlayHistory add constraint pk_ssph_id primary key(playId);  

-- 评论点赞记录
drop table t_commentPraise;
create table t_commentPraise(
userId number(7) not null,
scId number(8) not null,
CONSTRAINT tb_cp_u1 UNIQUE (userId,scId)
)tablespace musicplay;




 


-- 用户关注表
create table t_focusUser(
userId number(7) not null,
focusId number(7) not null,
CONSTRAINT tb_fu_u1 UNIQUE (userId,focusId)
)tablespace musicplay;

-- 歌曲标签库
drop table t_songTag;
create table t_songTag(
tagId number(8) not null,
tagName varchar(8) not null unique,
belongTo number(8)
)tablespace musicplay;

alter table t_songTag add constraint pk_st_id primary key(tagId);

-- 歌曲关联标签
create table t_songRelateTag(
       songId number(7) not null,
       tagId number(8) not null,
       CONSTRAINT tb_srt_u1 UNIQUE (songId,tagId)
)tablespace musicplay;

-- 歌单收藏记录
create table t_sheetCollect(
userId number(7) not null,
sheetId number(7) not null,
CONSTRAINT tb_sc_u1 UNIQUE (userId,sheetId)
)tablespace musicplay;

-- 用户状态表
create table t_userStatus(
       userId number(7) not null,
       userIdenty varchar(15) not null ,-- 身份 默认就是用户，管理员
       isLogin number(1) not null --0为未登录，1为已登录
)tablespace musicplay;

-- 歌曲管理表
create table t_songManager(
	
)

alter table userStatus modify userIdenty default '普通用户';

alter table userStatus modify isLogin default 0;


/* 用户序列 */
create sequence sequence_user
start with 1000001
increment by 1
maxvalue 1999999
minvalue 1000001

/*会员申请记录序列*/

create sequence sequence_vip
start with 2000001
increment by 1
maxvalue 2999999
minvalue 2000001

create sequence sequence_song
start with 3000001
increment by 1
maxvalue 3999999
minvalue 3000001

create sequence sequence_songsheet
start with 4000001
increment by 1
maxvalue 4999999
minvalue 4000001

create sequence sequence_sheetitem
start with 5000001
increment by 1
maxvalue 5999999
minvalue 5000001

create sequence sequence_songComment
start with 10000001
increment by 1
maxvalue 19999999
minvalue 10000001

drop sequence sequence_songplayhistory
create sequence sequence_songplayhistory
start with 20000001
increment by 1
maxvalue 29999999
minvalue 20000001

create sequence sequence_sheethistory
start with 30000001
increment by 1
maxvalue 39999999
minvalue 30000001

create sequence sequence_songtag
start with 40000001
increment by 1
maxvalue 49999999
minvalue 40000001

create or replace trigger tri_insertTOt_user before insert on t_user
for each row 
declare 
begin 
    select sequence_user.nextval into :new.userId from dual;
    end;
 
create or replace trigger tri_insertTOt_song before insert on t_song
for each row 
declare 
begin 
    select sequence_song.nextval into :new.songId from dual;
    end;
    
create or replace trigger tri_insertTOt_songsheet before insert on t_songsheet
for each row 
declare 
begin 
    select sequence_sheet.nextval into :new.sheetId from dual;
    end;
    
    
create or replace trigger tri_insertTOt_songComment before insert on t_songcomment
for each row 
declare 
begin 
    select sequence_songcomment.nextval into :new.scId from dual;
    end;
    
 create or replace trigger tri_insertTOt_songPlayHistory before insert on t_songPlayHistory
for each row 
declare 
begin 
    select sequence_songPlayHistory.nextval into :new.playId from dual;
    end; 
    
 create or replace trigger tri_insertTOt_sheetPlayHistory before insert on t_sheetPlayHistory
for each row 
declare 
begin 
    select sequence_sheetPlayHistory.nextval into :new.playId from dual;
    end;
    
    
 create or replace trigger tri_insertTOt_songTag before insert on t_songTag
for each row 
declare 
begin 
    select sequence_songTag.nextval into :new.tagId from dual;
    end;