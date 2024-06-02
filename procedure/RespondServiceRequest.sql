DELIMITER //

-- RespondServiceRequest 프로시저는 서비스 요청에 대한 수락 또는 거절을 처리합니다.
CREATE PROCEDURE RespondServiceRequest(
    IN p_order_id BIGINT,                     -- 주문 ID (입력 매개변수)
    IN p_response ENUM('accept', 'reject')    -- 응답 (입력 매개변수: 'accept' 또는 'reject')
)
BEGIN
    -- order_service 테이블에서 주어진 주문 ID에 해당하는 레코드의 상태를 업데이트합니다.
    UPDATE order_service
    SET order_state = p_response              -- order_state 필드를 입력된 응답으로 설정합니다.
    WHERE order_id = p_order_id;              -- 조건: 주문 ID가 입력된 주문 ID와 일치하는 레코드
END//

DELIMITER ;

