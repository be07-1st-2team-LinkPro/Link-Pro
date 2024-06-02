-- 개발자 기술 삭제 DeleteProTech 프로시저

DELIMITER //

CREATE PROCEDURE DeleteProTech(
    IN p_ps_pro_id BIGINT,
    IN p_ps_stack_id BIGINT
)
BEGIN
    DELETE FROM pro_stack
    WHERE ps_pro_id = p_ps_pro_id AND ps_stack_id = p_ps_stack_id;
END //

DELIMITER ;

-- 개발자 기술 삭제 DeleteProTech 프로시저 테스트
-- 개발자(pro_id = 1)가 특정 기술(stack_id = 78)을 삭제 : AddProTech 테스트 복구
-- CALL DeleteProTech(1, 78);

-- select * from pro_stack;