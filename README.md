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

```
sql
call ProSignUp('이메일', '이름', '닉네임', '비밀번호', '전화번호', '지역');

```
 ![ProSignUp2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/prosignup2.png?raw=true)

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

-- 작업자 회원탈퇴 테스트 코드
-- 특정 작업자 탈퇴 처리 (pro_id = 10인 작업자 탈퇴 처리 예시)
CALL ProSignOut(10);

-- 테스트 확인
-- select * from pro;

-- 데이터 복구
-- update pro set pro_del_YN = 'N' where pro_id = 10;

```
- 작업자의 리스트
![ProSignOut1](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignOut-bf.png?raw=true)

- pro_id 가 10인 작업자 회원 탈퇴
![ProSignOut2](https://github.com/be07-1st-2team-LinkPro/Link_Pro/blob/main/read_me_img/ProSignOut-af.png?raw=true)
---
<h3>ProUpdateProfile : 개발자 프로필 수정</h3>

작업자 프로필을 수정하는 프로시저

**요구사항** : 작업자 ID와 여러 프로필 정보를 입력, 각 입력값이 `NULL` 인 경우 해당 컬럼을 업데이트하지 않음, `coalesce` 를 사용하여 입력값이 `null` 인 경우 기존 값을 유지

<h4>Procedure Query</h4>



---

<details>

  <summary><h3>🛠서비스(외주 프로젝트) 관련 </h3></summary>
  <h3>CreateServicePost_pro : 개발자 서비스 등록</h3>

  새로운 서비스 판매글을 등록하는 프로시저

**요구사항 :** 개발자 ID, 서비스 유형, 서비스 이름, 서비스 가격, 서비스 내용, 거주 여부, 서비스 대표 이미지, 기술 스택 ID 목록을 입력받아 `pro_service` 테이블에 삽입

- 작업자가 등록한 판매글 리스트
![개발자서비스 등록bf](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/CreateServicePost_pro-bf.png?raw=true)

- 작업자가 새롭게 등록한 판매글
![개발자서비스 등록af](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/CreateServicePost_pro-af.png?raw=true)
---

<h3>ViewServicePost_pro : 개발자 서비스 조회</h3>
특정 개발자가 작성한 모든 서비스 판매글을 조회하는 프로시저

**요구사항 :** 개발자 ID를 입력받아 `pro_service` 테이블에서 해당 개발자의 모든 서비스를 조회

```sql
call linkpro.ViewServicePost_pro(3);
```
- 작업자가 등록한 판매글 리스트
![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-bf.png?raw=true)

- id=3인 판매자가 등록한 판매글 리스트
![ViewServicePost_pro ](https://github.com/be07-1st-2team-LinkPro/Link-Pro/blob/main/read_me_img/ViewServicePost_pro-af.png?raw=true)

</details>

<details><summary> <h3>🗨️채팅 관련</h3>
</summary>
<h3>CreateChat : 채팅 생성</h3>



<h3>ViewChatContents: 채팅 조회</h3>




<details>

</details>

<details><summary> <h3>🛒주문 관련</h3>
</summary>
<h3>CreateOrder_Client</h3>


<h3>RespondServiceRequest</h3>


<h3>SetOrderStart</h3>


<h3>SetOrderEnd</h3>


<details>
