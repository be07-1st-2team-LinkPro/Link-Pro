CREATE TABLE pro
(
    pro_id bigint primary key auto_increment,
    pro_name varchar(30) not null,
    pro_nickname varchar(30) unique,
    pro_email varchar(50) unique,
    pro_pw varchar(30) not null,
    pro_tel varchar(20) unique,
    pro_career_exp int default 0,
    pro_reside_YN enum('Y', 'N') default 'N',
    pro_region enum('서울', '경기 북부', '경기 남부', '부산', '대구', '인천',' 광주', '대전',
        '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    pro_pr_id int,
    pro_total_sales bigint default 0,
    pro_score decimal(2,1) default 0.0,
    pro_cash int default 0
);

CREATE TABLE pro_service
(
    sv_id bigint primary key auto_increment,
    sv_pro_id BIGINT not null,
    sv_type enum('web', 'app') default 'web',
    sv_name varchar(30) unique,
    sv_pro_score decimal(2,1),
    sv_price int NOT NULL,
    sv_contents varchar(3000) not null ,
    sv_reside_YN enum('Y', 'N') default 'N',
    sv_main_pic BLOB,
    foreign key (sv_pro_id) references pro(pro_id)
);

CREATE TABLE client
(
    client_id bigint primary key auto_increment,
    client_name varchar(30) not null,
    client_nickname varchar(30) unique,
    client_email varchar(50),
    client_pw varchar(30) not null,
    client_tel varchar(20) unique,
    client_region enum('서울', '경기 북부', '경기 남부', '부산', '대구', '인천',' 광주', '대전',
        '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    client_cash int default 0
);

CREATE TABLE order_service
(
    order_id bigint primary key auto_increment ,
    order_sv_id bigint not null ,
    order_pro_id bigint not null ,
    order_start_date datetime,
    order_end_date datetime,
    order_reside enum('Y', 'N') default 'N',
    order_state enum('standby', 'accept', 'reject', 'done') default 'standby',
    order_price int not null ,
    order_client_id bigint not null ,
    foreign key (order_client_id) references client(client_id)
);

CREATE TABLE pay_standby
(
    standby_id bigint primary key auto_increment,
    standby_order_id bigint not null ,
    sending_price int,
    holding_price int,
    standby_isaccept enum('Y', 'N') default 'N',
    standby_isdone enum('Y', 'N') default 'N',
    foreign key (standby_order_id) references order_service(order_id)
);

CREATE TABLE client_review
(
    review_post_id bigint primary key auto_increment ,
    review_order_id bigint not null ,
    review_pro_id bigint not null ,
    review_like_score int check(review_like_score <= 5) ,
    review_contents varchar(1000) not null ,
    review_created_time datetime default current_timestamp,
    foreign key (review_order_id) references order_service(order_id),
    foreign key (review_pro_id) references pro(pro_id)
);

-- 개발자 자기소개글 pro_pr_post
create table pro_pr_post(
    pr_post_id bigint auto_increment, -- 개발자 자기소개글 id(PK)
    pr_pro_id bigint, -- 개발자ID : pro(pro_id) FK
    pr_title varchar(100), -- 자기소개 제목
    pr_contents varchar(1000), -- 자기소개 내용
    pr_github varchar(1000), -- 개발자 깃허브 링크
    primary key(pr_post_id),
    foreign key (pr_pro_id) references pro(pro_id)  -- pro의 pro_id 참조
);

-- 개발자(pro) 한명 당 자기소개글(pr_post) 딱 하나씩만 작성할 수 있도록 unique 조건 추가
ALTER TABLE pro_pr_post ADD CONSTRAINT unique_pro_pr UNIQUE (pr_pro_id);


-- 기술스택 카테고리 stack_category
create table stack_category(
    category_id int auto_increment, -- 기술스택 카테고리 id (PK)
    category_name varchar(100) not null, -- 기술스택 카테고리명
    primary key(category_id)
);

-- 기슬스택 stack
create table stack(
    stack_id bigint auto_increment, -- 스택 ID(PK)
    stack_category_id int not null, -- 스택 카테고리ID (FK)
    stack_name varchar(100) unique not null, -- 스택명
    primary key(stack_id),
    foreign key(stack_category_id) references stack_category(category_id) -- stack_category_id : stack_category의 cateory_id 참조
);

-- 개발자가 보유한 기술 pro_stack 테이블
create table pro_stack(
    ps_id bigint auto_increment, -- 개발자가 보유한 기술 id(PK)
    ps_pro_id bigint not null, -- 개발자 id
    ps_stack_id bigint, -- 스택 id
    primary key(ps_id),
    foreign key(ps_pro_id) references pro(pro_id), -- ps_pro_id : pro의 pro_id(개발자ID)참조
    foreign key(ps_stack_id) references stack(stack_id) -- ps_stack_id : stack의 stack_id(스택ID)참조
);

-- 서비스에 사용한 기술 service_stack 테이블
create table service_stack(
    ss_id bigint auto_increment, -- 서비스에 사용한 기술 ID (PK)
    ss_stack_id bigint, -- 서비스에 사용한 기술 스택id(FK)
    ss_service_id bigint not null, -- 서비스ID(FK)
    primary key(ss_id),
    foreign key(ss_stack_id) references stack(stack_id),
    foreign key(ss_service_id) references pro_service(sv_id)
);

-- 채팅 chat
create table chat(
    chat_id bigint auto_increment, -- 채팅 아이디(PK)
    chat_client_id bigint not null, -- 구매자 ID(FK)
    chat_pro_id bigint not null, -- 개발자 ID(FK)
    chat_send_time datetime default current_timestamp, -- 채팅 전송시간 (default : 현재시각)
    chat_contents varchar(3000) not null, -- 채팅내용
    primary key(chat_id),
    foreign key(chat_client_id) references client(client_ID),
    foreign key(chat_pro_id) references pro(pro_id)
);
