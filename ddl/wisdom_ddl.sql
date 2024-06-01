create database linkpro;
use linkpro;

-- 개발자 Pro 테이블
CREATE TABLE pro (
	pro_id	bigint auto_increment, -- 개발자 id (PK)
	pro_name	varchar(30) not null, -- 개발자 이름
	pro_nickname varchar(30)	unique	not null, -- 개발자 닉네임 (중복불가) 
	pro_email varchar(100) unique not null, -- 개발자 이메일 (중복불가)
	pro_tel varchar(100) unique, -- 개발자 전화번호(중복불가)
	pro_career_exp int, -- 개발자 총 경력연차 
	pro_region_id	int, -- 개발자 활동지역 id
	pro_reside_YN	enum('Y','N') not null default 'N', -- 개발자 상주가능 여부(Y/N) 
	pro_pr_id	int, -- 개발자 자기소개 글 id
	pro_cash	int default 0, -- 개발자 보유캐시 
	pro_score	decimal(2,1) default 0.0, -- 개발자 리뷰평균평점 (5점만점, 소수점1자리수 까지 출력)
	primary key (pro_id),
	foreign key (pro_region_id) references region(region_id) -- 개발자의 활동지역 : region 테이블의 region_id FK
);

-- 활동지역 Region 테이블
create table region(
	region_id int auto_increment, -- 지역 id (PK)
    region_name varchar(30) not null, -- 지역명
	primary key(region_id) 
);

-- 개발자 자기소개 pro_pr_post 테이블
create table pro_pr_post(
	pr_post_id bigint auto_increment, -- 개발자 자기소개글 id (PK)
    pr_pro_id bigint, -- 작성한 개발자 id
    pr_title varchar(100), -- 자기소개 제목
    pr_contents varchar(1000), -- 자기소개 글내용
    pr_github varchar(1000), -- 작성한 개발자 깃허브 링크
    primary key(pr_post_id),
    foreign key(pr_pro_id) references pro(pro_id) -- pr_pro_id : 개발자 pro 테이블의 pro_id FK
);