-- 개발자 프로필 수정 ProUpdateProfile

-- COALESCE(p_pro_name, pro_name)는 
-- p_pro_name이 NULL이 아니면 p_pro_name 값을 사용하고, NULL이면 기존의 pro_name 값을 유지합니다.
-- 이런 식으로 각 컬럼에 대해 조건을 추가하여 NULL 값이 입력될 경우 해당 컬럼을 업데이트하지 않도록 합니다.

DELIMITER //

CREATE PROCEDURE ProUpdateProfile(
    IN p_pro_id BIGINT,
    IN p_pro_name VARCHAR(30),
    IN p_pro_nickname VARCHAR(30),
    IN p_pro_email VARCHAR(50),
    IN p_pro_pw VARCHAR(30),
    IN p_pro_tel VARCHAR(20),
    IN p_pro_career_exp INT,
    IN p_pro_reside_YN ENUM('Y', 'N'),
    IN p_pro_region ENUM('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'),
    IN p_pro_pr_id INT,
    IN p_pro_total_sales BIGINT,
    IN p_pro_score DECIMAL(2,1),
    IN p_pro_cash INT,
    IN p_pro_del_YN ENUM('Y', 'N')
)
BEGIN
    UPDATE pro
    SET
        pro_name = COALESCE(p_pro_name, pro_name),
        pro_nickname = COALESCE(p_pro_nickname, pro_nickname),
        pro_email = COALESCE(p_pro_email, pro_email),
        pro_pw = COALESCE(p_pro_pw, pro_pw),
        pro_tel = COALESCE(p_pro_tel, pro_tel),
        pro_career_exp = COALESCE(p_pro_career_exp, pro_career_exp),
        pro_reside_YN = COALESCE(p_pro_reside_YN, pro_reside_YN),
        pro_region = COALESCE(p_pro_region, pro_region),
        pro_pr_id = COALESCE(p_pro_pr_id, pro_pr_id),
        pro_total_sales = COALESCE(p_pro_total_sales, pro_total_sales),
        pro_score = COALESCE(p_pro_score, pro_score),
        pro_cash = COALESCE(p_pro_cash, pro_cash),
        pro_del_YN = COALESCE(p_pro_del_YN, pro_del_YN)
    WHERE pro_id = p_pro_id;
END //

DELIMITER ;

select * from pro;

/*
CALL ProUpdateProfile(
    1,
    '정슬기', -- pro_name
    NULL,      -- pro_nickname (업데이트하지 않음)
    NULL,      -- pro_email (업데이트하지 않음)
    NULL, -- pro_pw
    NULL,      -- pro_tel (업데이트하지 않음)
    NULL,        -- pro_career_exp
    NULL,      -- pro_reside_YN (업데이트하지 않음)
    '서울',    -- pro_region
    NULL,      -- pro_pr_id (업데이트하지 않음)
    NULL,      -- pro_total_sales (업데이트하지 않음)
    NULL,      -- pro_score (업데이트하지 않음)
    NULL,      -- pro_cash (업데이트하지 않음)
    NULL       -- pro_del_YN (업데이트하지 않음)
);
-- 1번 유저에 대해서 pro_name = 정슬기, pro_region = 서울로 수정됨. null입력하면 수정X
*/