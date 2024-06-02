DELIMITER // -- 구매자 계좌 충전
CREATE procedure ClientDepositCash(in 전화번호 varchar(20), in 충전금액 int)
BEGIN
    declare 보유캐시 int;
    declare 구매자ID bigint;
    select client_cash into 보유캐시 from client where client_tel = 전화번호;
    select client_id into 구매자ID from client where client_tel = 전화번호;
    -- 전화번호를 통해 입력받은 ID로 전화번호를 조회했을 때 입력받은 전화번호가 다르면 인증 실패
    if(select client_tel from client where client_id = 구매자ID)!=전화번호 then
        select '인증에 실패하였습니다.';
    else
        update client set client_cash = 보유캐시 + 충전금액 where client_tel = 전화번호;
        select '충전이 완료되었습니다.';
    end if;
END //
DELIMITER ;