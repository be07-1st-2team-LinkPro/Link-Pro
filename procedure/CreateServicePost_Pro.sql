DELIMITER //

-- CreateServicePost 프로시저는 새로운 서비스 판매글을 등록합니다.
CREATE procedure CreateServicePost_pro(
    in p_pro_id bigint,         -- 개발자 ID
    in p_sv_type enum('web', 'app'),  -- 서비스 유형
    in p_sv_name varchar(30),   -- 서비스 이름
    in p_sv_price int,          -- 서비스 가격
    in p_sv_contents VARCHAR(3000), -- 서비스 내용
    in p_sv_reside_YN enum('Y', 'N'), -- 거주 여부
    in p_sv_main_pic blob,      -- 서비스 대표 이미지
    in p_stack_ids text         -- 기술 스택 ID 목록 (쉼표로 구분된 문자열)
)
BEGIN
    declare sv_id bigint;       -- 새로운 서비스 ID를 저장할 변수

    -- pro_service 테이블에 새로운 서비스 판매글을 삽입합니다.
    insert into pro_service(sv_pro_id, sv_type, sv_name, sv_price, sv_contents, sv_reside_YN, sv_main_pic)
    values (p_pro_id, p_sv_type, p_sv_name, p_sv_price, p_sv_contents, p_sv_reside_YN, p_sv_main_pic);

    -- 방금 삽입한 서비스의 ID를 가져옵니다.
    set sv_id = LAST_INSERT_ID();

   -- service_stack 테이블에 사용된 기술 스택을 삽입합니다.
while locate(',', p_stack_ids) > 0 DO
    -- 쉼표로 구분된 첫 번째 기술 스택 ID 추출
    set @stack_id = SUBSTRING_INDEX(p_stack_ids, ',', 1);
    -- service_stack 테이블에 기술 스택 ID 삽입
    insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, @stack_id);
    -- 처리된 기술 스택 ID를 p_stack_ids 문자열에서 제거
    set p_stack_ids = SUBSTRING(p_stack_ids, locate(',', p_stack_ids) + 1);
END while;

-- 마지막 남은 기술 스택 ID를 삽입
if p_stack_ids <> '' then
    insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, p_stack_ids);
END if;

    -- 마지막 남은 스택 ID를 삽입합니다.
    if p_stack_ids <> '' then
        insert into service_stack(ss_service_id, ss_stack_id) values (sv_id, p_stack_ids);
    END if;
END//

DELIMITER ;
