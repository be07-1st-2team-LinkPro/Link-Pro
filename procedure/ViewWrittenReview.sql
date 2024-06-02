DELIMITER //
-- ViewWrittenReview 프로시저는 특정 구매자가 작성한 모든 리뷰를 조회
CREATE procedure ViewWrittenReview(
	in p_client_id bigint -- 구매자 ID
)
BEGIN	
	select r.*
	from client_review r
    join order_service o on r.review_order_id = o.order_id
    where o.order_client_id = p_client_id;
END //

DELIMITER ;