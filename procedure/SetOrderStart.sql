DELIMITER // -- 개발자 작업 수락
CREATE procedure SetOrderStart(in 주문번호 bigint, in 전화번호 varchar(20), in 상주여부 enum('Y', 'N'))
BEGIN
    declare 개발자id bigint;
    declare 구매자id bigint;
    declare 작업금액 int default 0;
    declare 착수금 int default 0;
    declare 유보금 int default 0;
    declare 개발자캐시 int default 0;
    declare 구매자캐시 int default 0;
    declare 주문상태 enum('standby', 'reject', 'accept', 'done');
    -- 개발자 ID 가져오기
    select pro_id into 개발자id from pro where pro_tel = 전화번호;
    -- 구매자 ID 가져오기
    select order_client_id into 구매자id from order_service where order_id = 주문번호;
    -- 작업 금액 가져오기
    select order_price into 작업금액 from order_service where order_id = 주문번호;
    -- 착수금 및 유보금 설정
    set 착수금 = 작업금액/2;
    set 유보금 = 작업금액/2;
    -- 개발자 캐시 가져오기
    select pro_cash into 개발자캐시 from pro where pro_id = 개발자id;
    -- 구매자 캐시 가져오기
    select client_cash into 구매자캐시 from client where client_id = 구매자id;
    -- 주문 상태 가져오기
    select order_state into 주문상태 from order_service where order_id = 주문번호;
    -- 전화번호를 통해 받은 개발자 ID를 통해 주문 상태 조회
    if (select count(*) from order_service where order_pro_id = 개발자id and order_state = 'standby') = 0 then
        select '대기중인 주문이 없습니다.';
    -- 만약 구매자가 현재 보유한 캐시가 작업 금액보다 부족하면 에러 반환
    elseif (구매자캐시 < 작업금액) then
        select '구매자의 보유금이 부족합니다. 구매자와 연락바랍니다.';
    -- 주문 상태에 따른 메세지
    elseif 주문상태 = 'accept' then
        select '이미 시작된 주문입니다.';
    elseif 주문상태 = 'done' then
        select '이미 완료된 주문입니다.';
    elseif 주문상태 = 'reject' then
        select '거절된 주문은 다시 수락할 수 없습니다.';
    else
        -- 주문 시작 날짜 업데이트
        update order_service set order_start_date = current_timestamp where order_id = 주문번호;
        -- 주문 상태 업데이트
        update order_service set order_state = 'accept' where order_id = 주문번호;
        -- 상주 여부 업데이트
        update order_service set order_reside = 상주여부 where order_id = 주문번호;
        -- pay_standby테이블 Row 추가
        insert into pay_standby(standby_order_id, sending_price, holding_price, standby_isaccept)
        values (주문번호, 착수금, 유보금, 'Y');
        -- 개발자에게 주문 금액의 50% 선입금
        set 개발자캐시 = 개발자캐시 + 착수금;
        -- 구매자 캐시 차감
        set 구매자캐시 = 구매자캐시 - 작업금액;
        update pro set pro_cash = 개발자캐시 where pro_id = 개발자id;
        update client set client_cash = 구매자캐시 where client_id = 구매자id;
        -- 성공 메시지
        select '주문이 성공적으로 시작되었습니다.';
    end if;
end //
DELIMITER ;