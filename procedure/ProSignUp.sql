DELIMITER // -- 회원 가입 시 이메일, 이름, 닉네임, 비밀번호, 전화번호, 지역을 설정해야 한다.
CREATE procedure ProSignUp(in 이메일 varchar(50), in 이름 varchar(30), in 닉네임 varchar(30), in 비밀번호 varchar(100), in 전화번호 varchar(20),
                           in 지역 enum('서울', '경기 북부', '경기 남부', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주', '해외'))
BEGIN
    -- pro와 client 두 테이블 모두 조회하여 전역에서 unique한 값인지 확인한다.
    if ((select count(*) from client where client_email = 이메일)) > 0 || ((select count(*) from pro where pro_email = 이메일)) > 0 then
        select '사용 중인 이메일입니다.';
    elseif ((select count(*) from client where client_tel = 전화번호)) > 0 || ((select count(*) from pro where pro_tel = 전화번호)) > 0 then
        select '사용 중인 번호입니다.';
    elseif ((select count(*) from client where client_nickname = 닉네임)) > 0 || ((select count(*) from pro where pro_nickname = 닉네임)) > 0 then
        select '사용 중인 닉네임입니다.';
    else
        insert into pro(pro_email, pro_name, pro_nickname, pro_pw, pro_tel, pro_region) values (이메일, 이름, 닉네임, 비밀번호, 전화번호, 지역);
    end if;
END //
DELIMITER ;