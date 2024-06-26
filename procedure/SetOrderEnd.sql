DELIMITER // -- 개발자 작업 완료
CREATE procedure SetOrderEnd(in 주문번호 bigint, in 전화번호 varchar(20))
BEGIN
    declare 임시결제id bigint;
    declare 유보금 int default 0;
    declare 개발자캐시 int default 0;
    declare 개발자id bigint;
    declare 주문ID bigint;
    declare 결제완료여부 char(1);
    select pro_id into 개발자id from pro where pro_tel = 전화번호;
    select pro_cash into 개발자캐시 from pro where pro_tel = 전화번호;
    select standby_id into 임시결제id from pay_standby where standby_order_id = 주문번호;
    select holding_price into 유보금 from pay_standby where standby_order_id = 주문번호;
    select order_id into 주문ID from order_service where order_pro_id = 개발자id and order_id = 주문번호 limit 1;
    select standby_isdone into 결제완료여부 from pay_standby where standby_order_id = 주문번호 limit 1;
    set 개발자캐시 = 개발자캐시 + 유보금;
    -- 주문 번호를 알고 있어도 당사자의 전화번호가 아니면 접근 불가
    if 주문ID is null then
        select '접근 권한이 없는 주문입니다.';
        -- 작업이 완료된 주문은 다시 완료할 수 없음.
        -- 해당 쿼리로 확인하지 않으면 개발자는 무한으로 자산을 증식 가능
    elseif 결제완료여부 = 'Y' then
        select '이미 완료된 주문입니다.';
    else
        -- 개발자 캐시 업데이트
        update pro set pro_cash = 개발자캐시 where pro_id = 개발자id;

        -- pay_standby와 order_service 테이블 업데이트
        update pay_standby set standby_isdone = 'Y' where standby_order_id = 주문번호;
        update order_service set order_end_date = current_timestamp, order_state = 'done' where order_id = 주문번호;

        select '작업이 완료되었습니다.';
    end if;
end //
DELIMITER ;
