DELIMITER //

-- update_service_post 프로시저는 기존의 서비스 판매글을 수정합니다.
CREATE procedure UpdateServicePost(
    in p_sv_id bigint,
    in p_sv_type ENUM('web', 'app'),
    in p_sv_name varchar(30),
    in p_sv_price int,
    in p_sv_contents varchar(3000),
    in p_sv_reside_YN enum('Y', 'N'),
    in p_sv_main_pic blob,
    in p_stack_ids text
)
BEGIN
    -- pro_service 테이블에서 주어진 서비스 ID에 해당하는 레코드를 업데이트합니다.
    update pro_service
    set sv_type = p_sv_type,
        sv_name = p_sv_name,
        sv_price = p_sv_price,
        sv_contents = p_sv_contents,
        sv_reside_YN = p_sv_reside_YN,
        sv_main_pic = p_sv_main_pic
    where sv_id = p_sv_id;

    -- 기존의 service_stack 레코드를 삭제하고 새로 삽입합니다.
    delete from service_stack where ss_service_id = p_sv_id;

    -- 새로운 기술 스택을 service_stack 테이블에 삽입합니다.
    while locate(',', p_stack_ids) > 0 DO
        set @stack_id = SUBSTRING_INDEX(p_stack_ids, ',', 1);
        insert into service_stack(ss_service_id, ss_stack_id) values (p_sv_id, @stack_id);
        set p_stack_ids = SUBSTRING(p_stack_ids, locate(',', p_stack_ids) + 1);
    END while;

    -- 마지막 남은 스택 ID를 삽입합니다.
    if p_stack_ids <> '' then
        insert into service_stack(ss_service_id, ss_stack_id) values (p_sv_id, p_stack_ids);
    END IF;
END//

DELIMITER ;

