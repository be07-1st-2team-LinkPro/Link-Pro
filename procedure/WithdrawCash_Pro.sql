DELIMITER //
CREATE PROCEDURE WithdrawCash_Pro(in 전화번호 varchar(20), in 비밀번호 varchar(100), in 출금금액 int)
BEGIN
    declare 보유캐시 int;
    declare 남은금액 int;
    declare proId bigint;
    declare proPw varchar(100);
    -- 전화번호로 pro_id와 pro_cash를 가져옴
    select pro_id, pro_cash, pro_pw into proId, 보유캐시, proPw from pro where pro_tel = 전화번호;
    -- 보유 캐시가 출금 금액보다 적으면 오류 메시지 반환
    if 보유캐시 < 출금금액 then
        select '잔고가 부족합니다.';
    else
        -- 번호와 비밀번호가 일치하는지 확인
        if proPw = 비밀번호 then
            -- 출금 처리
            set 남은금액 = 보유캐시 - 출금금액;
            update pro set pro_cash = 남은금액 where pro_tel = 전화번호;
            select '출금 완료되었습니다.';
        else
            select '접근이 거절되었습니다(잘못된 정보 입력)';
        end if;
    end if;
END //
DELIMITER ;
