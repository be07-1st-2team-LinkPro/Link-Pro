create database linkpro;
use linkpro;
-- 개발자 정보 pro
CREATE TABLE pro (
    pro_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    pro_name VARCHAR(30) NOT NULL,
    pro_nickname VARCHAR(30) UNIQUE NOT NULL,
    pro_email VARCHAR(50) UNIQUE NOT NULL,
    pro_pw VARCHAR(100) NOT NULL, -- 비밀번호 길이를 늘렸습니다.
    pro_tel VARCHAR(20) UNIQUE,
    pro_career_exp INT DEFAULT 0,
    pro_reside_YN ENUM('Y', 'N') DEFAULT 'N',
    pro_region ENUM('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전',
        '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    pro_pr_id INT,
    pro_total_sales BIGINT DEFAULT 0,
    pro_score DECIMAL(2,1) DEFAULT 0.0,
    pro_cash INT DEFAULT 0,
    pro_del_YN enum('Y','N') default 'N' not null -- pro 탈퇴여부
);

-- 개발자 서비스 pro_service
CREATE TABLE pro_service (
    sv_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    sv_pro_id BIGINT NOT NULL,
    sv_type ENUM('web', 'app') DEFAULT 'web',
    sv_name VARCHAR(30) UNIQUE,
    sv_pro_score DECIMAL(2,1),
    sv_price INT NOT NULL,
    sv_contents VARCHAR(3000) NOT NULL,
    sv_reside_YN ENUM('Y', 'N') DEFAULT 'N',
    sv_main_pic BLOB,
    FOREIGN KEY (sv_pro_id) REFERENCES pro(pro_id)
);

-- 클라이언트 정보 client
CREATE TABLE client (
    client_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(30) NOT NULL,
    client_nickname VARCHAR(30) UNIQUE NOT NULL,
    client_email VARCHAR(50) UNIQUE, -- 이메일이 UNIQUE 제약 조건이 있어야 합니다.
    client_pw VARCHAR(100) NOT NULL, -- 비밀번호 길이를 늘렸습니다.
    client_tel VARCHAR(20) UNIQUE,
    client_region ENUM('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전',
        '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    client_cash INT DEFAULT 0,
    client_del_YN enum('Y','N') default 'N' not null -- client 탈퇴여부
);

-- 주문 서비스 order_service
CREATE TABLE order_service (
    order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_sv_id BIGINT NOT NULL,
    order_pro_id BIGINT NOT NULL,
    order_start_date DATETIME,
    order_end_date DATETIME,
    order_reside ENUM('Y', 'N') DEFAULT 'N',
    order_state ENUM('standby', 'accept', 'reject', 'done') DEFAULT 'standby',
    order_price INT NOT NULL,
    order_client_id BIGINT NOT NULL,
    FOREIGN KEY (order_sv_id) REFERENCES pro_service(sv_id),
    FOREIGN KEY (order_pro_id) REFERENCES pro(pro_id),
    FOREIGN KEY (order_client_id) REFERENCES client(client_id)
);

-- 결제 대기 pay_standby
CREATE TABLE pay_standby (
    standby_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    standby_order_id BIGINT NOT NULL,
    sending_price INT,
    holding_price INT,
    standby_isaccept ENUM('Y', 'N') DEFAULT 'N',
    standby_isdone ENUM('Y', 'N') DEFAULT 'N',
    FOREIGN KEY (standby_order_id) REFERENCES order_service(order_id)
);

-- 클라이언트 리뷰 client_review
CREATE TABLE client_review (
    review_post_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    review_order_id BIGINT NOT NULL,
    review_pro_id BIGINT NOT NULL,
    review_like_score INT CHECK (review_like_score <= 5),
    review_contents VARCHAR(1000) NOT NULL,
    review_created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (review_order_id) REFERENCES order_service(order_id),
    FOREIGN KEY (review_pro_id) REFERENCES pro(pro_id)
);
alter table client_review add column review_client_id bigint;
alter tabke client_review add constraint review_client_id foreign key(review_client_id) references client(id);

-- 개발자 자기소개글 pro_pr_post
CREATE TABLE pro_pr_post (
    pr_post_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pr_pro_id BIGINT,
    pr_title VARCHAR(100),
    pr_contents VARCHAR(1000),
    pr_github VARCHAR(1000),
    FOREIGN KEY (pr_pro_id) REFERENCES pro(pro_id)
);

-- 개발자(pro) 한명 당 자기소개글(pr_post) 딱 하나씩만 작성할 수 있도록 unique 조건 추가
ALTER TABLE pro_pr_post ADD CONSTRAINT unique_pro_pr UNIQUE (pr_pro_id);


-- 기술스택 카테고리 stack_category
CREATE TABLE stack_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 기슬스택 stack
CREATE TABLE stack (
    stack_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    stack_category_id INT NOT NULL,
    stack_name VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (stack_category_id) REFERENCES stack_category(category_id)
);

-- 개발자가 보유한 기술 pro_stack
CREATE TABLE pro_stack (
    ps_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ps_pro_id BIGINT NOT NULL,
    ps_stack_id BIGINT,
    FOREIGN KEY (ps_pro_id) REFERENCES pro(pro_id),
    FOREIGN KEY (ps_stack_id) REFERENCES stack(stack_id)
);

-- 서비스에 사용한 기술 service_stack
CREATE TABLE service_stack (
    ss_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ss_stack_id BIGINT,
    ss_service_id BIGINT NOT NULL,
    FOREIGN KEY (ss_stack_id) REFERENCES stack(stack_id),
    FOREIGN KEY (ss_service_id) REFERENCES pro_service(sv_id)
);

-- 채팅 chat
CREATE TABLE chat (
    chat_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    chat_client_id BIGINT NOT NULL,
    chat_pro_id BIGINT NOT NULL,
    chat_send_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    chat_contents VARCHAR(3000) NOT NULL,
    FOREIGN KEY (chat_client_id) REFERENCES client(client_id),
    FOREIGN KEY (chat_pro_id) REFERENCES pro(pro_id)
);
