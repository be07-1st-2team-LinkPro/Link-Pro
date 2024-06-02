DELIMITER // -- 구매자 작업 의뢰
CREATE procedure CreateOrder_Client(in 게시물번호 bigint, in 구매자이메일 varchar(50))
BEGIN
    DECLARE 작업금액 int default 0;
    DECLARE 구매자보유캐시 int default 0;
    DECLARE 구매자id bigint;
    DECLARE 개발자id bigint;
    select client_id into 구매자id from client where client_email = 구매자이메일;
    select sv_pro_id into 개발자id from pro_service where sv_id = 게시물번호;
    select sv_price into 작업금액 from pro_service where sv_id = 게시물번호;
    select client_cash into 구매자보유캐시 from client where client_email = 구매자이메일;
    -- 작업금액이나 구매자보유캐시가 이상이 있을 경우 에러 반환
    if 작업금액 is null or 구매자보유캐시 is null then
        select '데이터를 불러오는 데 오류가 발생했습니다.';
    -- 작업금액이 구매자가 보유한 캐시보다 비싸면 에러 반환
    elseif 작업금액 > 구매자보유캐시 then
        select '보유 금액이 부족합니다.';
    else
        insert into order_service(order_sv_id, order_pro_id, order_price, order_client_id)
        values (게시물번호, 개발자id, 작업금액, 구매자id);
        select '주문이 성공적으로 생성되었습니다.';
    end if;
end //
DELIMITER ;