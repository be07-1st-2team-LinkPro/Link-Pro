DELIMITER //

-- RespondServiceRequest 프로시저는 서비스 요청에 대한 거절을 처리합니다.
CREATE PROCEDURE RespondServiceRequest(
    IN p_order_id BIGINT,                     -- 주문 ID (입력 매개변수)
    IN 전화번호 varchar(20)    -- 전화번호를 통해 proID 조회
)
BEGIN
    declare proID bigint;
    select pro_id into proID from pro where pro_tel = 전화번호;
    -- order_service 테이블에서 주어진 주문 ID에 해당하는 레코드의 상태를 업데이트합니다.
    UPDATE order_service
    SET order_state = 'reject'              -- order_state 필드를 입력된 응답으로 설정합니다.ㅣ
    WHERE order_id = p_order_id and order_pro_id = proID; -- 조건: 주문 ID가 입력된 주문 ID와 일치하고 proID도 일치해야 하는 레코드
END//

DELIMITER //
