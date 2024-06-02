-- AddProTech 개발자 기술추가 프로시저

-- select * from pro_stack;
-- select * from stack;

DELIMITER //

CREATE PROCEDURE AddProTech(
    IN p_ps_pro_id BIGINT,
    IN p_ps_stack_id BIGINT
)
BEGIN
    INSERT INTO pro_stack (ps_pro_id, ps_stack_id)
    VALUES (p_ps_pro_id, p_ps_stack_id);
END //

DELIMITER ;

-- 개발자 기술추가 테스트
-- 개발자(pro_id = 1)가 특정 기술(stack_id = 78)을 보유하도록 추가 -> ps_id 90으로 추가됨
-- CALL AddProTech(1, 78);
