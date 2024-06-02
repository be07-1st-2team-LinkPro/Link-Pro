-- 개발자 자기소개글 작성 CreateProPR 프로시저

select * from pro_pr_post;

DELIMITER //

CREATE PROCEDURE CreateProPR (
    IN pr_pro_id BIGINT,
    IN pr_title VARCHAR(100),
    IN pr_contents VARCHAR(1000),
    IN pr_github VARCHAR(1000)
)
BEGIN
    INSERT INTO pro_pr_post (pr_pro_id, pr_title, pr_contents, pr_github)
    VALUES (pr_pro_id, pr_title, pr_contents, pr_github);
END //

DELIMITER ;

-- 테스트
-- CALL CreateProPR(1, '자기소개 작성 테스트', '자기소개 내용', 'https://github.com/developer');

