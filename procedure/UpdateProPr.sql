-- UpdateProPR 프로시저 
-- 개발자 자기소개글 수정
-- pr_post_id(자기소개글ID)와 pro_id(개발자ID)가 일치해야 자기소개글 수정(제목, 내용, 깃허브링크)이 가능하다.

DELIMITER //

CREATE PROCEDURE UpdateProPR (
    IN p_pr_post_id BIGINT,
    IN p_pr_pro_id BIGINT,
    IN p_pr_title VARCHAR(100),
    IN p_pr_contents VARCHAR(1000),
    IN p_pr_github VARCHAR(1000)
)
BEGIN
    UPDATE pro_pr_post
    SET 
        pr_title = IFNULL(p_pr_title, pr_title),
        pr_contents = IFNULL(p_pr_contents, pr_contents),
        pr_github = IFNULL(p_pr_github, pr_github)
    WHERE pr_post_id = p_pr_post_id AND pr_pro_id = p_pr_pro_id;
END //

DELIMITER ;

-- 자기소개글 수정 테스트
-- CALL UpdateProPR(1, 1, '수정된 제목입니다.', NULL, 'https://github.com/newdeveloper');

-- 1,1 원래 데이터 : 안녕하세요 :）홈페이지 제작전문기업입니다.