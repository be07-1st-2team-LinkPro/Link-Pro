-- 구매자 프로필 수정
-- 구매자는 자신의 프로필 화면에서

-- 이름, 닉네임, 비밀번호, 전화번호, 거주지역
-- 정보를 수정할 수 있다

-- 아이디, 탈퇴여부
-- 정보는 구매자 측에서 조회가 불가능하다

-- 이메일, 보유캐시
-- 정보는 구매자가 스스로 수정할 수 없다

DELIMITER //
CREATE PROCEDURE ClientUpdateProfile(
    IN 아이디 BIGINT,
    IN 이름 VARCHAR(30),
    IN 닉네임 VARCHAR(30),
    IN 비밀번호 VARCHAR(30), 
    IN 전화번호 VARCHAR(20),
    IN 거주지역 ENUM('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외')
)
BEGIN
    UPDATE client
    SET
        client_name = COALESCE(이름, client_name),
        client_nickname = COALESCE(닉네임, client_nickname),
        client_pw = COALESCE(비밀번호, client_pw),
        client_tel = COALESCE(전화번호, client_tel),
        client_region = COALESCE(거주지역, client_region),
    WHERE client_id = 아이디;
END //
DELIMITER ;
