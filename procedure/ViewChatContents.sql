-- ViewChatContents 프로시저 
-- 특정 클라이언트와 개발자 사이의 채팅 내역을 조회

DELIMITER //

CREATE PROCEDURE ViewChatContents(
    IN p_chat_client_id BIGINT,
    IN p_chat_pro_id BIGINT
)
BEGIN
    SELECT chat_send_time, chat_contents
    FROM chat
    WHERE chat_client_id = p_chat_client_id AND chat_pro_id = p_chat_pro_id
    ORDER BY chat_send_time;
END //

DELIMITER ;

-- select * from chat;

-- 프로시저 테스트
-- 클라이언트(client_id = 1)와 개발자(pro_id = 2) 사이의 채팅 내역 조회
-- CALL ViewChatContents(1, 2);
