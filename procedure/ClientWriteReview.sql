DELIMITER //
CREATE procedure ClientWriteReview(in 주문번호 bigint,in 닉네임 varchar(30), in 점수 int, in 내용 varchar(1000))
begin
    declare 구매자ID bigint;
    declare 개발자ID bigint;
    declare 총리뷰개수 int;
    declare 리뷰합계 int default 0;
    declare 평균점수 decimal(2,1);
    select order_pro_id into 개발자ID from order_service where order_id = 주문번호;
    select client_id into 구매자ID from client where client_nickname = 닉네임;
    -- 1< 리뷰점수 <5 를 벗어난 점수 입력이 메세지 출력
    if 점수>5 or 점수<1 then
        select '리뷰 점수는 최소 1점 최대 5점입니다.';
        -- 만약 주문번호와 구매자가 동일한 리뷰를 작성 시 리뷰 작성 불가
    elseif (select count(*) from client_review where review_order_id = 주문번호 and review_client_id = 구매자ID) =1 then
        select '이미 리뷰를 작성한 주문입니다.';
        -- order state가 완료일 때만 리뷰 작성이 가능하다
    elseif (select order_state from order_service where order_pro_id = 개발자ID and order_id = 주문번호)='done' then
        insert into client_review(review_order_id, review_pro_id, review_like_score, review_contents, review_client_id)
        values (주문번호, 개발자ID, 점수, 내용, 구매자ID);
        -- 총 리뷰 개수와 리뷰 점수 합계를 세팅하고
        select count(*), sum(client_review.review_like_score) into 총리뷰개수, 리뷰합계 from client_review where review_pro_id = 개발자ID;
        -- 여기서 계산하여 리뷰의 평균 점수를 계산하여
        set 평균점수 = 리뷰합계 / 총리뷰개수;
        -- 계산된 값은 개발자의 평균 점수가 된다.
        update pro set pro_score = 평균점수 where pro_id = 개발자ID;
    else
        -- order state가 완료가 아닌 모든 경우에는 리뷰 작성 불가
        select '리뷰를 작성할 수 없습니다.';
    end if;
    -- 리뷰가 작성된 경우 성공 메시지 출력
    select '리뷰가 성공적으로 작성되었습니다.';
end //
DELIMITER ;
