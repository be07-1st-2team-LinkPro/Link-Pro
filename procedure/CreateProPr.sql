-- 개발자 자기소개글 작성 CreateProPR 프로시저

-- 개발자 한명 당 한개의 자기소개 글을 작성할 수 있다.(pro_id 중복 불가)
-- 개발자id(pro_id), 자기소개 제목(pr_title), 자기소개 내용(pr_contents), 깃허브 링크(pr_github) 순으로 입력하여 자기소개글 작성
-- 만약 이미 작성한 자기소개글이 있는 상태에서 한번 더 작성하면 데이터가 삽입되지 않는다.

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

-- 자기소개글 작성 테스트
-- CALL CreateProPR(1, '자기소개 작성 테스트', '자기소개 내용', 'https://github.com/developer');

