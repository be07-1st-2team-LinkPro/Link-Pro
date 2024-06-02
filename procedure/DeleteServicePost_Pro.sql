DELIMITER //

-- deleteservicepost 프로시저는 주어진 서비스 ID에 해당하는 판매글을 삭제합니다.
CREATE procedure DeleteServicePost(in p_sv_id bigint)
BEGIN
    -- service_stack 테이블에서 해당 서비스에 연결된 모든 기술 스택을 삭제합니다.
    delete from service_stack where ss_service_id = p_sv_id;
    -- pro_service 테이블에서 해당 서비스를 삭제합니다.
    delete from pro_service where sv_id = p_sv_id;
END//

DELIMITER ;