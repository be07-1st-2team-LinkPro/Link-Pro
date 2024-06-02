DELIMITER //

-- view_service_posts 프로시저는 특정 개발자가 작성한 모든 서비스 판매글을 조회합니다.
CREATE procedure ViewServicePost_pro(in p_pro_id bigint)
BEGIN
    -- pro_service 테이블에서 주어진 개발자 ID에 해당하는 모든 서비스를 선택합니다.
    select * from pro_service where sv_pro_id = p_pro_id;
END//

DELIMITER ;

