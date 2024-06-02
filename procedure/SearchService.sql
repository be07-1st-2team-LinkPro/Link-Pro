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

-- SearchServiceByDeveloper 프로시저는 개발자명을 기준으로 서비스를 검색합니다.
CREATE procedure SearchServiceByProName(
    in p_search_term varchar(100)  -- 검색어
)
BEGIN
    select s.*, p.pro_name
    from pro_service s
    join pro p on s.sv_pro_id = p.pro_id
    where p.pro_name like CONCAT('%', p_search_term, '%');
END //

DELIMITER ;
