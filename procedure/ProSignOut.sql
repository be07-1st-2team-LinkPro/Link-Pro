-- ProSignOut 프로시저
-- 개발자 회원탈퇴 

DELIMITER //

CREATE PROCEDURE ProSignOut(
    IN p_pro_id BIGINT
)
BEGIN
    UPDATE pro
    SET pro_del_YN = 'Y'
    WHERE pro_id = p_pro_id;
END //

DELIMITER ;

-- 개발자 회원탈퇴 테스트 코드
-- 특정 개발자 탈퇴 처리 (pro_id = 10인 개발자 탈퇴 처리 예시)
CALL ProSignOut(10);

-- 테스트 확인
-- select * from pro;

-- 데이터 복구
-- update pro set pro_del_YN = 'N' where pro_id = 10;

