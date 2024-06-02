DELIMITER // -- 구매자가 본인이 구매 신청한 목록 조회
CREATE procedure ViewOrders_Client(in 닉네임 varchar(30))
BEGIN
    declare 구매자ID bigint;
    select client_id into 구매자ID from client where client_nickname = 닉네임;
    -- 주문 상태별로 결과 조회
    select
        order_state as 상태,
        order_id as 주문번호,
        case
            -- 작업이 수락 혹은 완료일 때 작업날짜 연-월-일, 24시간,분으로 표기
            when order_state = 'accept' then date_format(order_start_date, '%y-%m-%d, %H시-%i분')
            when order_state = 'done' then date_format(order_end_date, '%y-%m-%d, %H시-%i분')
            else null
            end as '작업날짜(연-월-일)',
        case
            -- 작업이 취소 혹은 대기일 때 상태메시지로 반환
            when order_state = 'reject' then '취소된 주문입니다'
            when order_state = 'standby' then '주문 수락 전입니다.'
            else null
            end as 상태메시지
    from order_service
    where order_client_id = 구매자ID;
end //
DELIMITER ;