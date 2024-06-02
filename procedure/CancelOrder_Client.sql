DELIMITER // -- 구매자 주문 취소
CREATE procedure CancelOrder_Client(in 전화번호 varchar(20), in 주문번호 bigint)
BEGIN
    declare clientID bigint;
    select client_id into clientID from client where client_tel = 전화번호;
    -- 주문 상태가 대기, 거절일 때만 삭제 가능
    if(select order_state from order_service where order_id = 주문번호)='standby' or (select order_state from order_service where order_id = 주문번호)='reject' then
    Delete from order_service where order_client_id = clientID && order_id = 주문번호;
    else
        select '취소할 수 없는 주문입니다.';
    end if;
end //
DELIMITER ;