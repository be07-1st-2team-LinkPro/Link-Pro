# 🤝LinkPro

# 📍 프로젝트 소개

## 프로젝트 명 : LinkPro

![LinkPro로고](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/long_logo.jpg?raw=true)

LinkPro는 프리랜서 개발자와 클라이언트를 연결하는 플랫폼입니다.

이 플랫폼은 개발자들이 외주 프로젝트를 찾고 수주할 수 있도록 지원하며, 클라이언트가 필요한 개발 서비스를 쉽게 찾고 의뢰할 수 있는 기능을 제공합니다.

# 📍 프로젝트 필요성

## 변화하는 취업시장과 고용형태의 변화

![알바몬 설문](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/albamon_servey.png?raw=true)

- **직업에 대한 인식 변화**
  4차 산업 혁명과 코로나 19의 여파로 취업시장의 고용형태가 빠르게 변화하고 있다.
  아르바이트 구인구직 플랫폼 알바몬이 재능 거래 앱 ‘긱몬’과 함께 지난해 초 실시한 설문조사 결과에 따르면, 실제 MZ세대 사이에서도 한 직장에서 평생을 일하는 전통적인 일자리에 대한 인식이 변하고 있으며 약 65% 이상의 청년이 프리랜서 의향이 있다고 응답한 것으로 나타났다.
- **긱잡(gig job) : 새로운 직업 형태 등장**
  4차 산업혁명과 코로나19 여파로 취업 시장에선 고용 형태가 빠르게 변화되고 있다. 필요할 때마다 계약직·임시직 등을 섭외해 일을 맡기는 ‘긱잡(gig job)’ 등의 신규 직업형태까지 등장했다.
  이에 따라 전통적인 정규직 일자리 대신 프리랜서와 프로젝트 단위의 일자리가 증가하고 있으며 LinkPro는 이러한 변화에 발맞춰, 개발자들에게 다양한 프로젝트 기회를 제공하고자 한다.

## 프로젝트 목표

- 4차 산업 혁명과 코로나19 팬데믹의 여파로 변화하는 취업 시장과 고용 형태에 대응
- 프리랜서 개발자와 클라이언트가 상호 이익을 얻을 수 있는 환경을 제공
- 개발자들은 다양한 프로젝트 기회를 얻고, 클라이언트는 필요한 개발 서비스를 효율적으로 의뢰가능

# 📍프로젝트 진행과정

### WBS

![WBS](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/linkpro_wbs.PNG?raw=true)
프로젝트 기간 : 2024.05.31 ~ 2024.06.03

### 요구사항 명세서(Functional Requirements Document)작성

![요구사항명세서](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/reqire_list.PNG?raw=true)

### 개념적 모델링 (Conceptual Modeling)

- 개체 (Entity), 속성 (Attribute), 관계 (Relation) 정의
  ![초기모델](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/initial_model.png?raw=true)

### 논리적 모델링 (Logical Modeling)

- ERD Cloud 이용
- 테이블 컬럼 data 타입, 타이블 간의 Key(관계)추가
- 정규화 (Normalization) 진행
  ![ERD](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/erd_cloud.PNG?raw=true)

### 물리적 모델링 (Physical Modeling)

- ERD Cloud 이용
- 테이블 컬럼 data 타입, 타이블 간의 Key(관계)추가
- 정규화 (Normalization) 진행

<details><summary><h3>🔧DDL문</h3>

</summary>

```
sql
CREATE DATABASE IF NOT EXISTS linkpro;
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
alter table client_review add constraint review_client_id foreign key(review_client_id) references client(id);

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
```

</details>

---

# 📍 프로시저(Procedure)

### 📝프로시저 리스트

![프로시저 리스트](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/procedure_list.PNG?raw=true)

<details><summary> <h3>👨‍💻개발자 관련</h3>
</summary>
<h3>ProSignUp : 개발자 회원가입</h3>

개발자의 회원 가입을 수행하는 Procedure

**요구 사항**: 가입 시 입력하는 정보 중 Email, Tel, Nickname은 구매자 테이블과 개발자 테이블 모든 곳에서 UNIQUE한 값

<h4>Procedure Query</h4>

![ProSignUp1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignUp1.png?raw=true)

<h4> Procedure call </h4>

```
sql
call ProSignUp('이메일', '이름', '닉네임', '비밀번호', '전화번호', '지역');

```

<h4>result</h4>

![ProSignUp3](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignUp3.png?raw=true)

---

<h3>ProSignOut : 개발자 회원탈퇴</h3>

작업자 회원탈퇴를 처리하는 프로시저

**요구사항** : 작업자 ID를 입력, `pro` 테이블에서 해당 작업자의 `pro_del_YN` 값을 ‘Y’ 로 업데이트하여 탈퇴 처리

<h4>Procedure Query</h4>

```
sql
-- ProSignOut 프로시저
-- 작업자 회원탈퇴

DELIMITER //

CREATE PROCEDURE ProSignOut(
    IN p_pro_id BIGINT
)
BEGIN
    UPDATE pro
    SET pro_del_YN = 'Y'
    WHERE pro_id = p_pro_id;
END //

DELIMITER ;

```

<h4> Procedure call </h4>

```
sql
CALL ProSignOut(10);
```

<h4>result</h4>

- 작업자의 리스트
  ![ProSignOut1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignOut-bf.png?raw=true)

- pro_id 가 10인 작업자 회원 탈퇴
  ![ProSignOut2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignOut-af.png?raw=true)

---

<h3>ProUpdateProfile : 개발자 프로필 수정</h3>

작업자 프로필을 수정하는 프로시저

**요구사항** : 작업자 ID와 여러 프로필 정보를 입력, 각 입력값이 `NULL` 인 경우 해당 컬럼을 업데이트하지 않음, `coalesce` 를 사용하여 입력값이 `null` 인 경우 기존 값을 유지

<h4>Procedure Query</h4>

```
sql
DELIMITER //

CREATE PROCEDURE ProUpdateProfile(
    IN p_pro_id BIGINT,
    IN p_pro_name VARCHAR(30),
    IN p_pro_nickname VARCHAR(30),
    IN p_pro_email VARCHAR(50),
    IN p_pro_pw VARCHAR(30),
    IN p_pro_tel VARCHAR(20),
    IN p_pro_career_exp INT,
    IN p_pro_reside_YN ENUM('Y', 'N'),
    IN p_pro_region ENUM('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    IN p_pro_pr_id INT,
    IN p_pro_total_sales BIGINT,
    IN p_pro_score DECIMAL(2,1),
    IN p_pro_cash INT,
    IN p_pro_del_YN ENUM('Y', 'N')
)
BEGIN
    UPDATE pro
    SET
        pro_name = COALESCE(p_pro_name, pro_name),
        pro_nickname = COALESCE(p_pro_nickname, pro_nickname),
        pro_email = COALESCE(p_pro_email, pro_email),
        pro_pw = COALESCE(p_pro_pw, pro_pw),
        pro_tel = COALESCE(p_pro_tel, pro_tel),
        pro_career_exp = COALESCE(p_pro_career_exp, pro_career_exp),
        pro_reside_YN = COALESCE(p_pro_reside_YN, pro_reside_YN),
        pro_region = COALESCE(p_pro_region, pro_region),
        pro_pr_id = COALESCE(p_pro_pr_id, pro_pr_id),
        pro_total_sales = COALESCE(p_pro_total_sales, pro_total_sales),
        pro_score = COALESCE(p_pro_score, pro_score),
        pro_cash = COALESCE(p_pro_cash, pro_cash),
        pro_del_YN = COALESCE(p_pro_del_YN, pro_del_YN)
    WHERE pro_id = p_pro_id;
END //

DELIMITER ;

```

<h4> Procedure call </h4>

```
sql
CALL ProUpdateProfile(
    1,
    '김철수', -- pro_name
    NULL,      -- pro_nickname (업데이트하지 않음)
    NULL,      -- pro_email (업데이트하지 않음)
    NULL, -- pro_pw
    NULL,      -- pro_tel (업데이트하지 않음)
    NULL,        -- pro_career_exp
    NULL,      -- pro_reside_YN (업데이트하지 않음)
    '서울',    -- pro_region
    NULL,      -- pro_pr_id (업데이트하지 않음)
    NULL,      -- pro_total_sales (업데이트하지 않음)
    NULL,      -- pro_score (업데이트하지 않음)
    NULL,      -- pro_cash (업데이트하지 않음)
    NULL       -- pro_del_YN (업데이트하지 않음)
);

```

<h4>result</h4>

- 작업자의 리스트

![ProUpdateProfile1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProUpdateProfile-bf.png?raw=true)

- pro_id =1 작업자 수정 ( 이름, 지역)
  ![ProUpdateProfile2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProUpdateProfile-af.png?raw=true)

---

</details>

<details>

  <summary><h3>🛠서비스(외주 프로젝트) 관련 </h3></summary>
  <h3>CreateServicePost_pro : 개발자 서비스 등록</h3>

새로운 서비스 판매글을 등록하는 프로시저

**요구사항 :** 개발자 ID, 서비스 유형, 서비스 이름, 서비스 가격, 서비스 내용, 거주 여부, 서비스 대표 이미지, 기술 스택 ID 목록을 입력받아 `pro_service` 테이블에 삽입

<h4>Procedure Query</h4>

```
sql
DELIMITER //

-- CreateServicePost 프로시저는 새로운 서비스 판매글을 등록합니다.
CREATE procedure CreateServicePost_pro(
    in p_pro_id bigint,         -- 작업 ID
    in p_sv_type enum('web', 'app'),  -- 서비스 유형
    in p_sv_name varchar(30),   -- 서비스 이름
    in p_sv_price int,          -- 서비스 가격
    in p_sv_contents VARCHAR(3000), -- 서비스 내용
    in p_sv_reside_YN enum('Y', 'N'), -- 거주 여부
    in p_sv_main_pic blob,      -- 서비스 대표 이미지
    in p_stack_ids text         -- 기술 스택 ID 목록 (쉼표로 구분된 문자열)
)
BEGIN
    declare sv_id bigint;       -- 새로운 서비스 ID를 저장할 변수

    -- pro_service 테이블에 새로운 서비스 판매글을 삽입합니다.
    insert into pro_service(sv_pro_id, sv_type, sv_name, sv_price, sv_contents, sv_reside_YN, sv_main_pic)
    values (p_pro_id, p_sv_type, p_sv_name, p_sv_price, p_sv_contents, p_sv_reside_YN, p_sv_main_pic);

    -- 방금 삽입한 서비스의 ID를 가져옵니다.
    set sv_id = LAST_INSERT_ID();

   -- service_stack 테이블에 사용된 기술 스택을 삽입합니다.
while locate(',', p_stack_ids) > 0 DO
    -- 쉼표로 구분된 첫 번째 기술 스택 ID 추출
    set @stack_id = SUBSTRING_INDEX(p_stack_ids, ',', 1);
    -- service_stack 테이블에 기술 스택 ID 삽입
    insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, @stack_id);
    -- 처리된 기술 스택 ID를 p_stack_ids 문자열에서 제거
    set p_stack_ids = SUBSTRING(p_stack_ids, locate(',', p_stack_ids) + 1);
END while;

-- 마지막 남은 기술 스택 ID를 삽입
if p_stack_ids <> '' then
    insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, p_stack_ids);
END if;

    -- 마지막 남은 스택 ID를 삽입합니다.
    if p_stack_ids <> '' then
        insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, p_stack_ids);
    END if;
END//

DELIMITER ;
```

<h4>Procedure call</h4>

```
sql
call linkpro.CreateServicePost_pro(12, 'web', '홈페이지를 완벽하게 제작', 1000000, '어떤 조건이든 최대한 맞춰서 제작해드립니다.', 'Y', '', '');
```

<h4>result</h4>

- 작업자가 등록한 판매글 리스트

![개발자서비스 등록bf](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/CreateServicePost_pro-bf.png?raw=true)

- 작업자가 새롭게 등록한 판매글

## ![개발자서비스 등록af](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/CreateServicePost_pro-af.png?raw=true)

<h3>ViewServicePost_pro : 개발자 서비스 조회</h3>
특정 개발자가 작성한 모든 서비스 판매글을 조회하는 프로시저

**요구사항 :** 개발자 ID를 입력받아 `pro_service` 테이블에서 해당 개발자의 모든 서비스를 조회

```
sql
call linkpro.ViewServicePost_pro(3);
```

- 작업자가 등록한 판매글 리스트
  ![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-bf.png?raw=true)

- id=3인 판매자가 등록한 판매글 리스트
  ![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-af.png?raw=true)

<h3>ViewServicePost_pro : 개발자 서비스 조회</h3>
특정 개발자가 작성한 모든 서비스 판매글을 조회하는 프로시저

**요구사항 :** 개발자 ID를 입력받아 `pro_service` 테이블에서 해당 개발자의 모든 서비스를 조회

<h4>Procedure Query</h4>

```
sql
DELIMITER //

-- view_service_posts 프로시저는 특정 작업자가 작성한 모든 서비스 판매글을 조회합니다.
CREATE procedure ViewServicePost_pro(in p_pro_id bigint)
BEGIN
    -- pro_service 테이블에서 주어진 작업자 ID에 해당하는 모든 서비스를 선택합니다.
    select * from pro_service where sv_pro_id = p_pro_id;
END//

DELIMITER ;

```

<h4> Procedure call </h4>

```
sql
call linkpro.ViewServicePost_pro(3);
```

<h4>result</h4>

- 작업자가 등록한 판매글 리스트
  ![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-bf.png?raw=true)

- id=3인 판매자가 등록한 판매글 리스트
  ![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-af.png?raw=true)

</details>

<details><summary> <h3>🗨️채팅 관련</h3>
</summary>
<h3>CreateChat : 채팅 생성</h3>

클라이언트와 작업자 간의 새로운 채팅 메시지를 생성하는 프로시저

**요구사항** : 클라이언트 ID, 작업자 ID, 채팅 메시지를 입력, chat 테이블에 새로운 레코드를 삽입

<h4>Procedure Query</h4>

```
sql
DELIMITER //

CREATE PROCEDURE CreateChat(
    IN p_chat_client_id BIGINT,
    IN p_chat_pro_id BIGINT,
    IN p_chat_contents VARCHAR(3000)
)
BEGIN
    INSERT INTO chat (chat_client_id, chat_pro_id, chat_contents)
    VALUES (p_chat_client_id, p_chat_pro_id, p_chat_contents);
END //

DELIMITER ;
```

<h4> Procedure call </h4>

```
sql
CALL CreateChat(1, 2, '안녕하세요, 프로젝트에 대해 이야기하고 싶습니다.');
```

<h4>result</h4>
- 채팅 리스트
![CreateChat](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/CreateChat-bf.png?raw=true)

- 채팅 추가 생성
  ![CreateChat](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/CreateChat-af.png?raw=true)

---

<h3>ViewChatContents: 채팅 조회</h3>

특정 클라이언트와 작업자 사이의 채팅 내역을 조회하는 프로시저

**요구사항** : 클라이언트 ID와 작업자 ID를 입력, chat 테이블에서 두 사용자 사이의 채팅 내역을 조회하고, 전송 시간을 기준으로 정렬

<h4>Procedure Query</h4>

```
sql
DELIMITER //

CREATE PROCEDURE ViewChatContents(
    IN p_chat_client_id BIGINT,
    IN p_chat_pro_id BIGINT
)
BEGIN
    SELECT chat_send_time, chat_contents
    FROM chat
    WHERE chat_client_id = p_chat_client_id AND chat_pro_id = p_chat_pro_id
    ORDER BY chat_send_time;
END //

DELIMITER ;
```

<h4> Procedure call </h4>

```
sql
call linkpro.ViewChatContents(2, 5);
```

<h4>result</h4>

- 채팅 리스트
  ![ViewChatContents-bf](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ViewChatContents-bf.png?raw=true)

- 클라이언트(client_id = 2)와 작업자 (pro_id = 5) 사이의 채팅 내역 조회
  ![ViewChatContents-af](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ViewChatContents-af.png?raw=true)

<h3>ViewChatContents: 채팅 조회</h3>
특정 클라이언트와 작업자 사이의 채팅 내역을 조회하는 프로시저

**요구사항 :** 클라이언트 ID와 작업자 ID를 입력, chat 테이블에서 두 사용자 사이의 채팅 내역을 조회하고, 전송 시간을 기준으로 정렬

```sql
-- ViewChatContents 프로시저
-- 특정 클라이언트와 작업자 사이의 채팅 내역을 조회

DELIMITER //

CREATE PROCEDURE ViewChatContents(
    IN p_chat_client_id BIGINT,
    IN p_chat_pro_id BIGINT
)
BEGIN
    SELECT chat_send_time, chat_contents
    FROM chat
    WHERE chat_client_id = p_chat_client_id AND chat_pro_id = p_chat_pro_id
    ORDER BY chat_send_time;
END //

DELIMITER ;

-- select * from chat;

-- 프로시저 테스트
-- 클라이언트(client_id = 1)와 작업자 (pro_id = 2) 사이의 채팅 내역 조회
-- CALL ViewChatContents(1, 2);


call linkpro.ViewChatContents(2, 5);

```

- 채팅 리스트
  ![ViewChatContents1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ViewChatContents-af.png?raw=true)

- 클라이언트(client_id = 2)와 작업자 (pro_id = 5) 사이의 채팅 내역 조회
  ![ViewChatContents2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ViewChatContents-bf.png?raw=true)

<summary> <h3>🛒주문 관련</h3>
</summary>

<h3>CreateOrder_Client</h3>

서비스 구매자는 원하는 작업을 선택하여 의뢰를 신청할 수 있다.

**요구 사항:** 구매자는 보유한 캐시 한도 안에서 원하는 작업을 의뢰할 수 있으며 이메일을 통한 본인 인증이 이루어지지 않으면 데이터를 불러오지 못해 주문을 의뢰할 수 없다.

<h4>Procedure Query</h4>

![CreateOrderClient1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/CreateOrder_Client1.png?raw=true)

<h4> Procedure call </h4>

```
sql
call linkpro.ViewServicePost_pro(3);
```

<h4>result</h4>

![CreateOrderClient2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/CreateOrder_Client2.png?raw=true)


<h3>SetOrderStart</h3>

개발자는 구매자가 요청한 주문을 수락할 수 있다.

**요구 사항:** 개발자가 주문을 수락하면 작업 금액만큼 구매자의 캐시가 차감된다. 

작업 금액의 절반은 착수금으로 바로 개발자의 캐시에 추가가 되며, 나머지 절반은 유보금으로 결제 대기 테이블에 보관되고 개발자가 주문을 완료하면 유보금이 개발자의 캐시에 추가 된다. 

개발자는 한번 취소한 주문은 다시 수락할 수 없으며 개발자가 프로필에 기입한 상주 여부와 관계없이 상주 여부는 반드시 표기해줘야 된다. 

만약 주문 수락 시 구매자의 캐시가 작업 금액보다 부족하면 주문을 수락할 수 없다. 타인이 주문 번호를 알고 있어도 주문 의뢰를 받은 개발자가 아니면 작업을 수락할 수 없다.

<h4>Procedure Query</h4>

![SetOrderStart1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/SetOrderStart1.png?raw=true)

![SetOrderStart2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/SetOrderStart2.png?raw=true)

<h4> Procedure call </h4>

```
sql
call linkpro.ViewServicePost_pro(3);
```

<h4>result</h4>

![SetOrderStart3](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/SetOrderStart3.png?raw=true)

<h3>SetOrderEnd</h3>

개발자는 작업이 끝나면 원할 때 작업을 마무리 할 수 있다.

**요구 사항:** 개발자가 주문을 완료하면 주문 상태가 완료가 되고 개발자가 받지 못한 유보금이 개발자의 캐시에 추가된다. 

주문 수락과 동일하게 주문 번호를 알고 있어도 작업을 진행하는 개발자 본인이 아니면 주문을 완료할 수 없다. 

추가로 개발자는 완료된 주문에 대해서는 작업 완료를 할 수 없으며 결제 대기 테이블은 이러한 기록을 위해 작업 완료 후에도 데이터가 삭제되지 않는다.

<h4>Procedure Query</h4>

![SetOrderEnd1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/SetOrderEnd1.png?raw=true)


<h4> Procedure call </h4>

```sql
call SetOrderEnd(주문번호, '전화번호');
```

<h4>result</h4>

![SetOrderEnd2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/SetOrderEnd2.png?raw=true)

<h3>ClientWriteReview : 구매자 리뷰 작성 </h3>

구매자가 개발자에 대한 리뷰를 작성하는 Procedure

**요구 사항**: 구매자가 이미 리뷰를 작성한 주문에 대해서는 다시 리뷰를 작성할 수 없다. 

또한 리뷰는 주문이 완료됐을 때만 작성이 가능하며 리뷰 작성과 동시에 작업을 수행한 개발자의 리뷰의 평균 점수가 개발자 평점으로 update.

<h4>Procedure Query</h4>

![ClientWriteReview1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ClientWriteReview1.png?raw=true)


<h4> Procedure call </h4>

```
sql
call ClientWriteReview(주문번호,'구매자닉네임',평점,'내용');
```

<h4>result</h4>

![ClientWriteReview2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ClientWriteReview2.png?raw=true)


</details>
