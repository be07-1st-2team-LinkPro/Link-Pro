--임시결제 테이블
CREATE TABLE pay_standby (           
	standby_id BIGINT auto_increment, --결제대기 ID
	standby_order_id BIGINT not null, --(order)주문ID
	standby_client_id BIGINT not null, --(client)구매자ID
	standby_pro_id BIGINT not null, --(pro)개발자ID
	sending_price INT not null, --보낼 돈
	holding_price INT not null, --가지고 있을 돈
	PRIMARY KEY(standby_id), --PK : 결제대기 ID 
	FOREIGN KEY (standby_order_id) REFERENCES order(order_id) -- FK : 주문ID에 구매자, 개발자 정보 저장되어 있을 것이므로 주문ID만 FK 따오면 됨
);

--채팅 테이블
CREATE TABLE chat (
	chat_id BIGINT auto_increment, --채팅ID
	chat_client_id BIGINT not null, --구매자ID
	chat_pro_id BIGINT not null, --개발자ID
	chat_sv_id BIGINT not null, --포트폴리오(서비스판매글)ID
	chat_send_time DATETIME default current_timestamp, --전송시간
	chat_contents VARCHAR(3000) not null,--채팅내용 
	PRIMARY KEY(chat_id), --PK : 채팅ID
	FOREIGN KEY (chat_client_id) REFERENCES client(client_id),       
	FOREIGN KEY (chat_pro_id) REFERENCES pro(pro_id),
	FOREIGN KEY (chat_sv_id) REFERENCES pro_service(sv_id) -- FK : 채팅방 테이블과 채팅기록 테이블 분리해야 할 것 같음
);

--서비스판매글 테이블
CREATE TABLE pro_service (
	sv_id BIGINT auto_increment, --판매글ID
	sv_pro_id BIGINT not null, --개발자ID
	sv_type ENUM ('web', 'app') default 'web', not null, --서비스유형
	sv_name VARCHAR(30) unique, --판매글명
	sv_eep DATETIME not null, --예상기간
	sv_pro_score DECIMAL(1,1) not null, --프로평점
	sv_price INT not null, --가격
	sv_contents VARCHAR(3000) not null, --내용
	sv_reside_YN ENUM(Y,N) not null, --상주여부
	sv_like_score INT default 0, -- 서비스 평점
	sv_main_pic	BLOB, --대표사진
	PRIMARY KEY(sv_id), -- PK : 판매글ID
	FOREIGN KEY (sv_pro_id) REFERENCES pro(pro_id) --FK : 개발자ID
);
