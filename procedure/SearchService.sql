DELIMITER //

-- SearchServiceByName 프로시저는 서비스명을 기준으로 서비스를 검색합니다.
CREATE procedure SearchServiceByServiceName(
    in p_search_term varchar(100)  -- 검색어
)
BEGIN
    select s.*, p.pro_name
    from pro_service s
    join pro p on s.sv_pro_id = p.pro_id
    where s.sv_name like CONCAT('%', p_search_term, '%');
END //

DELIMITER ;


DELIMITER //

-- 개발자 이름으로 서비스 판매글을 조회하는 통합 프로시저
CREATE PROCEDURE SearchServiceByDeveloperName(
    IN p_pro_name VARCHAR(100) -- 개발자 이름
)
BEGIN
    DECLARE v_pro_id BIGINT;

    -- 개발자 이름으로 개발자 ID를 조회합니다.
    SELECT pro_id INTO v_pro_id
    FROM pro
    WHERE pro_name LIKE CONCAT('%', p_pro_name, '%')
    LIMIT 1;

    -- 개발자 ID로 서비스 판매글을 조회합니다.
    SELECT s.*, p.pro_name
    FROM pro_service s
    JOIN pro p ON s.sv_pro_id = p.pro_id
    WHERE s.sv_pro_id = v_pro_id;
END //

DELIMITER ;

