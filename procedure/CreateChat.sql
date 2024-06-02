-- 채팅생성 CreateChat 프로시저
-- client id, pro_id, 채팅메시지를 입력하여 채팅메시지 생성
DELIMITER //

CREATE PROCEDURE CreateChat(
    IN p_chat_client_id BIGINT,
    IN p_chat_pro_id BIGINT,
    IN p_chat_contents VARCHAR(3000)
)
BEGIN
    INSERT INTO chat (chat_client_id, chat_pro_id, chat_contents)
    VALUES (p_chat_client_id, p_chat_pro_id, p_chat_contents);
END //

DELIMITER ;

-- select * from chat;

-- 프로시저 테스트 : 새로운 채팅 메시지 생성
-- 클라이언트(client_id = 1)와 개발자(pro_id = 2) 사이의 새로운 채팅 메시지 생성
-- CALL CreateChat(1, 2, '안녕하세요, 프로젝트에 대해 이야기하고 싶습니다.');
