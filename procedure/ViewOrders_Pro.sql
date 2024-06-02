DELIMITER //

-- view_orders 프로시저는 특정 개발자에게 들어온 모든 주문을 조회합니다.
CREATE procedure ViewOrders(in p_pro_id bigint)
BEGIN
    -- order_service 테이블에서 주어진 개발자 ID에 해당하는 모든 주문을 선택합니다.
    select * from order_service where order_pro_id = p_pro_id;
END//

DELIMITER ;