DELIMITER //

-- ViewProProfile 프로시저는 특정 서비스의 개발자 프로필을 조회
CREATE procedure ViewProProfile(
	in p_sv_id bigint -- 서비스 ID
)

BEGIN
	select p.*
	from  pro_service s
    join pro p on s.sv_pro_id = p.pro_id
    where s.sv_id = p_sv_id;
END //

DELIMITER ;