DELIMITER // -- 개발자 캐시 출금
CREATE procedure WithdrawCash_Pro(in 전화번호 varchar(20), in 비밀번호 varchar(100), in 출금금액 int)
BEGIN
    declare 보유캐시 int;
    declare 남은금액 int;
    declare proId bigint;
    declare proPw varchar(100);
    select pro_id into proId from pro where pro_tel = 전화번호;
    select pro_pw into proPw from pro where pro_id = proId;
    -- 번호와 비밀번호가 일치하면 인증 성공
    if (select count(*) from pro where pro_tel = 전화번호 > 0 and (select count(*) from pro where proPw = 비밀번호 > 0)) then
        select pro_cash into 보유캐시 from pro where pro_tel = 전화번호;
        set 남은금액 = 보유캐시 - 출금금액;
        update pro set pro_cash = 남은금액 where pro_tel = 전화번호;
        select '출금 완료되었습니다.';
    else
        select '접근이 거절되었습니다(잘못된 정보 입력)';
    end if;
END //
DELIMITER ;