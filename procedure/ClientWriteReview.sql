DELIMITER //
CREATE procedure ClientWriteReview(in 주문번호 bigint, in 닉네임 varchar(30), in 점수 int, in 내용 varchar(1000))
begin
    declare 구매자ID bigint;
    declare 판매자ID bigint;
    
    select order_pro_id into 판매자ID from order_service where order_id = 주문번호;
    select client_id into 구매자ID from client where client_nickname = 닉네임;
    -- 리뷰 점수가 5점이 넘으면 메시지 출력
    if 점수>5 then
        select '리뷰 점수는 5점이 최대입니다.';
    -- order state가 완료일 때만 리뷰 작성 가능
    elseif (select order_state from order_service where order_pro_id = 판매자ID and order_id = 주문번호)='done' then
        insert into client_review(review_order_id, review_pro_id, review_like_score, review_contents, review_client_id)
        values (주문번호, 판매자ID, 점수, 내용, 구매자ID);
    -- 다른 모든 경우에는 리뷰를 작성할 수 없음
    else
        select '리뷰를 작성할 수 없습니다.';
    -- 리뷰가 작성된 경우 성공 메시지 출력
    end if;
    select '리뷰가 성공적으로 작성되었습니다.';
end //
DELIMITER ;